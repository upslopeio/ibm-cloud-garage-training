# Docker

## React Application

To deploy a React Application you will need a multi-stage `Dockerfile` to build the application and then serve it using an appropriate `nginx.conf`.

Save both of the above the following files to the root of your React application, then commit the new files, and finally push the new commit to the remote repository.

- [`Dockerfile`](./Dockerfile)
- [`nginx.conf`](./nginx.conf)

The above files should work as-is.
