#!/usr/bin/env bash

#TIMESTAMP=`date +'%s'`

# Nginxのイメージを作成する
docker build -t "study/web:1.8" ./docker/nginx

# Railsイメージを作成する
docker build -t "study/app:1.8" .

# デプロイを実行する
kubectl apply -f ./kubernetes/deployment/web.yaml
