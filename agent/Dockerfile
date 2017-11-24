FROM nvidia/cuda:9.0-devel

RUN set -x && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y wget && \
    wget "http://repo.zabbix.com/zabbix/3.4/ubuntu/pool/main/z/zabbix-release/zabbix-release_3.4-1+xenial_all.deb" -O /tmp/zabbix-agent.deb && \
    DEBIAN_FRONTEND=noninteractive dpkg -i /tmp/zabbix-agent.deb && \
    rm /tmp/zabbix-agent.deb && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y zabbix-agent && \
    apt-get clean

COPY custom.conf /etc/zabbix/zabbix_agentd.d/
COPY start.sh /

RUN set -x && \
    chmod 777 /start.sh

CMD /start.sh
