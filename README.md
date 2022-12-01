# docker-checkmk-agent
WIP - attempting to get host data via docker container

![Trueosiris Rules](https://img.shields.io/badge/trueosiris-rules-f08060)
[![Docker Pulls](https://badgen.net/docker/pulls/trueosiris/checkmk-agent?icon=docker&label=pulls)](https://hub.docker.com/r/trueosiris/checkmk-agent/)
[![Docker Stars](https://badgen.net/docker/stars/trueosiris/checkmk-agent?icon=docker&label=stars)](https://hub.docker.com/r/trueosiris/checkmk-agent/)
[![Docker Image Size](https://badgen.net/docker/size/trueosiris/checkmk-agent?icon=docker&label=image%20size)](https://hub.docker.com/r/trueosiris/checkmk-agent/)
![Github stars](https://badgen.net/github/stars/trueosiris/docker-checkmk-agent?icon=github&label=stars)
![Github forks](https://badgen.net/github/forks/trueosiris/docker-checkmk-agent?icon=github&label=forks)
![Github issues](https://img.shields.io/github/issues/TrueOsiris/docker-checkmk-agent)
![Github last-commit](https://img.shields.io/github/last-commit/TrueOsiris/docker-checkmk-agent)

## Environment variables

| Variable | Default Key | Description |
| -------------------- | ---------------------------- | ------------------------------------------------------------------------------- |
| TZ | Europe/Brussels | timezone for ntpdate |
| AGENTPACKAGE | https://checkmk.timmer.ninja/agents/check-mk-agent_2.1.0p2-1_all.deb | link to baked debian/ubuntu package |
| INSTALLED | FALSE | when set to true, package reinstall/update will not be done on container start |

## Volumes

| Volume | example host location |
| ------ | --------------------- |
| /install_packages | /path/on/host/checkmk_container/install_packages |
| /usr/lib/check_mk_agent | /path/on/host/checkmk_container/usr/lib/check_mk_agent |
| /etc/check_mk | /path/on/host/checkmk_container/etc/check_mk |
| /etc/xinetd.d | /path/on/host/checkmk_container/etc/xinetd.d |

