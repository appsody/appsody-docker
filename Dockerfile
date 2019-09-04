FROM gcr.io/cloud-builders/docker
RUN apt-get update && \
      apt-get -y install sudo jq wget
RUN wget https://github.com/appsody/appsody/releases/download/0.4.2/appsody_0.4.2_amd64.deb
COPY setupAndRunExtract.sh .
RUN apt install -f ./appsody_0.4.2_amd64.deb
