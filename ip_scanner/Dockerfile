FROM python:3

RUN echo ..... Starting SCANNER build .......
ENV git_branch="develop"
ENV api_repo="https://github.com/epu-ntua/sphinx-vaaas-ip-scanner.git"

RUN apt-get update

RUN apt-get install -y curl git nano nmap

RUN mkdir -p /scanner

COPY scripts /

RUN chmod +x /*.sh

RUN git config --global http.sslVerify false
RUN git clone $api_repo /scanner -b $git_branch



#EXPOSE 8000
CMD ["/start.sh"]