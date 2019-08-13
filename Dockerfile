# Latest buildah is buggy use v1.9.0 until this is resolved:
# https://github.com/containers/buildah/issues/1821
FROM quay.io/buildah/stable:v1.9.0
COPY extract.sh .
RUN yum -y update && \
      yum -y install wget
# Matching appsody binary does not exist in upstream.
# Provide the proper version once it is available.
RUN wget https://github.com/appsody/appsody/releases/download/0.X.0/appsody-0.X.0-1.x86_64.rpm
RUN yum localinstall -y ./appsody-0.X.0-1.x86_64.rpm
RUN chmod +x extract.sh
