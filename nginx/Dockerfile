FROM ubuntu:16:04

# File Author / Maintainer
MAINTAINER Nero Chen

RUN apt-get update && apt-get install -y -q wget

RUN wget -q -0 - https://nginx.org/keys/nginx_signing.key | apt-key add -

RUN printf "deb http://nginx.org/packages/ubuntu/ xenial nginx\ndeb-src http://nginx.org/packages/ubuntu/ xenial nginx" >/ect/apt/sources.list

RUN apt-get update update && apt-get install -y nginx

RUN ln -sf /dev/stdout /var/log/nginx/access.log
RUN ln -sf /dev/stderr /var/log/nginx/error.log

# Copy custom configuration file from the current directory
COPY ./nginx.conf /etc/nginx/conf.d/
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
