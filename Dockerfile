FROM ruby:2.2

RUN bundle install
CMD ["bundle", "exec", "./script/rails", "s", "-e", "production"]
