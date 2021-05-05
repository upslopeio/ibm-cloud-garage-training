FROM quay.io/jeffdean/node-alpine as build-stage
WORKDIR /app
COPY ./ /app/
RUN npm install
RUN npm run build

FROM quay.io/jeffdean/nginx-unprivileged
COPY --from=build-stage /app/build/ /usr/share/nginx/html
COPY --from=build-stage /app/nginx.conf /etc/nginx/conf.d/default.conf
