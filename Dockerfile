FROM ruby:3.2

WORKDIR /workspace
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock

RUN bundle install
COPY . /workspace
ENV RAILS_ENV=production
RUN rake assets:precompile db:migrate db:seed
CMD ["bundle", "exec", "./script/rails", "s", "-e", "production", "-b", "0.0.0.0"]
