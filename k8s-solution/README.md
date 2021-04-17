# Kubernetes solution

# Approach
The structure of the directory is as follows
```
.
.
├── buildspec.yml
├── codebuild_build.sh
├── codebuild-output
├── cubbit-task.yaml
├── konverted
│   ├── nginx-proxy-config.yaml
│   ├── nginx-proxy-deployment.yaml
│   ├── nginx-proxy-service.yaml
│   ├── react-image-compressor-deployment.yaml
├── nginx-proxy
│   ├── Dockerfile
│   └── nginx-config
│       └── default.conf
├── react-image-compressor
│   └── Dockerfile
├── README.md
└── start_kube.sh
```
The Kubernetes solution echoes the basic philosophy behind the Docker solution. There are a few key differences, though. In order for the setup to be created, I wrote a small bash script because I couldn't figure out a way to run `minikube` commands in the CodeBuild agent. 

As already hinted in the previous paragraph, I decided to go for `minikube`. My reasoning is that minikube is free, there are a lot of useful resources on the internet, it's easy to set up and it's Arch Linux friendly (way more than some of the competitors in the field). 

Essentially, what we have here is that the `start_kube.sh` script starts the `minikube` cluster, triggers the CodeBuild build that builds the required images, then it imports the images in `minikube`, applies the deployment and service objects, sleeps until they warm up and finally opens the default browser on the `clusterIP:NodePort` URL.

# Konverted 

The `konverted` directory stores the configuration created by the `kompose` binary. The task suggested I need to convert the `docker-compose` configuration, so I used `kompose convert` for reference, but I solely relied on the handwritten approach to get to the solution.
