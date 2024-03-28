FROM  node

WORKDIR /app/

COPY ./src/server.js .

RUN npm install express
RUN npm install body-parser

CMD node server.js