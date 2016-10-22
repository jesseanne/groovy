## BUILDING
##   (from project root directory)
##   $ docker build -t ruby-for-jesseanne-groovy .
##
## RUNNING
##   $ docker run -p 3000:3000 ruby-for-jesseanne-groovy
##
## CONNECTING
##   Lookup the IP of your active docker host using:
##     $ docker-machine ip $(docker-machine active)
##   Connect to the container at DOCKER_IP:3000
##     replacing DOCKER_IP for the IP of your active docker host

FROM gcr.io/stacksmith-images/ubuntu-buildpack:14.04-r10

MAINTAINER Bitnami <containers@bitnami.com>

ENV STACKSMITH_STACK_ID="s6pxzk8" \
    STACKSMITH_STACK_NAME="Ruby for jesseanne/groovy" \
    STACKSMITH_STACK_PRIVATE="1"

RUN bitnami-pkg install ruby-2.3.1-2 --checksum 041625b9f363a99b2e66f0209a759abe7106232e0fcc3a970958bf73d5a4d9b0

ENV PATH=/opt/bitnami/ruby/bin:$PATH

## STACKSMITH-END: Modifications below this line will be unchanged when regenerating

# Ruby on Rails template
ENV RAILS_ENV=development

COPY Gemfile* /app/
WORKDIR /app

RUN bundle install --without production

COPY . /app

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
