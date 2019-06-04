# CloudFormation template to "Create CodeBuild project with required IAM/SG/SSM/CW Logs configuration and S3/DynamoDB for Terraform"

## Preparations
* ensure access from your VPC to the following AWS services: logs, ssm, s3 (either through the proxy or create VPC Endpoints)

## Environment variables of CodeBuild project that can be used to controll Terraform
* TERRAFORM_ACTION (`create`, `destroy`, `plan` or `show` - default is `create`, `plan` will just generate plan and skip apply)
* TERRAFORM_DELAY_SECONDS (delay before `terraform apply`, allows to read the plan - default: 10 seconds)

## Notes
* parameters can be adjusted after CFN deployment via AWS Systems Manager Parameter Store
* separate configuration repository is not necessary (and optional) for this bootstrap as it is generated on-the-fly from `bootstrap/configuration_repo_template` and parameters passed
  via CloudFormation (that are collected in `terraform.tfvars`)