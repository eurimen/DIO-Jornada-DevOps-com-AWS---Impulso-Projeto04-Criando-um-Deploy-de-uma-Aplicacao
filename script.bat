echo "Criando as imagens......."

docker build -t  eurimen/projeto-backend:1.0 backend/.
docker build -t eurimen/projeto-database:1.0 database/.

echo "realizando o push as imagens....."

docker push eurimen/projeto-backend:1.0
docker push eurimen/projeto-database:1.0

echo "Criando servicos no cluster kurbenetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments....."

kubectl apply -f ./deployment.yml
