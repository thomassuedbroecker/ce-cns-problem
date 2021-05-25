#!/bin/bash
REPOSITORY=tsuedbroecker

cd ..
export ROOT_PATH=$(PWD)

echo "************************************"
echo " web-app"
echo "************************************"
cd $ROOT_PATH/web-app
docker login quay.io
docker build -t "quay.io/$REPOSITORY/web-app-ce:v2" -f Dockerfile.os4-webapp .
docker push "quay.io/$REPOSITORY/web-app-ce:v2"

echo ""

echo "************************************"
echo " articles"
echo "************************************"
cd $ROOT_PATH/articles
docker login quay.io
docker build -t "quay.io/$REPOSITORY/articles-ce:v2" -f Dockerfile .
docker push "quay.io/$REPOSITORY/articles-ce:v2"

echo ""

echo "************************************"
echo " web-api"
echo "************************************"

cd $ROOT_PATH/web-api
docker login quay.io
docker build -t "quay.io/$REPOSITORY/web-api-ce:v6" -f Dockerfile .
docker push "quay.io/$REPOSITORY/web-api-ce:v6"