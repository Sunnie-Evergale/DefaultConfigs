FROM /portal-builder:latest

RUN npm install -g pm2 eslint eslint-plugin-react babel-eslint

WORKDIR /var/app
COPY ./package.json /var/app/package.json
RUN npm i
RUN npm run update:controls --silent
COPY ./ /var/app
RUN eslint /var/app/src/.
RUN npm run build:staging --silent



ENV PORT 8080
ENV WP_HOST localhost
ENV WP_PORT 8079
ENV NODE_ENV development
EXPOSE 8079
EXPOSE 8080
CMD npm run dev -s

