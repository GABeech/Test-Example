/usr/bin/env bash

function getAuth()
{
  gcloud container clusters get-credentials $CLUSTER --location $CLUSTER_LOCATION
  if [[ $? != 0 ]]
  then
    echo "error getting GCP auth"
    exit 2
  fi
}


function deployFrontEnd()
{
  if [[ -z "$1" ]]
  then
    echo "No Docker image specified"
    exit 3
  fi
  kubectl create deployement $CLUSTER --image="$1"
}


# Check to make sure we have all the info we need before deploying
if [[ -z "$CLUSTER" ]]
then
  echo "Please set the 'CLUSTER' Environment Variable"
  exit 1
fi

if [[ -z "$CLUSTER_LOCATION" ]]
then
  echo "Please set the 'CLUSTER_LOCATION' environment variable"
  exit 1
fi

if [[ -z "$IMAGE_NAME" ]]
then
  echo "Please set the 'IMAGE_NAME' environment variable"
  exit 1
fi

if [[ -z "$REGISTRY" ]]
then
  echo "Please set the 'REGISTRY' environment variable"
  exit 1
fi
BACKEND_IMAGE="${REGISTRY}:${IMAGE_NAME}
getAuth
deployFrontEnd $BACKEND_IMAGE



