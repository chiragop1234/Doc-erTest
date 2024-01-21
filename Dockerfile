FROM python:3.6-alpine3.7
MAINTAINER Quan Chen <chenq182@sina.com>

ENV TZ "Asia/Shanghai"
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.7/main" > /etc/apk/repositories

RUN apk add --no-cache --virtual .build-deps \
    gcc \
    libc-dev \
    linux-headers \
  && pip3 install Flask==0.12.2 uWSGI==2.0.15 flask-cors==3.0.3 \
  && apk del .build-deps
WORKDIR /app

ENV INI uwsgi.ini
EXPOSE 80 8080
VOLUME ["/app"]
CMD uwsgi ${INI}
