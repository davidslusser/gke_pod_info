# get gcloud project_id
project_id=$(gcloud config get-value project)
echo "INFO: using project ${project_id}"


# create the GKE cluster
echo "INFO: create k8s cluster"
gcloud container clusters create my-cluster --num-nodes 3

# create a respository for artifacts
echo "INFO: create Google Artifact Registry"
gcloud artifacts repositories create demo \
    --project=$project_id \
    --repository-format=docker \
    --location=us-central1 \
    --description="Docker repository"


# create the Docker file, tag it, and push it to the Google Artifact Registry
echo "INFO: build Docker image and push to Google Artifact Registry"
gcloud builds submit --tag us-central1-docker.pkg.dev/$project_id/demo/pod_info .


# apply the k8s deployement, pods, and service
echo "INFO: creating deployment"
kubectl apply -f ./k8s/deployment.yaml
echo "INFO: creating service"
kubectl apply -f ./k8s/service.yaml
echo "INFO: wait a few minutes for the service creation to complete, then get the external IP via the `kubectl get services` command"
