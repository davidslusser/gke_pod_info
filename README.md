

# create a directory in the Google Artifact Registry
gcloud artifacts repositories create seal --project=atlantean-wares-400723 --repository-format=docker --location=us-central1 --description="Docker repository"


# create the Docker file, tag it, and push it to the Google Artifact Registry
gcloud builds submit --tag us-central1-docker.pkg.dev/atlantean-wares-400723/seal/pod_info .


# apply the k8s deployement, pods, and service
kubectl apply -f deployment.yaml
kubectl apply -f service.yaml


# view pods with kubectl
kubectl get pods


# view deployment with kubectl
kubectl get deployments


# view service with kubectl
kubectl get services


# prerequisites
create a GCP project and note the project ID

install gcloud cli:
    https://cloud.google.com/sdk/docs/install

init gcloud cli and install kubectl:
    https://cloud.google.com/kubernetes-engine/docs/quickstarts/deploy-app-container-image

enable the required GCP APIs
    Artifact Registry API
    Cloud Build API
    Kubernetes Engine API


# references 
https://cloud.google.com/sdk/docs/install#deb
https://cloud.google.com/kubernetes-engine/
https://cloud.google.com/kubernetes-engine/docs/quickstarts/deploy-app-container-image
