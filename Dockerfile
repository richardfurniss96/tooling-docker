FROM ubuntu:latest

# Install packages
RUN apt-get update && apt-get upgrade && apt install -y \
 curl \
 wget \
 vim \
 unzip \
 python3 \
 git

# Install Helm
RUN curl -LO https://get.helm.sh/helm-v3.10.0-linux-arm64.tar.gz && \
 tar -zxvf ./helm-v3.10.0-linux-arm64.tar.gz && \
 mv linux-arm64/helm /usr/local/bin/helm && \
 chmod +x /usr/local/bin/helm && \
 rm -rf ./helm-v3.10.0-linux-arm64.tar.gz

# Install Kubectl
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" && \
 install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
 
# Install awcli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
 unzip awscliv2.zip && \
 ./aws/install -i /usr/local/aws-cli -b /usr/local/bin

# Install tfenv
RUN git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv && \
 ln -s ~/.tfenv/bin/* /usr/local/bin

# Alias
RUN echo 'alias k="/usr/local/bin/kubectl"' >> ~/.bashrc