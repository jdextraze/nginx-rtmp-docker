FROM alpine:latest

RUN	apk update\
 && apk add openssl openssl-dev libstdc++ ca-certificates pcre-dev g++ gcc make wget zlib-dev

RUN wget http://nginx.org/download/nginx-1.20.1.tar.gz\
 && tar xzf nginx-1.20.1.tar.gz\
 && wget https://github.com/arut/nginx-rtmp-module/archive/v1.2.2.tar.gz\
 && tar xzf v1.2.2.tar.gz\
 && cd nginx-1.20.1\
 && ./configure --with-http_ssl_module --add-module=../nginx-rtmp-module-1.2.2 --with-cc-opt="-Wno-error=implicit-fallthrough"\
 && make\
 && make install

EXPOSE 8080
EXPOSE 1935

ADD nginx.conf /usr/local/nginx/conf/
ADD index.html /usr/local/nginx/html/

CMD ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
