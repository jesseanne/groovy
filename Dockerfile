## BUILDING
##   (from project root directory)
##   $ docker build -t node-js-for-jesseanne-groovy .
##
## RUNNING
##   $ docker run -p 3000:3000 node-js-for-jesseanne-groovy
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:3000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="kvf6kcz" \
    STACKSMITH_STACK_NAME="Node.js for jesseanne/groovy" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install node-6.9.1-0 --checksum a16ddf7062d09d932b46bf95763d9e3e473f278cebc64161f44fed0e04b6463d

ENV PATH=/opt/bitnami/node/bin:/opt/bitnami/python/bin:$PATH \
    NODE_PATH=/opt/bitnami/node/lib/node_modules

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# ExpressJS template
COPY . /app
WORKDIR /app

RUN npm install

EXPOSE 3000
CMD ["npm", "start"]
