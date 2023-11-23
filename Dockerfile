FROM node:19.9.0 AS builder

COPY . /src
WORKDIR /src

RUN yarn install


FROM nginx

COPY --from=builder  /src/dist /usr/share/nginx/html/
#COPY nginx.conf /etc/nginx/nginx.conf

WORKDIR /usr/share/nginx/html/
# 暴露容器的端口
EXPOSE 80
# 容器启动时执行的命令
CMD ["nginx", "-g", "daemon off;"]
