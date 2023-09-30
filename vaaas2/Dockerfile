FROM python:3

RUN echo ..... Starting VAAAS2 build .......
ENV git_branch="develop"
ENV api_repo="https://github.com/epu-ntua/sphinx-vaaas-ip-scanner.git"

ENV vulners_git="https://github.com/vulnersCom/nmap-vulners.git"
ENV vulnscan_git="https://github.com/scipag/vulscan.git"

RUN apt-get update

RUN apt-get install -y git nmap nano

#RUN mkdir -p /vaaas2
#RUN mkdir -p /vulners_scripts


COPY scripts /

RUN chmod +x /*.sh

RUN git config --global http.sslVerify false
RUN git clone $api_repo /vaaas2 -b $git_branch

RUN git clone  $vulners_git /vulners_scripts
RUN cp -rf /vulners_scripts/*.nse /usr/share/nmap/scripts/

RUN git clone  $vulnscan_git /vulscan_scripts
RUN mkdir -p /usr/share/nmap/scripts/vulscan
RUN cp -rf /vulscan_scripts/* /usr/share/nmap/scripts/vulscan

#RUN cd /usr/share/nmap/scripts/vulscan/utilities/updater/
#RUN chmod a+x /usr/share/nmap/scripts/vulscan/utilities/updater/updateFiles.sh
#CMD /usr/share/nmap/scripts/vulscan/utilities/updater/updateFiles.sh

EXPOSE 4444
#CMD ["/usr/bin/supervisord"]
CMD ["/start.sh"]