## Terraform Sandbox - Infrastructure-as-Code Practice Environment

This repository provides a clean, production-grade Terraform layout used to practice and demonstrate Infrastructure-as-Code fundamentals.
It mirrors the structure used by Platform Engineering, SRE, and Cloud Infrastructure teams in real organizations.

### The repo contains:
* A modular Terraform architecture
* Environment-isolated state for dev and prod
* Clean backend definitions using S3 + DynamoDB locking
* A minimal, reusable S3 bucket module
* Support for scaling to additional environments and modules

## Repository Structure
```
terraform/
  envs/
    dev/
      backend.tf
      dev.tfvars
      main.tf
    prod/
      backend.tf
      prod.tfvars
      main.tf

  modules/
    s3_bucket/
      main.tf
      variables.tf
      outputs.tf
README.md
```

### Key Concepts
#### 1. Environment Isolation
Each environment (dev, prod) has:
* Its own backend config
* Its own .tfvars
* Its own Terraform state file

This mirrors real-world IaC setups where dev, staging, and prod are fully separated for safety and correctness.

#### 2. Remote State + Locking
Backends are configured using:
* Amazon S3 for state storage
* DynamoDB for distributed state locking
* This prevents concurrent terraform apply operations and ensures deterministic deployments.

#### 3. Modular Architecture
Reusable modules live under:
```
modules/
```
The s3_bucket module demonstrates:
* Clean input/output variables
* Tagging patterns
* Encapsulation of resource logic
* A consistent API across environments

This structure scales as you add VPC, IAM, ECS, or CloudWatch modules.

### Usage
#### 1. Initialize an Environment
```
cd terraform/envs/dev
terraform init
```
This configures the S3 backend and DynamoDB lock table.

#### 2. Plan Changes
```
terraform plan -var-file=dev.tfvars
``` 

#### 3. Apply Changes
```
terraform apply -var-file=dev.tfvars
```

Repeat the same workflow in envs/prod/ for the production environment.

