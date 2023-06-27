#! /bin/bash

# Asigno ruta donde van a estar las imagenes
path="./src/"
# Declaro cuenta de AWS 
useraws=""
# Declaro region de AWS
region="us-east-1"
# Declaro version de la imagen
version="latest"
# Nombre del repositorio de ECR
repo="obligatorio"
# Nombre del cluster EKS
cluster="Obli-Cluster"
# Nombre archivo de yaml Kube
archivo="./deploykube/merge.yaml"

# Lista que contiene los servicios a desplegar
array=( adservice cartservice checkoutservice currencyservice emailservice frontend loadgenerator paymentservice productcatalogservice recommendationservice redis shippingservice )

# Autenticacion a docker
aws ecr get-login-password --region $region | sudo docker login --username AWS --password-stdin $useraws.dkr.ecr.$region.amazonaws.com

# Recorro el array con los servicios a desplegar para crear y pushear a ECR las imagenes correspondientes
for service in "${array[@]}"; do
    # Como cartservice tiene la imagen en otra ruta en este IF se la declaramos
    if [ $service = "cartservice" ]; then
        sudo docker build -t $service $path$service/src
        sudo docker tag $service:$version $useraws.dkr.ecr.$region.amazonaws.com/$repo:$service
        sudo docker push $useraws.dkr.ecr.$region.amazonaws.com/$repo:$service
    fi
    sudo docker build -t $service $path$service
    sudo docker tag $service:$version $useraws.dkr.ecr.$region.amazonaws.com/$repo:$service
    sudo docker push $useraws.dkr.ecr.$region.amazonaws.com/$repo:$service
done
#Agrego el accountID al archivo de deployment de kubernetes
sed -i s/imagenr/$useraws/ $archivo
#Logueo al cluster
aws eks --region $region update-kubeconfig --name $cluster
#Despliego los containers
kubectl create -f $archivo
