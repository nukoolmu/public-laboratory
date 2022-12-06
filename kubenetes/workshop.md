# This is  Hackathon

1. Create pod name 'app-api' from image 'nukoolm/myexample:app-a'
2. Create Service Discrovery type clusterIP

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app.kubernetes.io/name: app-api
  ports:
    - protocol: TCP
      port: 80
      targetPort: 3000
```

3. Create Service Discrovery type Loadbalancer
4. Creat NewPod from above from image 'nukoolm/myexample:app-b'
5. Create Service Discrovery type Loadbalancer for both pods