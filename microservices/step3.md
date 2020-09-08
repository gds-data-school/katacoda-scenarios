## Start Kubernetes

Now that we developed and tested the Docker image, we can deploy it on Kubernetes.

First of all, we have to start the minikube istance.

Minikube is a tool that makes it easy to run Kubernetes locally. 
Minikube runs a single-node Kubernetes cluster inside a Virtual Machine (VM) on your laptop (in this case on Katacoda instance).

So, execute the command:

`minikube start`{{execute}}

## Create the deployment

To deploy a microservice on Kubernetes, we need to define a configuration file in yaml or json, that describe the container to create.

You can fine this file already defined in the folder 'server-hello/infra' with the name 'deployment.yml'.

`cd /root/server-hello/infra`{{execute}}

Let's create the deployment

`kubectl create -f deployment.yaml`{{execute}}

## Check the pods status

In the deployment, we tell to Kubernetes to create one container, 'server-hello-container'. 

A container in kubernetes runs on a 'pod'.

Let's check if it was correctly created.

`kubectl get pods`{{execute}}

If you can see a pod with the name 'server-hello-*****' and status Running, ererything were fine.

## Query the pod

As we already did with the docker image, we will now query the running container to check its response.

To contact the service running on Kubernets, we need to find the port where it is listening.

To find the port we need to list the service that expose the application. 

The command to do that is: `kubectl get services`

The following command is surrounded to store the result in an environment variables.

`export PORT=$(kubectl get services | grep server-hello* | awk '{print $5}' | cut -b 4-8)`{{execute}}

To see the result execute:

`echo $PORT`{{execute}}

Now the we have the port, we can query it, replacing the PORT in the following URL.

You can do it just clicking on this:

`echo https://[[HOST_SUBDOMAIN]]-$PORT-[[KATACODA_HOST]].environments.katacoda.com/api/hello`{{execute}}

Copy and paste the result of this command on your browser.

## Check the pod logs

To be sure that the response was served by our pod, we can read the pod logs.

To read them, we need to know the pod id. To find it we can just execute the same commando above:

`export POD_ID=$(kubectl get pods | grep server-hello-* | awk '{print $1}')`{{execute}}

The command is surrounded to save the pod id in an environment variable, to use for the next command.

`kubectl logs $POD_ID`{{execute}}

Now, you should able to see two request received from your IP.

END!