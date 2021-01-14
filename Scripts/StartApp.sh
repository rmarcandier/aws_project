#!/bin/bash
docker rm -f hello_world
docker rmi -f 615196324256.dkr.ecr.eu-west-2.amazonaws.com/app_01
aws ecr get-login-password --region eu-west-2 | docker login --username AWS --password-stdin 615196324256.dkr.ecr.eu-west-2.amazonaws.com
docker run -dit --name hello_world -p 80:8000 615196324256.dkr.ecr.eu-west-2.amazonaws.com/app_01
