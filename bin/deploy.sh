#!/usr/bin/env bash

#TIMESTAMP=`date +'%s'`

# Nginxのイメージを作成する
docker build -t "study/web:2.0" ./docker/nginx

# Railsイメージを作成する
docker build -t "study/app:2.0" .

# デプロイを実行する
kubectl apply -f ./kubernetes/deployment/web.yaml
