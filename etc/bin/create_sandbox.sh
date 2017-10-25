#!/usr/bin/env bash
if [ $1 ]
then
    unzip sandbox.zip -d ../box/$1 &&
	shopt -s dotglob &&
	mv ../box/$1/vipa/* ../box/$1/ &&
	rm -rf ../box/$1/vipa/ &&
	cd ../box/$1/ &&
	export DATABASE_NAME=vipa_sandbox_$1
	export BASE_HOST=$1.hellovipa.com
	export ELASTICSEARCH_INDEX_NAME=vipa.$1.elastic.index
	export PROJECT_NAME=VIPA SANDBOX $1
	export SESSION_NAME=_VIPA_SANBOX_$1_SESSION
	cat app/config/parameters.yml.box.mustache | mo > app/config/parameters.yml
	php app/console vipa:install --no-interaction --env=prod
	php app/console vipa:install:samples --env=prod
    php app/console h4cc_alice_fixtures:load:sets --env=prod
    php app/console vipa:normalize:translatable:objects --env=prod
    php app/console vipa:mail:events:sync --env=prod
    php app/console vipa:mail:events:sync --sync-desc --env=prod
    php app/console vipa:normalize:journal:article:types --env=prod
    php app/console fos:elastica:populate --env=prod
	echo $(date "+%Y-%m-%d %H:%M:%S") > ./.createtime
fi
