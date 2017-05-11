UserParameter=Process.discovery,/bin/cat /etc/zabbix/process.txt
UserParameter=check_process[*],/etc/zabbix/scripts/check_process.sh $1


proc.num[{#PROCESS_NAME},{#PROCESS_USER},{#PROCESS_STATE},{#PROCESS}]

{
    "data": [
        {
            "{#PROCESS}": "syslogd",
            "{#PROCESS_NAME}": "",
            "{#PROCESS_USER}": "root",
            "{#PROCESS_STATE}": "all",
            "{#PROCESS_NUM}": "1"
        },
        {
            "{#PROCESS}": "filebeat",
            "{#PROCESS_NAME}": "filebeat-god",
            "{#PROCESS_USER}": "root",
            "{#PROCESS_STATE}": "all",
            "{#PROCESS_NUM}": "1"
        }
    ]
}