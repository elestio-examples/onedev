#!/usr/bin/env bash
rm -f /server-product/docker/docker-compose.yml
cp -rf /server-product/docker/* ./

mv docker-compose-new.yml docker-compose.yml

docker buildx build . -f Dockerfile.server --output type=docker,name=elestio4test/onedev-server:latest | docker load
