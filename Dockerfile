FROM ruby:3.2.0

RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client

ADD . /test2
WORKDIR /test2
RUN bundle install

EXPOSE 3000

CMD ["bash"]