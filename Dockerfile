FROM gcr.io/cloud-builders/docker

RUN apt-get update && \
      apt-get -y install sudo jq wget

ARG CLI_VERSION
RUN wget https://github.com/appsody/appsody/releases/download/$CLI_VERSION/appsody_${CLI_VERSION}_amd64.deb
RUN apt install -f ./appsody_${CLI_VERSION}_amd64.deb

COPY setupAndRunExtract.sh .
RUN chmod +x setupAndRunExtract.sh
