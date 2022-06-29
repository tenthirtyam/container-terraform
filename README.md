# Container Image for HashiCorp Terraform

## Overview

Provides a container image for running HashiCorp Terraform.

This image includes the following components:

Component | Version | Description
---------|----------|----------
VMware Photon OS | 4.0 | A Linux container host optimized for vSphere and cloud-computing platforms.
HashiCorp Terraform | 1.2.4 | Terraform is an open-source infrastructure-as-code software that enables you to safely and predictably create, change, and improve infrastructure.

## Get Started

Run the following to download the latest container from Docker Hub:

```hcl
docker pull tenthirtyam/terraform:latest
```

Run the following to download a specific version from Docker Hub:

```hcl
docker pull tenthirtyam/terraform:x.y.z
```

Open an interactive terminal:

```hcl
docker run --rm -it tenthirtyam/terraform
```

Run a local plan:

```console
  cd /Users/tenthirtyam/terraform/my-plan
  docker run --rm -it --name terraform -v $(pwd):/tmp -w /tmp tenthirtyam/terraform init
```

Where `/Users/tenthirtyam/terraform/my-plan` is the local directory path for your Terraform configurations.
