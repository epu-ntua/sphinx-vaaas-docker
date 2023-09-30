FROM mongo:latest

COPY conf/mongo-init.sh /docker-entrypoint-initdb.d/
COPY conf/mongod.conf /etc/

CMD ["mongod", "--config", "/etc/mongod.conf"]

#COPY initdb.d/create-app-user.sh /docker-entrypoint-initdb.d/
##RUN chmod +x /docker-entrypoint-initdb.d/*.sh
#
#ENV MONGO_INITDB_ROOT_USERNAME: ${MONGO_INITDB_ROOT_USERNAME}
#ENV MONGO_INITDB_ROOT_PASSWORD: ${MONGO_INITDB_ROOT_PASSWORD}
#ENV MONGO_INITDB_DATABASE: ${MONGO_INITDB_DATABASE}
#ENV rootAuthDatabase: ${rootAuthDatabase}
#
##COPY mongo-init.js /docker-entrypoint-initdb.d/
##FROM mongo:latest
#RUN echo "${MONGO_INITDB_DATABASE}"
#RUN apt-get update \
#    && apt-get install -y git build-essential \
#    && git clone --depth=1 https://github.com/TylerBrock/mongo-hacker.git \
#    && rm -rf ~/.mongorc.js \
#    && cd mongo-hacker \
#    && make install
#
##COPY initdb.d/create-app-user.sh /docker-entrypoint-initdb.d/
#
##ENTRYPOINT ["/docker-entrypoint-initdb.d/create-app-user.sh"]
#CMD ["mongod", "-f", "/etc/mongod.conf","--bind_ip_all"]