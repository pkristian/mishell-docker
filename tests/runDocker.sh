#!/usr/bin/env bash

# current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cd $DIR


##### prepareTestRepo START
mkdir mishell
rm -rf mishell/www/foo
mkdir mishell/www/foo

cd	mishell/www/foo \
&&	git init \
&&	git remote add origin git@github.com:pkristian/mishell.git \
&&	git fetch origin testDeploy-one \
&&	git checkout -f origin/testDeploy-one

cd $DIR

cp -R mishell/www/foo/ mishell/www/bar/ \
&&	cp -R mishell/www/foo/ mishell/www/baz/

#### prepare test repo END
cd $DIR

#run itself

docker-compose up --build --force-recreate
