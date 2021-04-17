# Docker solution

# Approach
The structure of the directory is as follows
```
.
├── buildspec.yml
├── codebuild_build.sh
├── codebuild-output
├── docker-compose.yml
├── nginx-proxy
│   ├── Dockerfile
│   └── nginx-config
│       └── default.conf
├── react-image-compressor
│   └── Dockerfile
└── README.md
```
For the purpose of creating the reverse proxy container along with the React web app, I have created a `docker-compose.yml` file that is the backbone of the setup. It spawns containers from the images that were already created and links them in a way that the nginx container proxies requests made to the react webapp. 

The build and deployment is wrapped in the `buildspec.yml` file that  builds the images and then fires up the `docker-compose.yml` file.

I used alpine as a base image for both of the images due to its small footprint.
