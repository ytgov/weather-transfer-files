FROM nginx:alpine

COPY content /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/weather-transfer-files.conf

COPY ./ftp/data /usr/share/nginx/data
