## BUILDING
##   (from project root directory)
##   $ docker build -t wildfly-for-jesseanne-groovy .
##
## RUNNING
##   $ docker run -p 8080:8080 wildfly-for-jesseanne-groovy
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:8080
##     replacing DOCKER_IP for the IP of your active docker host
##
## NOTES
##   This is a prebuilt version of WildFly.
##   For more information and documentation visit:
##     https://github.com/bitnami/bitnami-docker-wildfly

FROM gcr.io/bitnami-containers/wildfly:10.0.0-r0

ENV STACKSMITH_STACK_ID="tfeyphv" \
    STACKSMITH_STACK_NAME="WildFly for jesseanne/groovy" \
    STACKSMITH_STACK_PRIVATE="1" \
    BITNAMI_CONTAINER_ORIGIN="stacksmith"

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating
