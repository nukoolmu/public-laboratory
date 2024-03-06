
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