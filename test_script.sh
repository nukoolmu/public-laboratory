
echo "Route Traffic via F5 (Whitelist IP)"
# F5 IPs is 172.16.238.14 and proxy_pass to 172.16.238.15 (Forwarder) 
# Expect result remote_addr = 172.16.238.14, x-forwarded-for = custom_clientIP 
docker exec -it public-laboratory_3bb_client1_1 curl -iG 172.16.238.14/ 
docker exec -it public-laboratory_3bb_client2_1 curl -iG 172.16.238.14/ 
echo  '-----'
echo "Route Traffic via AIS (Non-Whitelist IP)"
# curl -iG 172.16.238.15 -H 'Host: sit.forwarder.lab.com' -H 'X-Forwarded-For: 1.2.3.4' #In Case custom X-Forwarded-For
# Direct to Forwarder
curl -iG 172.16.238.15 -H 'Host: sit.forwarder.lab.com' 