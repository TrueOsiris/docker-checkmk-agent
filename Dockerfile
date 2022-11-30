FROM ubuntu:22.04

LABEL name="checkmk-agent" \
      maintainer="Trueosiris" 
ENV TZ="Europe/Brussels"
VOLUME ["plugins"]
ARG DEBIAN_FRONTEND="noninteractive"
RUN apt update -y && \
    apt-get upgrade -y && \
    apt-get install -y  apt-utils && \
    apt-get install -y  software-properties-common \
                        tzdata \ 
			xinetd
EXPOSE 6556
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]

