#!/bin/bash
mvn clean install

rm -rf  server-product/target/docker
cp -r   server-product/docker server-product/target/docker
buildVersion=`ls server-product/target/onedev-*.zip|sed -e 's/server-product\/target\/onedev-\(.*\).zip/\1/'`

unzip server-product/target/onedev-$buildVersion.zip -d server-product/target/docker
mv server-product/target/docker/onedev-$buildVersion server-product/target/docker/app
cp -r server-product/target/agent server-product/target/docker/

sed -i 's~COPY app /app~COPY server-product/target/docker/app /app~' ./server-product/target/docker/Dockerfile.server
sed -i 's~COPY idle.sh /root/bin/~COPY server-product/target/docker/idle.sh /root/bin/~' ./server-product/target/docker/Dockerfile.server
sed -i 's~COPY entrypoint-server.sh /root/bin/entrypoint.sh~COPY server-product/target/docker/entrypoint-server.sh /root/bin/entrypoint.sh~' ./server-product/target/docker/Dockerfile.server

sed -i 's~COPY agent /agent~COPY server-product/target/docker/agent /agent~' ./server-product/target/docker/Dockerfile.agent
sed -i 's~COPY entrypoint-agent.sh /root/bin/entrypoint.sh~COPY server-product/target/docker/entrypoint-agent.sh /root/bin/entrypoint.sh~' ./server-product/target/docker/Dockerfile.agent

docker build -f server-product/target/docker/Dockerfile.server  -t elestio4test/1dev_server:latest .
docker build -f server-product/target/docker/Dockerfile.agent -t elestio4test/1dev_agent:latest .