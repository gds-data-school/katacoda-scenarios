# Overview
The source code for the python server application is available in the folder 'src'. 

Here you can find a python script that use Flask to start the server, a Dockerfile with the docker configuration, and a requirements file that includes the pytjon script dependencies.

You can explore the source code using the editor on the left of the window.

## Create the container from the files

To create a Docker Image, also called container, you can run the following command.

Move in the Dockerfile directorty

`cd server-hello`{{execute}}

Run the build command

`docker build --tag server-hello .`{{execute}}

## Check if the image is correctly created

With the command 'images' you can list all of the local images, includes custom and downloaded

`docker images | grep server-hello`{{execute}}

If my-custom-image appear in read it was correctly created

## Run the container

Now that our image is built, we can test it.

`docker run -p 80:8083 -d --name server-hello server-hello`{{execute}}

## Test the container

Now the server is up and running, you can contact it at the following url

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/api/hello