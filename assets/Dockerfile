FROM python:3

RUN echo ..... Starting ASSETS build .......
ENV git_branch="develop"
ENV api_repo="https://github.com/epu-ntua/sphinx-vaaas-asset-manager.git"

RUN apt-get update

RUN apt-get install -y curl git nano

RUN mkdir -p /assets

COPY scripts /

RUN chmod +x /*.sh

RUN git config --global http.sslVerify false
RUN git clone $api_repo /assets -b $git_branch



#EXPOSE 8000
CMD ["/start.sh"]