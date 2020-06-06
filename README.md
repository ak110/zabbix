# Zabbix

## 使い方

### server

    sudo apt install fonts-ipafont

    cd server
    docker-compose up -d

- `nvidia_smi_template.xml` をインポート
- 自動登録の設定をする
    - 参考: https://qiita.com/kawa123/items/c874cf85ba17fd137dd1

### agent

    ansible-playbook agent/zabbix-agent.yml

## 停止方法

### server

    cd server
    docker-compose up -d

## 動作確認

    docker-compose exec zabbix-server zabbix_get -k gpu.discovery -s IPアドレス

## 参考

- https://github.com/woyteck1/zabbix-nvidia-smi-integration
- https://github.com/wangmuy/zabbix-agent-nvidia

## server update

    cd server
    docker-compose pull && docker-compose down && docker-compose up -d && docker-compose logs -ft

