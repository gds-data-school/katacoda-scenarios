## Change the server response

The application is now live, but we realize that there is a typo in the server response. 

In fact, the server response is 'Hello form Docker Microservice' -> FROM, not FORM

So, let's fix it.

### Edit the python script

The first think we need to do is open the file 'server-hello/src/app/server.py' in the editor and fix the typo.

NOTICE: if we now call again the server, nothing changed, this is because we need to update the container too.

### Update the Container Image

Since that the script is fixed, we can again build the image. So execute the previous command:

`docker build --tag server-hello .`{{execute}}

Now, we need to stop and destroy the previous container, then start the new one.

`docker stop server-hello`{{execute}}

`docker rm server-hello`{{execute}}

`docker run -p 80:8083 -d --name server-hello server-hello`{{execute}}

### Check if the fix works

We just have to test that the server responds with the correct sentence. So query the server again.

https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com/api/hello

### Stop the application

We finished with the experimentation, so we can stop our application. To do that, just execute the command:

`docker stop server-hello`{{execute}}