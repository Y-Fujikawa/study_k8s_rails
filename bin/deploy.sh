#!/usr/bin/env bash

#TIMESTAMP=`date +'%s'`

# Nginxのイメージを作成する
docker build -t "study/web:0.5" ./docker/nginx

# Railsイメージを作成する
docker build -t "study/app:0.5" .

# デプロイを実行する
kubectl apply -f ./kubernetes/deployment/web.yaml
