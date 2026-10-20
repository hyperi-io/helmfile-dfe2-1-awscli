# helmfile with the AWS CLI, for DFE 2.1 deployments.
# The base is the image the old JFrog utils/helmfile tags were built on.
FROM ghcr.io/helmfile/helmfile-ubuntu:v1.1.5@sha256:0e0de6022a406840644e4a0d901cad5489184987b63e26699b3fd325ca7eaede

# The base is Ubuntu 24.10, end of life since 2025-07, so its packages live on old-releases.
RUN sed -i -E 's#http://(archive|security|ports)\.ubuntu\.com/ubuntu(-ports)?/?#http://old-releases.ubuntu.com/ubuntu/#' \
      /etc/apt/sources.list.d/ubuntu.sources && \
    apt-get update && apt-get install awscli -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# helmfile writes its helm cache under /helm and runs as an arbitrary uid.
RUN chmod -R 777 /helm
