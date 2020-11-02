kubectl kustomize app | kubectl apply -f -
sleep 45
minikube service mongo-exp-service
