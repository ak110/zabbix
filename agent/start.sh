#!/bin/sh
set -x

if [ -n "$ZA_Hostname" ] ; then
  sed "s/^Hostname=.*/Hostname=$ZA_Hostname/g" -i /etc/zabbix/zabbix_agentd.conf
  echo $ZA_Hostname > /etc/hostname
  echo 127.0.0.1'\t'$ZA_Hostname'\n' >> /etc/hosts
fi

if [ -n "$ZA_Server" ] ; then
  sed "s@^Server=.*@Server=127.0.0.1,172.0.0.0/8,$ZA_Server@g" -i /etc/zabbix/zabbix_agentd.conf
  sed "s@^ServerActive=.*@ServerActive=$ZA_Server@g" -i /etc/zabbix/zabbix_agentd.conf
fi

mkdir -p /var/run/zabbix

/usr/sbin/zabbix_agentd --foreground

