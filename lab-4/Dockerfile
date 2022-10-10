FROM node
LABEL application="workshop agrument and environtment"

ARG BUILD_DATE
LABEL org.label-schema.build-date=$BUILD_DATE

ENV CUSTOM_BUILD_VERSION="1.0.0"

WORKDIR /app/my-api

ADD ./src .

RUN npm install express

EXPOSE 3000

CMD node server.js