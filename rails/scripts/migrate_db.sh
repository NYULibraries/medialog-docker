#!/bin/bash

source /home/medialog/.rvm/scripts/rvm
cd /opt/medialog
rvm use default
rake db:migrate
RAILS_ENV=test rake db:migrate
rspec spec