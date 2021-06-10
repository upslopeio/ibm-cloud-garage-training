# Dockerizing a React App

## Option 1: Multistage build

`nginx.conf` (same as above):

```nginx
server {
    listen       8080;
    server_name  localhost;
    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
        try_files $uri $uri/ /index.html =404;
    }
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
```

`Dockerfile`

```dockerfile
FROM quay.io/upslopeio/node-alpine as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM quay.io/upslopeio/nginx-unprivileged
COPY --from=build /app/build /usr/share/nginx/html
COPY --from=build /app/nginx.conf /etc/nginx/conf.d/default.conf
```

Then from the command line, to build you would execute the following commands:

```bash
# no need to run npm build
docker build --no-cache -t dockerized-react-app .
docker run -it -p 8080:8080 --rm dockerized-react-app
```

Then open http://localhost:8080 in your browser to see it work.

**Pros**: You don't need to build the react app separately

**Cons**: The Dockerfile is more complex, and re-downloads npm packages and re-runs the build which might not be necessary (depending on your build system).

---

🛑 Everything below here is trivia.

---

## Background

Public DockerHub images are [severely rate-limited](https://www.docker.com/increase-rate-limits).

quay.io does not have rate limits on public repositories. See the [Docker Lab](https://cloudnative101.dev/lectures/containers/activities/) for more information on how to create a quay.io account.

On a client site, you will have an internal docker registry. In fact, even in class there's an [internal docker registry](https://docs.openshift.com/container-platform/3.3/install_config/registry/accessing_registry.html) which you can use.

You can see access information about the OpenShift image repository by running `igc credentials`.

For this tutorial we're referencing images pushed to a personal quay.io account.

❌️❌ WARNING: these images are not maintained up-to-date and may contain un-patched security vulnerabilities. DO NOT USE on a production application. ❌❌

If you want a more recent image, do the following:

```bash
export QUAY_USER=<your quay.io username>

docker pull node:alpine
docker tag node:alpine quay.io/$QUAY_USER/node-alpine
docker push quay.io/$QUAY_USER/node-alpine

docker pull nginxinc/nginx-unprivileged
docker tag nginxinc/nginx-unprivileged quay.io/$QUAY_USER/nginx-unprivileged
docker push quay.io/$QUAY_USER/nginx-unprivileged
```

## Option 1: Build then Build 😉

React applications (as well as other single-page applications) compile down to static files (HTML, CSS, fonts, etc...).

In order to build these applications, you need to add two files:

1. Dockerfile
1. nginx.conf

`nginx.conf`:

```nginx
server {
    listen       8080;
    server_name  localhost;
    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
        try_files $uri $uri/ /index.html =404;
    }
    error_page   500 502 503 504  /50x.html;
    location = /50x.html {
        root   /usr/share/nginx/html;
    }
}
```

`Dockerfile`

```dockerfile
FROM quay.io/upslopeio/nginx-unprivileged
COPY build /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
```

Then from the command line, to build you would execute the following commands:

```bash
npm run build
docker build -t dockerized-react-app .
docker run -it -p 8080:8080 --rm dockerized-react-app
```

Then open http://localhost:8080 in your browser to see it work.

**Pros** Your Dockerfile is super simple.

**Cons** You need to build the application before building the Dockerfile.
