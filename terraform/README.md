- create aws iam user for terraform execution
- configure aws-cli using the iam user access key above
- enter the terraform backend directory.
- Run the terraform apply command to create an aws s3 bucket for the terraform backend.
    
    ```jsx
    terraform apply
    ```
    
- reconfigure the terraform backend to the aws s3 that we have created above.
    
    ```json
    terraform {
      backend "s3" {
        encrypt        = true
        bucket         = "tf-state-061051262837"
        key            = "devops/backend/terraform.tfstate"
        region         = "ap-southeast-1"
      }
    }
    ```
    
- Run the terraform init command to move the terraform state from local to aws s3.
    
    ```json
    terraform init
    ```
    
- enter the terraform core directory, in the core dir there is a configuration to create VPC, subnet, igw, nacl, security group and routing table.
- create a new terraform workspace with the name staging, because currently we plan to create aws infra for staging development
    
    ```json
    terraform workspace new staging
    ```
    
- use terraform workspace staging
    
    ```json
    terraform workspace select staging
    ```
    
- run the terraform init command
- run the terraform plan command
- run the terraform apply command
    
    ```json
    terraform init
    terraform plan
    terraform apply
    ```
    
- enter the ec2 directory, and do the same thing as in the core directory.
- after terraform apply in the ec2 directory, a list of public ip ec2 will be displayed that has been deployed, use the public ip to access the ec2 instance.
    
    ```json
    ...
    Apply complete! Resources: 5 added, 0 changed, 0 destroyed.
    
    Outputs:
    
    bation_public_ip = "47.129.183.47"
    ssh_keypair = [
      "devops-staging",
    ]
    webapp_private_ip = "10.104.33.107"
    ```
    

[readme](https://www.notion.so/readme-8869bd5d427e42c192d35dd63dcb37c7?pvs=21)

[case 3](https://www.notion.so/case-3-076512d493bc49bca51734b3daef4a3e?pvs=21)