FROM nginx
LABEL application="workshop agrument and environtment"

ARG BUILD_DATE
LABEL org.label-schema.build-date=$BUILD_DATE

ENV CUSTOM_BUILD_VERSION="1.0.0"

WORKDIR /app/my-web

ADD ./src/html/index.html .

COPY ./src/conf.d/default.conf /etc/nginx/conf.d/default.conf