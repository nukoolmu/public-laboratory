FROM node

WORKDIR /app
ADD . .
RUN npm install

CMD node ./src/server.js

