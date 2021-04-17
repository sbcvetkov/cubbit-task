# Cubbit Task

This repository holds the solution to the task sent to me by Gabriele. 

# Files
The structure of the repository is as follows
```
.
├── docker-solution
│   ├── buildspec.yml
│   ├── codebuild_build.sh
│   ├── codebuild-output
│   ├── docker-compose.yml
│   ├── nginx-proxy
│   │   ├── Dockerfile
│   │   └── nginx-config
│   │       └── default.conf
│   └── react-image-compressor
│       └── Dockerfile
├── k8s-solution
│   ├── buildspec.yml
│   ├── codebuild_build.sh
│   ├── codebuild-output
│   ├── cubbit-task.yaml
│   ├── konverted
│   │   ├── nginx-proxy-config.yaml
│   │   ├── nginx-proxy-deployment.yaml
│   │   ├── nginx-proxy-service.yaml
│   │   ├── react-image-compressor-deployment.yaml
│   │   └── README.md
│   ├── nginx-proxy
│   │   ├── Dockerfile
│   │   └── nginx-config
│   │       └── default.conf
│   ├── react-image-compressor
│   │   └── Dockerfile
│   └── start_kube.sh
├── README.md
└── terraform-solution
    └── main.tf
```
The main directories are:
```
docker-solution 	# holds the solution for the 1st subtask
k8s-solution 		# holds the solution for the 2nd subtask
terraform-solution 	# holds the solution for the 3rd subtask
```
Each of the main directories has a `README.md` file that serves to bring light to the proposed solution and the approach that was used to achieve the result that is being showcased.
