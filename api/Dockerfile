FROM python:3

RUN echo ..... Starting API build .......
ENV git_branch="develop"
ENV api_repo="https://github.com/epu-ntua/sphinx-vaaas-api.git"

RUN apt-get update

RUN apt-get install -y openssh-server iputils-ping curl git sshpass netcat nano socat

#RUN mkdir -p /var/run/sshd /var/log/supervisor
RUN mkdir -p /api

#COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY sshd_config /sshd_config
COPY scripts /

#RUN /etc/init.d/ssh restart
#RUN /etc/init.d/sshd restart
RUN chmod +x /*.sh

RUN git config --global http.sslVerify false
RUN git clone $api_repo /api -b $git_branch



EXPOSE 8000
#CMD ["/usr/bin/supervisord"]
CMD ["/start.sh"]