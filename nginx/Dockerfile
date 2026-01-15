# FROM nginx:1.26.1
FROM artifactory.itg.ti.com/docker-public-local/nginx:1.26.1

RUN rm /etc/nginx/conf.d/default.conf

COPY /include.websocket /etc/nginx/app/include.websocket
COPY /include.forwarded /etc/nginx/app/include.forwarded
COPY /nginx.conf /etc/nginx/conf.d