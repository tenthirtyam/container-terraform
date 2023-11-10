FROM photon:5.0

LABEL authors="tenthirtyam"

ENV OS_ARCH="amd64"
ENV OS_PACKAGES="wget tar git unzip"
ARG TERRAFORM_VERSION="1.6.3"

RUN tdnf update -y && \
    tdnf install -y ${OS_PACKAGES} && \
    wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_${OS_ARCH}.zip && \
    unzip -o -d /usr/local/bin/ terraform_${TERRAFORM_VERSION}_linux_${OS_ARCH}.zip && \
    rm terraform_${TERRAFORM_VERSION}_linux_${OS_ARCH}.zip && \
    tdnf erase -y ${OS_PACKAGES} && \
    tdnf clean all

WORKDIR ${HOME}

ENTRYPOINT ["terraform"]
