FROM ruby:2.5.0
ENV LANG C.UTF-8
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /usr/local/src/study_k8s_rails
WORKDIR /usr/local/src/study_k8s_rails
ADD . /usr/local/src/study_k8s_rails
ADD Gemfile /usr/local/src/study_k8s_rails/Gemfile
ADD Gemfile.lock /usr/local/src/study_k8s_rails/Gemfile.lock
RUN bundle install --jobs=4
RUN mkdir -p /tmp/public && \
    cp -rf ./public/* /tmp/public
CMD cp -rf /tmp/public/* /usr/local/src/study_k8s_rails/public
