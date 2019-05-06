# Bootstrap for NLB proxy setup

This repo servers as an entry-point containing documentation and IAM policies
required to prepare Codepipeline, ECR registry with custom Haproxy image for NLB proxy automated configuration.

## PREREQUISITES

1. AWS accounts created with administrative role

2. git and ssh clients on your laptop/workstation

3. Access to BMW Bitbucket repository:

    ```shell
    git clone https://160.48.66.47:7999/cloudhubmod/bmw-tf-nlb-proxy.git
    ```
    (alternatively use web browser to download repo from BitBucket site)

3. Edit template or put own task definition for Fargate service in `/task-definitions/service.json`

## NOTES

* Currently HAproxy image is available with configuration for AWS Fargate

* There is known limitation of ECS service, which can expose one port per service at ECS cluster (Fargate)

## STEPS

1. Create CodeCommit repository and CodeBuild project to store and build proxy image .

* use CloudFormation template CodeCommit_Repository.yaml from `/cfn/` folder

2. Upload Dockerfile and haproxy.cfg and trigger docker image build.

* use can you templates from the main folder

3. Create CodePipeline which use invoke Terraform scripts to build containers with custom image.

* use CloudFormation template CodePipeline_HAproxy.yaml from `/cfn/` folder

## Troubleshooting
