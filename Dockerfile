FROM ruby:3.1.2-bullseye as base

RUN apt-get update -qq && apt-get install -y build-essential apt-utils libpq-dev nodejs

WORKDIR /app

RUN gem install bundler

COPY Gemfile* ./

RUN bundle install

COPY . /app


EXPOSE 3000

CMD rake db:migrate && rails server -b 0.0.0.0
