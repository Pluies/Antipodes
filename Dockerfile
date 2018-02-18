FROM ruby:2.2

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install
COPY . .
CMD ["bundle", "exec", "./script/rails", "s", "-e", "production"]
