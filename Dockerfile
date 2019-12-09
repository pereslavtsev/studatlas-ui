FROM node:lts-alpine

WORKDIR /opt/app

ENV NODE_ENV production

COPY package.json .
COPY yarn.lock .
RUN yarn install

COPY . .

RUN yarn build

CMD [ "yarn", "start" ]
