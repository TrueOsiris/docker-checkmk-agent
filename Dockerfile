FROM ubuntu:22.04

LABEL name="checkmk-agent" \
      maintainer="Trueosiris" 
ENV TZ="Europe/Brussels"
ENV AGENTPACKAGE="https://checkmk.timmer.ninja/download_agent.py?hash=05833099304e914e&os=linux_deb"
ENV INSTALLED="FALSE"
VOLUME ["/install_packages", "plugins", "/etc/xinetd.d"]
ARG DEBIAN_FRONTEND="noninteractive"
RUN apt update -y && \
    apt-get upgrade -y && \
    apt-get install -y  apt-utils && \
    apt-get install -y  software-properties-common \
                        tzdata \ 
			xinetd \
			wget \
			curl \
			python2.7 \
			python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/
EXPOSE 6556
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]

