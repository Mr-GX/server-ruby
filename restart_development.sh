#!/bin/bash
source ~/.bash_profile
DIR=/disk1/talenkr/house
cd $DIR
bundle install
RAILS_ENV=house rake db:migrate
RAILS_ENV=house rake assets:precompile
passenger stop -p 3000
passenger start -p 3000 -e house -d