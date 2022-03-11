FROM nginx:alpine

COPY content /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY ./files /usr/share/files
