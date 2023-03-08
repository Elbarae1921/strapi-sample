FROM node:16.14.2-alpine as build
WORKDIR /app
COPY ./package.json ./
COPY ./yarn.lock ./
RUN yarn
COPY . .
RUN yarn build

FROM node:16.14.2-alpine
WORKDIR /app
COPY --from=build /app .
CMD ["yarn", "start"]
