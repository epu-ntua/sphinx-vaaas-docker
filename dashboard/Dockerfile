# Stage 1
FROM node:latest as node
RUN echo ..... Starting DASHBOARD build .......
ENV git_branch="k8s_version"
ENV api_repo="https://github.com/epu-ntua/sphinx-vaaas-dashboard.git"


RUN apt-get update

RUN apt-get install -y openssh-server iputils-ping curl git sshpass netcat nano

RUN mkdir -p /app

WORKDIR /app

RUN git config --global http.sslVerify false
RUN git clone $api_repo /app -b $git_branch

COPY . .

RUN npm install

#RUN npm run build --prod
RUN npm run build -- --prod --base-href /vaaas/  --deploy-url /vaaas/

# Stage 2
FROM nginx:alpine
#ENV VAAAS_API_BASE_URL=${host.docker.internal}
RUN rm /etc/nginx/conf.d/default.conf
COPY ngx/nginx.conf /etc/nginx/
COPY --from=node /app/dist/lastVAaaS /usr/share/nginx/html

# When the container starts, replace the env.js with values from environment variables
#CMD ["/bin/sh",  "-c",  "envsubst < /usr/share/nginx/html/assets/env.template.js > /usr/share/nginx/html/assets/env.js && exec nginx -g 'daemon off;'"]
#CMD ["/bin/sh",  "-c",  "envsubst < /usr/share/nginx/html/assets/env.template.js > /usr/share/nginx/html/assets/env.js && exec nginx -g 'daemon off;'"]
