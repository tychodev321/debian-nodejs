# https://hub.docker.com/_/node/
FROM node:18.16.0-slim

LABEL maintainer=""

ENV NODEJS_VERSION=18.16.0 \
    NPM_VERSION=9.6.5 \
    YARN_VERSION=1.22.19 \
    PATH=$HOME/.local/bin/:$PATH \
    npm_config_loglevel=warn \
    npm_config_unsafe_perm=true

# Install Yarn
RUN npm install --global yarn@${YARN_VERSION} \
    && npm config set prefix /usr/local
    
RUN echo "node version: $(node --version)" \
    && echo "npm version: $(npm --version)" \
    && echo "yarn version: $(yarn --version)"

# USER 1001

CMD ["echo", "This is a 'Purpose Built Image', It is not meant to be ran directly"]