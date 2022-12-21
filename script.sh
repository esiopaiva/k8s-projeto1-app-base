#!bin/bash/

echo "Build das imagens ......." 

docker build -t esiodesync/projeto-backend:1.0 backend/.
docker build -t esiodesync/projeto-backend:1.0 database/.


echo "Envio para o DockerHub das imagens....."

docker push esiodesync/projeto-backend:1.0
docker push esiodesync/projeto-database:1.0

echo "Criando os serviços do cluster Kubernetes ......"

kubectl apply -f . services.yml


echo "Realizando o Deployment......"

kubectl apply -f . deployment.yml