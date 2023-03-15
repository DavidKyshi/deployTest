#!/usr/bin/env sh
set -ex
IMAGE_TAG=$(git rev-parse --short HEAD)
IMAGE_NAME="kyshi-ops-portal"
GCP_SERVICE_NAME=${IMAGE_NAME}-dev
GCP_PROJECT_NAME="kyshi-dev"

>&2 echo "Creating a docker image from the latest commit"
docker build . -t ${IMAGE_NAME}:"${IMAGE_TAG}"

>&2 echo "Pushing and deploying the image to GCP service $GCP_SERVICE_NAME"
docker tag ${IMAGE_NAME}:"${IMAGE_TAG}" gcr.io/${GCP_PROJECT_NAME}/${IMAGE_NAME}:"${IMAGE_TAG}"
docker push gcr.io/${GCP_PROJECT_NAME}/${IMAGE_NAME}:"${IMAGE_TAG}"
gcloud beta run deploy $GCP_SERVICE_NAME --image gcr.io/${GCP_PROJECT_NAME}/${IMAGE_NAME}:"${IMAGE_TAG}" \
  --project $GCP_PROJECT_NAME \
  --platform managed \
  --region europe-west2 \
  --allow-unauthenticated \
  --vpc-connector kyshi-dev \
  --cpu 1 \
  --memory 1Gi
