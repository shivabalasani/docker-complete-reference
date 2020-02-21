docker build -t sbalasani/multi-client:latest -t sbalasani/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t sbalasani/multi-server:latest -t sbalasani/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t sbalasani/multi-worker:latest -t sbalasani/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push sbalasani/multi-client:latest
docker push sbalasani/multi-server:latest
docker push sbalasani/multi-worker:latest

docker push sbalasani/multi-client:$SHA
docker push sbalasani/multi-server:$SHA
docker push sbalasani/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=sbalasani/multi-server:$SHA
kubectl set image deployments/client-deployment client=sbalasani/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=sbalasani/multi-worker:$SHA