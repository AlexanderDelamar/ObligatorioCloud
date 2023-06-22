#! /bin/bash

path="/home/admin/nuevo/ObligatorioCloud/src/"

useraws="454758626479"
region="us-east-1"

array=( adservice cartservice checkoutservice currencyservice emailservice frontend loadgenerator paymentservice productcatalogservice recommendationservice redis shippingservice)

aws ecr get-login-password --region $region | sudo docker login --username AWS --password-stdin $useraws.dkr.ecr.$region.amazonaws.com

for i in "${array[@]}"; do
    if [ $i = "cartservice" ]; then
        sudo docker build -t $i $path$i/src
        sudo docker tag $i:latest $useraws.dkr.ecr.$region.amazonaws.com/obligatorio:$i
        sudo docker push $useraws.dkr.ecr.$region.amazonaws.com/obligatorio:$i
    fi
    sudo docker build -t $i $path$i
    sudo docker tag $i:latest $useraws.dkr.ecr.$region.amazonaws.com/obligatorio:$i
    sudo docker push $useraws.dkr.ecr.$region.amazonaws.com/obligatorio:$i
done