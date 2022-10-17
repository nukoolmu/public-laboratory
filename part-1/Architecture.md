# Kubernetes — Architecture Overview

![Architecture](../images/1_kSRH4T8S1YmAuHbpgQ3Ylw.png)

> Kubernetes deployment is called a cluster. A Kubernetes cluster consists of at least one main (control) plane, and one or more worker machines, called nodes. Both the control planes and node instances can be physical devices, virtual machines, or instances in the cloud.


## Control Plane
- Also known as master node or head node.
- The control plane receives input from a CLI or UI via an API.

## Node(s)
- Also known as worker node or compute node.
- Pods are scheduled and orchestrated to run on nodes.
- You can scale up and scale down cluster by adding and removing nodes.

---
## Kubernetes Control Plane Components
### - API Server (kube-apiserver)
    Entry point for REST/kubectl — It is the front end for the Kubernetes control plane.
### - etcd (key-value store)
    It is stateful, persistent storage that stores all of Kubernetes cluster data (cluster state and config).
### - Scheduler (kube-scheduler)
    It watches api-server for newly created Pods with no assigned node, and selects a healthy node for them to run on.
### - Controller Manager (kube-controller-manager)
    It takes corrective steps to make sure that the current state is the same as the desired state.

### - Cloud Controller Manager
    The cloud controller manager integrates with the underlying cloud technologies in your cluster when the cluster is running in a cloud environment.

---
## Kubernetes Node Components
### - kubelet
    It is an agent that runs on each node in the cluster.
### - kube-proxy
    It manages IP translation and routing.
### - Container runtime
    The container runtime is the software that is responsible for running containers (in Pods), I.e Docker.

---
ref. https://medium.com/devops-mojo/kubernetes-architecture-overview-introduction-to-k8s-architecture-and-understanding-k8s-cluster-components-90e11eb34ccd