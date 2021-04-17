# Terraform solution

# Approach
The structure of the directory is as follows
```
.
├── main.tf
└── README.md
```
The Terraform solution is very basic compared to the rest. I relied on modules I found on the Internet and the reason is that I would do the same thing if I was in a real-world practical situation. 

The reasoning for that is - why create something from scratch when it's already there and people already use it? I am totally behind creating something from scratch if there is a specific need for it which can't be achieved with resources that are already under disposal. Creating something means it needs to be supported, whereas using community modules means that in most cases they are actively supported. This means that if community modules are used all that needs to be done in terms of support of the codebase is to pin a certain version that works and update it as the AWS APIs change over time. 

The `Terraform` solution creates an `ECR` repository, `CodeBuild` resources and an `ECS Fargate` cluster. The `tmknom/terraform-aws-codedeploy-for-ecs` module creates `IAM` Service roles as needed by `CodeBuild` to deploy to `ECS`.

As far as the task question regarding the `IAM` roles goes - it is hard to answer in a straight-forward fashion. It really depends what and how do we want to deploy. By this I mean that there are many types of deployments (Rolling, Blue-Green, etc.) and services (`EKS`, `ECS` - `EC2`, `Fargate`) that can be used. In general sense, we should be including roles that give permissions to modify the target service along with permissions to other correlated services such as `CloudWatch`, `elasticloadbalancing`, etc. 

NOTE: This configuration has not been tested as the task states that the resources do not need to be deployed to a public cloud service. 
