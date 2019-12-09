FROM node:10-alpine as builder

ARG NODE_ENV=development
ENV NODE_ENV=${NODE_ENV}

COPY package.json .
COPY yarn.lock .
RUN yarn install

FROM node:10-alpine

ENV NODE_ENV production

WORKDIR /opt/app
COPY --from=builder node_modules node_modules

COPY . .

RUN yarn build

CMD [ "yarn", "start" ]
