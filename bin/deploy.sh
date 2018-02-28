#!/usr/bin/env bash

TIMESTAMP=`date +'%s'`

# Nginxのイメージを作成する
docker build -t "study/web:$TIMESTAMP" ./docker/nginx

# Railsイメージを作成する
docker build -t "study/app:$TIMESTAMP" .

# デプロイを実行する
rm -f ./kubernetes/deployment/web.yaml
cp ./kubernetes/deployment/web.yaml.bak ./kubernetes/deployment/web.yaml
sed -i '' "s/TIMESTAMP/$TIMESTAMP/g" ./kubernetes/deployment/web.yaml
kubectl apply -f ./kubernetes/deployment/web.yaml
rm -f ./kubernetes/deployment/web.yaml
