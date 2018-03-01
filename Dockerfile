FROM ruby:2.2

COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install
COPY . .
ENV RAILS_ENV=production
RUN rake db:migrate db:seed
CMD ["bundle", "exec", "./script/rails", "s", "-e", "production", "-b", "0.0.0.0"]
