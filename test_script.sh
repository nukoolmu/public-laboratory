
echo "Route Traffic via F5 (Whitelist IP)"
# F5 IPs is 172.16.238.14 and proxy_pass to 172.16.238.15 (Forwarder) 
# Expect result remote_addr = 172.16.238.14, x-forwarded-for = 172.16.238.10 (3BB_Client1)
docker exec -it public-laboratory_3bb_client1_1 curl -iG 172.16.238.14/ 
# Expect result remote_addr = 172.16.238.14, x-forwarded-for = 172.16.238.11 (3BB_Client2)
docker exec -it public-laboratory_3bb_client2_1 curl -iG 172.16.238.14/ 
echo  '-----'
echo "Route Traffic via AIS (Non-Whitelist IP)"
# Direct to Forwarder
# Expect result remove remote_addr, x-forwarded-for = 1.2.3.4 (That assumption is client IP)
curl -iG 172.16.238.15 -H 'Host: sit.forwarder.lab.com' -H 'X-Forwarded-For: 1.2.3.4'

echo '----'
echo "Pass though be"
# 3BB Network
docker exec -it public-laboratory_3bb_client1_1 curl -i -X POST http://172.16.238.14/be -H "Host: sit.forwarder.lab.com" -H "Content-Type: app5ication/json" -H 'custom_header: myheader' -d '{"name": "mydata"}'
docker exec -it public-laboratory_3bb_client2_1 curl -i -X POST http://172.16.238.14/be -H "Host: sit.forwarder.lab.com" -H "Content-Type: app5ication/json" -H 'custom_header: myheader' -d '{"name": "mydata"}'

# AIS Network
docker exec -it public-laboratory_ais_client1_1 curl -i -X POST http://172.16.238.15/be -H "Host: sit.forwarder.lab.com" -H "Content-Type: app5ication/json"  -H 'X-Forwarded-For: 172.16.238.10' -d '{"name": "mydata"}'
docker exec -it public-laboratory_ais_client1_1 curl -i -X POST http://172.16.238.15/be -H "Host: sit.forwarder.lab.com" -H "Content-Type: app5ication/json"  -H 'X-Forwarded-For: 172.16.238.11' -d '{"name": "mydata"}'