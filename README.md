# demo-atlas-terraform
Simple demo of cluster creation in MongoDB Atlas using Terraform 

## Pre-requirements
- MongoDB Atlas account
  - Create an account on [MongoDB Atlas](https://cloud.mongodb.com) 
- Install Terraform
  - [Terraform installation guide ](https://developer.hashicorp.com/terraform/install?product_intent=terraform) and install it

## How to use it

1. Create API Keys in MongoDB Atlas

Read documentation about how to [Grant Programmatic Access to MongoDB Atlas](https://www.mongodb.com/docs/atlas/configure-api-access/#grant-programmatic-access-to-service)

2. Clone repository
```
git clone https://github.com/alxmancilla/demo-atlas-terraform.git
```

3. Change local variables values in variables.tf file


4. Initialize your Terraform environment
```
terraform init
```

5. Execute it
```
terraform apply
```

