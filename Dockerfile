FROM mhart/alpine-node:10.6.0 AS BASE_IMAGE
WORKDIR /src
COPY .  /src
COPY package.json .
RUN rm -rf node_modules/
RUN npm install --production


FROM mhart/alpine-node:base-10.6.0 AS RELEASE
WORKDIR /src
COPY --from=BASE_IMAGE /src .
COPY . .
CMD ["node", "build.js"]