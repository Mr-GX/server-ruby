#!/bin/bash
source ~/.bash_profile
DIR=/disk1/rails/dev
cd $DIR
bundle install
RAILS_ENV=development rake db:migrate
RAILS_ENV=development rake assets:precompile
passenger stop -p 3000
passenger start -p 3000 -e development -d