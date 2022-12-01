FROM ubuntu:22.04

LABEL name="checkmk-agent" \
      maintainer="Trueosiris" 
ENV TZ="Europe/Brussels"
ENV AGENTPACKAGE="https://checkmk.timmer.ninja/agents/check-mk-agent_2.1.0p2-1_all.deb"
ENV INSTALLED="FALSE"
VOLUME ["/install_packages", "/usr/lib/check_mk_agent/plugins", "/usr/lib/check_mk_agent/local", "/etc/xinetd.d"]
ARG DEBIAN_FRONTEND="noninteractive"
RUN apt update -y && \
    apt-get upgrade -y && \
    apt-get install -y  apt-utils && \
    apt-get install -y  software-properties-common \
                        tzdata \ 
			xinetd \
			curl \
			python2.7 \
			python3 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/
EXPOSE 6556
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]

