## BUILDING
##   (from project root directory)
##   $ docker build -t tomcat-for-jesseanne-groovy .
##
## RUNNING
##   $ docker run -p 8080:8080 tomcat-for-jesseanne-groovy
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:8080
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="6wo0n7k" \
    STACKSMITH_STACK_NAME="Tomcat for jesseanne/groovy" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install java-1.8.0_111-0 --checksum a40aa0c9553e13bd8ddcc3d2ba966492b79d4f73d47cb1499c9ec54f441201eb
RUN bitnami-pkg install tomcat-8.5.6-0 --checksum b92a3559cd68c207eeb8e4ac28345df940388adc63196cd4a09e170705966d34 -- --username manager --password bitnami

ENV JAVA_HOME=/opt/bitnami/java \
    CATALINA_HOME=/opt/bitnami/tomcat
ENV PATH=$CATALINA_HOME/bin:/opt/bitnami/java/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Tomcat server template
RUN ln -s $CATALINA_HOME/webapps /app
WORKDIR /app
COPY . /app

EXPOSE 8080
CMD ["nami", "start", "--foreground", "tomcat"]
