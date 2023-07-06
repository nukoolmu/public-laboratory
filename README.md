# Log server ng as cluster mode

![sol](./src/sol-rec.png)

This architecture we talking about syslogs server as multiple node on multi region (green, orange)

syslog-ng1 and syslog-ng2 are dedicated server (VMs) and install the syslog ng by recommend

ref. https://www.syslog-ng.com/technical-documents/doc/syslog-ng-open-source-edition/3.20/administration-guide/10#TOPIC-1121804


## You can run the server with docker container

```bash
docker run -d   --name=syslog-ng-1   -e PUID=1000   -e PGID=1000   -e TZ=Etc/UTC   -p 1514:5514/udp   -p 1601:6601/tcp  -p 
16514:6514/tcp   -v /app/syslogs-ng/sys-node-1/config:/config   -v /app/syslogs-ng/logs:/var/log `#optional`   --restart unless-stopped   lscr.io/linuxserver/syslog-ng:latest

docker run -d   --name=syslog-ng-2   -e PUID=1000   -e PGID=1000   -e TZ=Etc/UTC   -p 2514:5514/udp   -p 2601:6601/tcp  -p 
26514:6514/tcp   -v /app/syslogs-ng/sys-node-2/config:/config   -v /app/syslogs-ng/logs:/var/log `#optional`   --restart unless-stopped   lscr.io/linuxserver/syslog-ng:latest

docker run -d   --name=syslog-ng-x   -e PUID=1000   -e PGID=1000   -e TZ=Etc/UTC   -p 3514:5514/udp   -p 3601:6601/tcp  -p 
36514:6514/tcp   -v /app/syslogs-ng/sys-node-x/config:/config   -v /app/syslogs-ng/sys-node-x/log:/var/log `#optional`   --restart unless-stopped   lscr.io/linuxserver/syslog-ng:latest

```

In This Workshop syslog-ng1 and syslog-ng2 are docker container, There write out the logs to file in share path '/app/syslog-ng/logs'


syslog-ng.conf as syslogs-ng1

```bash
#############################################################################
# Default syslog-ng.conf file which collects all local logs into a
# single file called /var/log/messages tailored to container usage.

@version: 4.1
@include "scl.conf"

source s_local {
  internal();
};

source s_network_tcp {
  syslog(transport(tcp) port(6601));
};

source s_network_udp {
  syslog(transport(udp) port(5514));
};

destination d_cluster {
  file("/var/log/messages-kv.log" template("$ISODATE $HOST $(format-welf --scope all-nv-pairs)\n") frac-digits(3));        
};

destination d_remote {
    udp("10.x.x.x" port(3514));
};

log {
  source(s_local);
  source(s_network_tcp);
  source(s_network_udp);
  destination(d_cluster);
  destination(d_remote);
};
```

syslog-ng.conf as syslogs-ng2
```bash
#############################################################################
# Default syslog-ng.conf file which collects all local logs into a
# single file called /var/log/messages tailored to container usage.

@version: 4.1
@include "scl.conf"

source s_local {
  internal();
};

source s_network_tcp {
  syslog(transport(tcp) port(6601));
};

source s_network_udp {
  syslog(transport(udp) port(5514));
};

destination d_cluster {
  file("/var/log/messages-kv.log" template("$ISODATE $HOST $(format-welf --scope all-nv-pairs)\n") frac-digits(3));        
};

destination d_remote {
    udp("10.x.x.x" port(3514));
};

log {
  source(s_local);
  source(s_network_tcp);
  source(s_network_udp);
  destination(d_cluster);
};

```

and syslog-ngx we assume that is another server as the green side, it'll be recived the input from syslog-ng1 and syslog-ng2 and wirte out to the file in path '/app/syslogs-ng/sys-node-x/log'

syslog-ng.conf as syslogs-ngx

```bash

#############################################################################
# Default syslog-ng.conf file which collects all local logs into a
# single file called /var/log/messages tailored to container usage.

@version: 4.1
@include "scl.conf"

source s_local {
  internal();
};

source s_network_tcp {
  syslog(transport(tcp) port(6601));
};

source s_network_udp {
  syslog(transport(udp) port(5514));
};

destination d_cluster {
  file("/var/log/messages-kv.log" template("$ISODATE $HOST $(format-welf --scope all-nv-pairs)\n") frac-digits(3));        
};

log {
  source(s_local);
  source(s_network_tcp);
  source(s_network_udp);
  destination(d_cluster);
};

```

as the load balancer , We use the nginx to forward udp protocal


/etc/nginx/nginx.conf

```bash
user  nginx;
worker_processes  auto;

error_log  /var/log/nginx/error.log notice;
pid        /var/run/nginx.pid;


events {
    worker_connections  1024;
}


http {
    include       /etc/nginx/mime.types;
    default_type  application/octet-stream;

    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';

    access_log  /var/log/nginx/access.log  main;

    sendfile        on;
    #tcp_nopush     on;

    keepalive_timeout  65;

    #gzip  on;

    include /etc/nginx/conf.d/*.conf;
}

stream {

    upstream syslog_servers {
        least_conn;
        server 10.x.x.x:1514;
        server 10.x.x.x:2514;
    }


    server {
        listen     514 udp;
        proxy_pass syslog_servers;
    }

}
```

and start the nginx by docker containner

```bash
docker run -d --name logical-lb -p 514:514 -v /app/syslogs-ng/logical-lb/conf/nginx.conf:/etc/nginx/nginx.conf nginx
```

configure rsyslog.conf as client server to feed logs to logical-lb

/etc/rsyslog.conf add the last line
```bash
### LAB-SYSLOGS ##
auth.info,authpriv.info,cron.info,user.info @10.x.x.x:514
```

restart rsyslogs service `systemctl restart rsyslog`