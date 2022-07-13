FROM photon:4.0

LABEL authors="tenthirtyam"

ENV OS_ARCH="amd64"
ENV OS_PACKAGES="wget tar git unzip"
ENV TERRAFORM_VERSION="1.2.5"

# Update reposotories
RUN tdnf update -y

# Install packages
RUN tdnf install -y ${OS_PACKAGES}

# Install HashiCorp Terraform
RUN wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${OS_ARCH}.zip && \
    unzip -o -d /usr/local/bin/ terraform_${TERRAFORM_VERSION}_linux_${OS_ARCH}.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_${OS_ARCH}.zip

# Cleanup
RUN tdnf erase -y unzip && \
    tdnf clean all

WORKDIR ${HOME}

ENTRYPOINT ["terraform"]
