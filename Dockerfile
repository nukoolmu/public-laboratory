FROM node

WORKDIR /app

ADD ./src/* .

RUN npm install express

CMD node server.js