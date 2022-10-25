# Overview of Cloud Native Security

![4c](../images/4c.png)

## The 4C's of Cloud Native Security
คือแนวทางในการ enchance security ใแต่ล่ะ layer

1. Cloud/Co-Lo/Corporate Data Center คือ layer ในการจัดการในส่วนของ Network and compute ของ  Cloud provider แต่ล่ะเจ้า หรือการ manager Data Center on-prem

2. Cluster แบ่งเป็นสองส่วนใหญ่ๆ 
    1. cluster configulation 
    2. application run on cluster

3. container เป็นการจัดการในส่วนของ OS ที่นำมาเป็น base image ว่ามีช่วงโหว่อะไรบ้างที่เป็นอันตราย หรือการ allow privileged user ในการเข้าถึง container

4. Code เป็นการจัดการในส่วนของ source code ไม่ให้มีช่องโหว่ 

---
## Home Work 
1. จง research และอธิบายในหัวข้อดังต่อไปนี้
 - Pod security standards
 - Network policies for Pods
 - Controlling Access to the Kubernetes API
 - Securing your cluster
 - Data encryption in transit for the control plane
 - Data encryption at rest
 - Secrets in Kubernetes
 - Runtime class