# About
This repo contains code and instructions on creating a Kubernetes cluster in GKE and running a simple web application that display some basic pod information including: pod name, node name, pod namespace, and pod IP address.

<br/>

## Prerequisites
Using these instructions/commands requires a GCP account, installation of the gcloud CLI, and installation of kubectl, and enabling applicable GCP APIs. See the following for more details:

- install gcloud cli:
    https://cloud.google.com/sdk/docs/install

- init gcloud cli and install kubectl:
    https://cloud.google.com/kubernetes-engine/docs/quickstarts/deploy-app-container-image

The following GCP APIs will need to be enabled:

    - Artifact Registry API
    - Cloud Build API
    - Kubernetes Engine API

<br/>

## Steps to manually create a cluster and deploy the web app

### Create a repo in Google Artifact Registry
```
gcloud artifacts repositories create demo --project=<your_project_id> --repository-format=docker --location=us-central1 --description="Docker repository"
``````

### Create the Docker file, tag it, and push it to Google Artifact Registry
```
gcloud builds submit --tag us-central1-docker.pkg.dev/<your_project_id>/demo/pod_info .
```

### Create a k8s cluster with three nodes
```
gcloud container clusters create my-cluster --num-nodes 3
```

### Apply the k8s deployement, pods, and service
```
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml
```

### View pods with kubectl
```
kubectl get pods
```

### View deployment with kubectl
```
kubectl get deployments
```

### View service with kubectl
```
kubectl get services
```

<br/>

## References 
- https://cloud.google.com/sdk/docs/install#deb
- https://cloud.google.com/kubernetes-engine/
- https://cloud.google.com/kubernetes-engine/docs/quickstarts/deploy-app-container-image
