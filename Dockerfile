## BUILDING
##   (from project root directory)
##   $ docker build -t jetty-for-jesseanne-groovy .
##
## RUNNING
##   $ docker run -p 8080:8080 jetty-for-jesseanne-groovy
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:8080
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="zaa8gc3" \
    STACKSMITH_STACK_NAME="Jetty for jesseanne/groovy" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install java-1.8.0_111-0 --checksum a40aa0c9553e13bd8ddcc3d2ba966492b79d4f73d47cb1499c9ec54f441201eb
RUN bitnami-pkg install jetty-9.3.13.v20161014-0 --checksum d0f58f5291d42df6e590cae3fa52ea284dac366278f2e8ca74e82389f2cd7142

ENV PATH=/opt/bitnami/java/bin:$PATH \
    JAVA_HOME=/opt/bitnami/java \
    JETTY_BASE=/opt/bitnami/jetty

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Jetty server template
RUN ln -s $JETTY_BASE/webapps /app
WORKDIR /app
COPY . /app

EXPOSE 8080
CMD ["nami", "start", "--foreground", "jetty"]
