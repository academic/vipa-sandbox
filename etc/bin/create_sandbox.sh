#!/usr/bin/env bash
if [ $1 ]
then
    unzip sandbox.zip -d ../box/$1 &&
	shopt -s dotglob &&
	mv ../box/$1/baboon/* ../box/$1/ &&
	rm -rf ../box/$1/baboon/
	echo $(date "+%Y-%m-%d %H:%M:%S") > ../box/$1/.createtime
fi
