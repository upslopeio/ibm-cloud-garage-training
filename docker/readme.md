# Docker

## React Application

To deploy a React Application you will need a multi-stage `Dockerfile` to build the application and then serve it using an appropriate `nginx.conf`.

Save both of the above the following files to the root of your React application,

- [`Dockerfile`](./Dockerfile)
- [`nginx.conf`](./nginx.conf)

The above files should work as-is.  

Build the Docker image locally, then run the image, and then visit <http://localhost:8080> to and make sure your application is running correctly in Docker.

Finally, commit the new files, and push the new commit to the origin repository.
