#!/bin/sh

echo "waiting for db"
bash -c 'while !</dev/tcp/postgres/5432; do sleep 1; done;'

echo "bundle installation"
bundle check || bundle install

echo "database migartion"
bundle exec rails db:create
bundle exec rails db:schema:load
bundle exec rails db:migrate

set -e

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

exec "$@"
