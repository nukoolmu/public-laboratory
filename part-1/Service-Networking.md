# Services, Load Balancing, and Networking

## Service 

Expose an application running in your cluster behind a single outward-facing endpoint, even when the workload is split across multiple backends.

![Services](../images/1_tnK94zrEwyNe1hL-PhJXOA.png)


Type of Services
1. ClusterIP: Exposes the Service on a cluster-internal IP. Choosing this value makes the Service only reachable from within the cluster. This is the default ServiceType.
2. NodePort: Exposes the Service on each Node's IP at a static port (the NodePort). A ClusterIP Service, to which the NodePort Service routes, is automatically created. You'll be able to contact the NodePort Service, from outside the cluster, by requesting <NodeIP>:<NodePort>.

3. LoadBalancer: Exposes the Service externally using a cloud provider's load balancer. NodePort and ClusterIP Services, to which the external load balancer routes, are automatically created.
4. ExternalName: Maps the Service to the contents of the externalName field (e.g. foo.bar.example.com), by returning a CNAME record with its value. No proxying of any kind is set up.


## Ingress 
Ingress exposes HTTP and HTTPS routes from outside the cluster to services within the cluster. Traffic routing is controlled by rules defined on the Ingress resource.

[![](https://mermaid.ink/img/pako:eNqNkstuwyAQRX8F4U0r2VHqPlSRKqt0UamLqlnaWWAYJygYLB59KMm_Fxdax-qmGwbuXA7DwAEzzQETXKutof0OPb8uaoUQkwKUu6hi3FwWM_QUHGBt0VFFt8DRQ2OWSGrKUUMlVQwMmhVLEV1Vcm--aUksiuXRaO_CEhkv4WjBvAkG1TrGaLa-iaUw6a0DcwaI-WgOsF7zq-pF881fvRx1UDzeiFq7ghb1kgqFWiElyTjnuXVG74FkbdumefEuuNuRm_4jZ1pqQ7L5fL6YQPb3NiGuyzsGt_-ihNyUkm6YSONWkjVNM8WUIyaeOJJ-upOnDuRDX4ahHMo888XHjA2YyLGKFEOmVjjHHZiOCh7-xmHw1tjtoIMakzDl0FIvXR2-zSlYqXd6_akYJs54yLHvOXWwEjQ8ZIdJS6X9VR-5cNok8fQFDdrgOg)](https://mermaid.live/edit#pako:eNqNkstuwyAQRX8F4U0r2VHqPlSRKqt0UamLqlnaWWAYJygYLB59KMm_Fxdax-qmGwbuXA7DwAEzzQETXKutof0OPb8uaoUQkwKUu6hi3FwWM_QUHGBt0VFFt8DRQ2OWSGrKUUMlVQwMmhVLEV1Vcm--aUksiuXRaO_CEhkv4WjBvAkG1TrGaLa-iaUw6a0DcwaI-WgOsF7zq-pF881fvRx1UDzeiFq7ghb1kgqFWiElyTjnuXVG74FkbdumefEuuNuRm_4jZ1pqQ7L5fL6YQPb3NiGuyzsGt_-ihNyUkm6YSONWkjVNM8WUIyaeOJJ-upOnDuRDX4ahHMo888XHjA2YyLGKFEOmVjjHHZiOCh7-xmHw1tjtoIMakzDl0FIvXR2-zSlYqXd6_akYJs54yLHvOXWwEjQ8ZIdJS6X9VR-5cNok8fQFDdrgOg)

![ingress](../images/ingressfanout.svg)

## Networking 
With Kubernetes, every node has a designated CIDR (Classless Inter-Domain Routing) range of IPs for Pods. This ensures that every Pod receives a unique IP address that other Pods in the cluster can see.

![Network](../images/3internettoservicenets.webp)
