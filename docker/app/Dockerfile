FROM ruby:3.1.2

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs shared-mime-info curl imagemagick npm
RUN npm install --global yarn

# Setting env up
ENV RAILS_ROOT=/var/app
ENV RAILS_ENV=production
RUN mkdir -p $RAILS_ROOT

# Set working directory, where the commands will be ran:
WORKDIR $RAILS_ROOT

# Adding gems
ADD Gemfile Gemfile
ADD Gemfile.lock Gemfile.lock

RUN gem install bundler:2.4.4
RUN bundle install --jobs 20 --retry 5

# Adding project files
ADD . .
RUN bundle exec rails assets:precompile

#Log Config
RUN ln -sf /dev/stdout $RAILS_ROOT/log/production.log 

ADD docker/app/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]