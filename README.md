# ansible-zabbix
 -------------------------------------------------------------------------------
用   途: 利用ansible批量安装zabbix-server、zabbix-agent（包含lnmp）
版   本：1.1
参   考:
http://www.ansible.com.cn/
 -------------------------------------------------------------------------------
1、安装ansible
执行~/script/install_ansible.sh

2、编辑~/hosts.ini
示例：
主机ip：172.16.80.10(zabbix-server)、172.16.80.20(zabbix-agent)、172.16.80.30(zabbix-agent)、172.16.80.40(zabbix-agent)
hosts.ini内容：

node1 ansible_ssh_port=22 ansible_ssh_host=172.16.80.10 host_name=node1
node2 ansible_ssh_port=22 ansible_ssh_host=172.16.80.20 host_name=node2
node3 ansible_ssh_port=22 ansible_ssh_host=172.16.80.30 host_name=node3
node4 ansible_ssh_port=22 ansible_ssh_host=172.16.80.40 host_name=node4
[cluster]
node1
node2
node3
node3

[zabbix_server]
node1

[zabbix_agentd]
node1
node2
node3

3、修改~/group_vars/zabbix_server.yaml、zabbix_agentd.yaml
zabbix_server_ip: zabbix_server主机ip
例：
zabbix_server_ip: 172.16.80.118

4、做主机免密码登录
只需要做ansible到其他主机的，如果本机也参与任务，也需要做到本机免密码登录

5、执行~/install.sh，安装完成后failed=0则成功
node1                      : ok=55   changed=47   unreachable=0    failed=0
node2                      : ok=9    changed=7    unreachable=0    failed=0
node3                      : ok=9    changed=7    unreachable=0    failed=0

6、通过浏览器访问zabbix-server ip地址，如：http://172.16.80.118/zabbix

7、软件版本及数据库认证信息
nginx：1.8.1
/usr/local/nginx
mysql：5.1.73
/usr/
php  ：5.6.13
/usr/local/php
mysql root password：123456
