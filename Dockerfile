FROM node:12.16.2-alpine as build-stage
RUN apk add --no-cache --update \
      python \
      python-dev \
      py-pip \
      build-base \
      git \
      sudo
WORKDIR /app

RUN git clone https://github.com/velas/web3t.git web3t

COPY . wallet

WORKDIR /app/web3t
RUN npm install

WORKDIR /app/wallet
RUN mkdir -p /app/wallet/.compiled-ssr/web3t/providers /app/wallet/.compiled-ssr/web3t/node_modules_embed/ethereumjs-tx
RUN npm install --ignore-scripts
RUN npm install -g --unsafe-perm node-sass lsxc livescript
RUN mkdir -p /app/wallet/.compiled-ssr/web3t/node_modules_embed/scryptsy/lib
RUN npm run wallet-build

FROM nginx:stable-alpine as production-stage
ADD nginx_config/default.conf /etc/nginx/conf.d/default.conf
COPY --from=build-stage /app/wallet/.compiled/main-bundle.js /usr/share/nginx/html
COPY --from=build-stage /app/wallet/.compiled/main-bundle.css /usr/share/nginx/html
COPY --from=build-stage /app/wallet/.compiled/service-worker.js /usr/share/nginx/html
COPY --from=build-stage /app/wallet/.compiled/main-index.html /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
