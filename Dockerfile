FROM registry.access.redhat.com/ubi8/ubi-minimal:8.4
# FROM redhat/ubi8/ubi-minimal:8.4

LABEL maintainer="TychoDev <cloud.ops@tychodev.com>"

ENV NODJS_VERSION=14 \
    PATH=$HOME/.local/bin/:$PATH \
    npm_config_loglevel=warn \
    npm_config_unsafe_perm=true

# MicroDNF is recommended over YUM for Building Container Images
# https://www.redhat.com/en/blog/introducing-red-hat-enterprise-linux-atomic-base-image

RUN microdnf update \
    && microdnf module enable nodejs:14 \
    && microdnf install -y nodejs \
    && microdnf install -y npm \
    && microdnf install -y nodejs-nodemon \
    && microdnf clean all \
    && rm -rf /var/cache/* /var/log/dnf* /var/log/yum.*

#USER 1001

RUN node --version && npm --version

CMD ["echo", "This is a 'Purpose Built Image', It is not meant to be ran directly"]