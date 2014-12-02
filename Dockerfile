FROM node:0.10-slim
MAINTAINER Eric Holmes <eric@ejholmes.io>

ENV ETCD http://127.0.0.1:4001

ADD ./bin/start /bin/start
ADD ./bin/build /bin/build
RUN /bin/build
ADD ./confd /etc/confd

EXPOSE 8125/udp
EXPOSE 8126

ENTRYPOINT ["/bin/start"]
CMD []
