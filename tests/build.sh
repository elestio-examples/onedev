#!/usr/bin/env bash

mvn clean package
rm -f ./server-product/docker/docker-compose.yaml
rm -f ./server-product/docker/build.sh

cd ./server-product/target
rm -rf docker
cp -r ../docker docker
buildVersion=`ls onedev-*.zip|sed -e 's/onedev-\(.*\).zip/\1/'`

unzip onedev-$buildVersion.zip -d docker
mv docker/onedev-$buildVersion docker/app

cd ../../

cp -rf ./server-product/target/docker/* ./

mv docker-compose-new.yml docker-compose.yml
mv Dockerfile.server Dockerfile

docker buildx build . --output type=docker,name=elestio4test/onedev-server:latest | docker load
