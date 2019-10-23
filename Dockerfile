FROM gcr.io/cloud-builders/docker

RUN apt-get update && \
      apt-get -y install sudo jq wget

ARG CLI_VERSION
ENV KUBE_VERSION="v1.11.1"
RUN wget https://storage.googleapis.com/kubernetes-release/release/${KUBE_VERSION}/bin/linux/amd64/kubectl
RUN mv ./kubectl /usr/local/bin
RUN chmod 755 /usr/local/bin/kubectl
RUN wget https://github.com/appsody/appsody/releases/download/$CLI_VERSION/appsody_${CLI_VERSION}_amd64.deb
RUN apt install -f ./appsody_${CLI_VERSION}_amd64.deb

COPY setupAndRunExtract.sh .
RUN chmod +x setupAndRunExtract.sh