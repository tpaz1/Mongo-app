# Mongo-app
## Deploying a MongoDB and Mongo Express application

In this tutorial we are going to `deploy` `MongoDB` and `Mongo Express` applications using the following `Kubernetes` components: 
* [`Service` type `clusterIp`](https://github.com/tpaz1/Mongo-app/blob/main/app/03-mongoDB-service.yaml) - an internal service for our `MongoDB` app (no external requests!).
* [`Secret`](https://github.com/tpaz1/Mongo-app/blob/main/app/01-mongoDB-secret.yaml) that contains our DB credentials.
* [`configMap`](https://github.com/tpaz1/Mongo-app/blob/main/app/04-configmap.yaml) that stores our DB url.
* `Deployment` - two Deployments [one](https://github.com/tpaz1/Mongo-app/blob/main/app/02-mongoDB-deployment.yaml) for the `MongoDB` app and [one](https://github.com/tpaz1/Mongo-app/blob/main/app/05-mongo-exp-deployment.yaml) for the `Mongo Express` app. in the Deployment files we are gonna reference both secret and configMap files using `Environment variables` in order to access our DB in a secure way.
* [`Service` type `LoadBalancer`](https://github.com/tpaz1/Mongo-app/blob/main/app/06-mongo-exp-service.yaml) - External service that will allow external requests to our Mongo Express pod.

So with this setup the request flow will look like this:
1. The request comes from the browser.
2. Request goes to the `External service` of the `Mongo Express` which will than forward it to the `Mongo Express` `pod`.
3. `Pod` will then connect to the `internal service` of `MongoDB` (thats basically the DB url from our `configMap`).
4. The service will forward the request to the `MongoDB` pod where it will authenticate using the credentials (from the `secret`).

### Pre requirements
* Running cluster or`minikube` [installed](https://minikube.sigs.k8s.io/docs/start/)
* `kubectl` [installed](https://kubernetes.io/docs/tasks/tools/install-kubectl/)




#### When all this done, feel free to run the runMe file and get the results :)

## Expected results:
![alt text](https://github.com/tpaz1/Mongo-app/blob/main/app/Screenshot%20from%202020-11-02%2022-34-29.png)

