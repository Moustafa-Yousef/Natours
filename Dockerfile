# syntax=docker/dockerfile:1
FROM node:14

WORKDIR /app

COPY package*.json ./

COPY . .

CMD ["node", "app.js"]
