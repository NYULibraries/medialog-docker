#!/bin/bash

cd /opt/medialog/
gpg --keyserver hkp://pool.sks-keyservers.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
\curl -sSL https://get.rvm.io | bash
source /home/medialog/.rvm/scripts/rvm
rvm install 2.3.0
gem install bundler -v 1.16.6
bundle config build.pg --with-pg-config=/usr/pgsql-9.4/bin/pg_config
bundle install
