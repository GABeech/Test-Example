# Simple Test on GCP with K8s

This is a simple test on deploying infrastructure into GCP. The outcomes should be:

1. Deploy an autopilot Kubernetes cluster into a project
2. Build and Deploy both the frontend and backend docker containers to the kubernetes clusters
3. Update this readme file describing what is needed to launch the cluster and deploy the images

## Deploy

### Terraform

1. Make sure you are authenticated via gcloud with an account that has access to the project
2. There are a number of variables that need to be set, these can either be set via environment variables `TF_VAR_xxx` or in a TFVAR file.
3. Once the variables are set run `terraform init`, then `terraform plan` to validate that everything is set to run
4. Once you are happy with the output of plan, you can run `terraform apply` to deploy the changes

#### Terraform Variable Reference

```
TF_VAR_gcp_project - The GCP project to deploy to
TF_VAR_gcp_region - The GCP Region to deploy to
TF_VAR_gcp_zone - The Zone inside the GCP region to deploy to
TF_VAR_registry_name - the Docker Registry to configure for docker images
```

### Deploying the front end

1. Set the Environment Variables to the correct values
2. Change into the `src/frontend directory`
3. run `docker build . -t test-image`
4. Change into the `../../scripts` directory
5. Run `deployFrontend.sh`

#### Deployment Variables

```
CLUSTER - The Kubernetes cluster deployed in the Terraform Step
CLUSTER_LOCATION - The location of the Kubernetes Cluster (TF_VAR_gcp_region)
IMAGE_NAME - The name of the built images from Step 3
REGISTRY - The GCP Terraform registry
```

