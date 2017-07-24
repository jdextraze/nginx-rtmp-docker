FROM alpine:latest

RUN	apk update\
 && apk add openssl openssl-dev libstdc++ ca-certificates pcre-dev g++ gcc make wget

RUN wget http://nginx.org/download/nginx-1.12.1.tar.gz\
 && tar xzf nginx-1.12.1.tar.gz\
 && wget https://github.com/arut/nginx-rtmp-module/archive/v1.2.0.tar.gz\
 && tar xzf v1.2.0.tar.gz\
 && cd nginx-1.12.1\
 && ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-1.2.0\
 && make\
 && make install

EXPOSE 8080
EXPOSE 1935

ADD nginx.conf /usr/local/nginx/conf/

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
