#!/bin/bash

rvm install 2.0.0
rvm gemset create medialog
rvm alias create default 2.0.0@medialog
rvm use default
gem install bundler -v 1.17.3
cd /opt/medialog/ && bundle install