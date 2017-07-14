centos安装shadowsocks
1、安装ShadowSocks
  # yum -y install python-setuptools && easy_install pip
  # pip install shadowsocks

2、创建配置文件
  # vim /etc/shadowsocks.json
    {
       "server":"0.0.0.0",
       "server_port":7777,
       "local_address":"127.0.0.1",
       "local_port":1080,
       "password":"hahahaha",
       "timeout":600,
       "method":"rc4-md5"
    }

3、创建启停脚本

$ vim /etc/init.d/server
#!/bin/bash
# chkconfig: - 20 88
# Source function library.
. /etc/init.d/functions

start() {
    ssserver -c /etc/shadowsocks.json -d start
}
stop() {
    ssserver -c /etc/shadowsocks.json -d stop
}

case "$1" in
    start)
    $1
    ;;
    stop)
    $1
    ;;
    restart)
    stop
    start
    ;;
    *)
    echo $"Usage: $0 {start|stop|restart}"
    exit 2
esac
exit $?
