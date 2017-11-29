# Zabbix

## 使い方

### server

    sudo apt install fonts-ipafont

    cd server
    docker-compose up -d

-「nvidia_smi_template.xml」をインポート
- 自動登録の設定をする
    - 参考: https://qiita.com/kawa123/items/c874cf85ba17fd137dd1

### agent

    cd ansible-agent
    ansible-playbook zabbix-agent.yml
    ansible -m shell -a 'sudo service zabbix-agent restart' all

## 停止方法

### server

    cd server
    docker-compose up -d

## 動作確認

    docker exec zabbix-server zabbix_get -s IPアドレス -k gpu.discovery

## 参考

- https://github.com/woyteck1/zabbix-nvidia-smi-integration
- https://github.com/wangmuy/zabbix-agent-nvidia
