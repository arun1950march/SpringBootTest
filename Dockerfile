FROM node:16-alpine
ENV NODE_ENV="development"
WORKDIR /app
COPY package.json .
COPY package-lock.json .
ARG NODE_ENV
RUN apk add g++ make py3-pip
RUN npm install
RUN chown -R node /app/node_modules
RUN npm install -g ts-node nodemon
COPY . ./
ENV PORT 8000
EXPOSE $PORT
ENTRYPOINT ["/entrypoint.sh"]
CMD ["ts-node", "./src/server.ts"]
