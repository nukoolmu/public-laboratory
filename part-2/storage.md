# Volumes

disk ใน container เรียกว่า ephemeral (หรือพื้นที่ชั่วคราว) เมื่อ container ถูกลบไป ephameral storage ก็จะถูก re-claim จากระบบ

![ephameral](../images/ephameral.drawio.png)


kubernetes มี concept ที่จะเก็บ Data เอาไว้แม้ว่า จะถูกลบไปแล้วก็ตาม เรียกว่า Persistent Volume 

![kubernetes-storage](../images/storage.png)

## Persistent Volume (PV)
เป็น resource ประเภทหนึ่งของ Cluster คล้ายๆ node เองที่เป็น resource ของ cluster
