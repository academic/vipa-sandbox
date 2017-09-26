#!/usr/bin/env bash
rm -rf baboon/
git clone git@github.com:behram/baboon.git &&
cd baboon/ &&
cp app/config/parameters.yml.dist app/config/parameters.yml &&
composer install --no-interaction --prefer-dist &&
php bin/console assetic:dump --env=prod &&
php bin/console baboon:setup:sandbox --env=prod &&
bower install &&
cd .. &&
rm -rf sandbox.zip &&
zip -r sandbox.zip baboon/ &&
rm -rf baboon/
