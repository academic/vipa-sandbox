#!/usr/bin/env bash
rm -rf vipa/
git clone git@github.com:academic/vipa.git &&
cd vipa/ &&
composer install --no-interaction --prefer-dist &&
bower install --force --silent &&
php app/console assetic:dump --env=prod &&
chmod -R 777 app/cache app/logs
cd .. &&
rm -rf sandbox.zip &&
zip -r sandbox.zip vipa/ &&
rm -rf vipa/
