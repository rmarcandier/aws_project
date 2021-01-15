rpm -ivh http://repo.zabbix.com/zabbix/5.0/rhel/7/x86_64/zabbix-agent2-5.0.7-1.el7.x86_64.rpm
yum install -y zabbix-agent2
sed -i 's/Server=127.0.0.1/Server=10.0.32.58/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/ServerActive=127.0.0.1/ServerActive=10.0.32.58/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/Hostname=Zabbix server/#Hostname=Zabbix server/g' /etc/zabbix/zabbix_agent2.conf
sed -i 's/# HostMetadata=/HostMetadata=motor/g' /etc/zabbix/zabbix_agent2.conf
systemctl enable zabbix-agent2
systemctl restart zabbix-agent2

touch /etc/zabbix/zabbix_agentd.d
echo "UserParameter=custom.devopsgroup.discovery, /etc/zabbix/zabbix_agentd.d/valida_services_devopsgroup.sh discovery" > /etc/zabbix/zabbix_agentd.d
echo "UserParameter=custom.devopsgroup.discovery, /etc/zabbix/zabbix_agentd.d/valida_services_devopsgroup.sh $1 $2" >> /etc/zabbix/zabbix_agentd.d

cd /etc/init.d
touch valida_services_devopsgroup.sh

echo "SERVICE_NOME=$( ls \/etc\/init.d | grep 'devopsgroup\|tomcat')" > valida_services_devopsgroup.sh
echo "LINHAS=$( ls /etc/init.d | grep 'devopsgroup\|tomcat')" >> valida_services_devopsgroup.sh