#!/bin/bash 

# start minikube
minikube start

# build the containers using codebuild; might need sudo if running for the first time
sudo ./codebuild_build.sh -i aws/codebuild/standard:5.0 -a codebuild-output

# push the images that were just created to minikube
minikube image load kube-nginx-proxy kube-react-image-compressor

# apply kubernetes resources
kubectl apply -f ./cubbit-task.yaml 

# wait for the resources to come up
sleep 5

# run the cubbit-task service
minikube service cubbit-service
