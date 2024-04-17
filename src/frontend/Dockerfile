ARG NODEVERSION="21"
ARG NODEVARIANT="slim"
FROM node:${NODEVERSION}-${NODEVARIANT}
ENV NODE_ENV="production"
WORKDIR /usr/src/app
COPY . /usr/src/app/
RUN npm ci --only=production
CMD "npm" "start"
