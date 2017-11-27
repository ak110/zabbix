# Zabbix

## 使い方

### server

    cd server
    docker-compose up -d

-「nvidia_smi_template.xml」をインポート
- 自動登録の設定をする
    - 参考: https://qiita.com/kawa123/items/c874cf85ba17fd137dd1

### agent

    cd agent
    docker build --tag=zabbix-agent .
    nvidia-docker run \
        --detach \
        --restart=unless-stopped \
        --net=host \
        --privileged \
        --volume=/:/rootfs \
        --volume=/var/run:/var/run \
        --publish=10050:10050 \
        --env="ZA_Hostname=$HOSTNAME" \
        --env="ZA_Server=<サーバアドレス>" \
        --name=zabbix-agent \
        zabbix-agent


## 停止方法

### server

    cd server
    docker-compose up -d

### agent

    docker rm -f zabbix-agent

## 参考

- https://github.com/woyteck1/zabbix-nvidia-smi-integration
- https://github.com/wangmuy/zabbix-agent-nvidia
