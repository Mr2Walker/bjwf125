我们为什么需要监控?

没有监控就将系统上线, 就是在耍流氓; 在生产环境中, 监控是必不可少的, 因为我们需要实时了解业务的运行状态, 并且将数据以图表的方式直观的展示出来, 甚至当服务出现故障还可以根据事先定义好的规则自动执行相应脚本, 从而实现自动恢复、转移等功能
常用的开源监控系统有哪些?

运维工作就是大部分时候都是通过各种工具来让我们完成特定的任务, 监控也是如此, 目前也有很多开源的监控软件可供我们使用

常见的开源监控简单介绍

Cacti: 通过snmpget来获取数据, 使用RRDTool来绘制图形, 使用PHP语言编写, 提供强大的数据展示功能, 但是在故障报警方面不是很擅长
Nagios: 异常强大的报警功能, 多节点监控、数据图形展示的功能薄弱, 因此经常整合Cacti来进行监控
Zabbix: 融合Cacti和Nagios的大部分功能, 通过WEB界面提供分布式的网络监控
Zabbix架构

Zabbix是一款强大的开源分布式监控系统, 能够将SNMP、JMX、Zabbix Agent提供的数据通过WEB GUI的方式进行展示.

Zabbix有四个组件, Zabbix-Server, Zabbix-Agent, Zabbix-Web, zabbix-proxy

Zabbix-Server: 服务端, 通过C语言编写, 获取Zabbix-Agent端的数据并存储在数据库中
Zabbix-Proyx: 代理服务端收集数据并保存在本地的数据库中, 定期将数据提交给Zabbix-Server
Zabbix-Agent: 客户端, 通过C语言编写, 收集定义的item的数据, 定期发给服务端在不同工作模式下、也可能是服务器主动收集
Zabbix-Web: Web-GUI结构, 可以运行在任意主机中, 连接Zabbix-Server并将数据库中的内容在前端展示


一、zabbix简介
	Zabbix是一个基于WEB界面的分布式开源监控系统，主要有2部分构成，Zabbix server于Zabbix agent,同时也支持Zabbix proxy。
	现在，我们已经将Zabbix大量的应用到了线上环境。在日常的监控中，深切的体验到了Zabbix的高效快捷和优秀的扩展能力。
	Zabbix的底层采集程序是用C语言编写的Server和Agent，而用户界面是通过PHP编写WEB，采用Mysql数据库来存储数据。整个Zabbix其实就是一个框架，其中内置了一些针对各类OS的系统参数采集命令，可以直接调用，而其它的自定义监控参数，则可以通过自己来写一些快捷的Shell命令通过管道传递，或通过各种脚本甚至程序来传递。Zabbix只管把最后的返回值通过agent拿到，存储统计，绘图，根据定义的阀值进行报警等。
	说到这里，其实所有的监控系统差不多都是这样的逻辑，所以真正有差别的地方是在最后功能的整合和易用性上。而Zabbix之所以好用，就是因为它整合的相当好，拿来之后就能用，agent安装简单方便，Server端的配置，完善的用户界面，绘图，报警和扩展等都非常方便。
	zabbix是一种高度集成的网络监控解决方案，在单个封装中提供提供多个功能。

二、Zabbix功能
	Zabbix是一种高度集成的网络监控解决方案，在单个封装中提供多种功能。
	数据收集
		可用性和性能检查
		支持SNMP（陷阱和轮询），IPMI，JMX，VMware监控
	自定义检查
		以定制间隔收集所需数据
		由服务器/代理和代理执行
		灵活的阈值定义
		您可以定义非常灵活的问题阈值，称为触发器，引用来自后端数据库的值
	高度可配置的警报
		可以为升级调度，收件人，媒体类型自定义发送通知
		可以使用宏变量使通知有意义和有用
		自动操作包括远程命令
	实时图形
		使用内置的图形功能立即绘制监视项目
	Web监视功能
		Zabbix可以在网站上按照模拟鼠标点击的路径，并检查功能和响应时间
	广泛的可视化选项
		能够创建可将多个项目合并为单个视图的自定义图形
		网络地图
		自定义屏幕和幻灯片显示，用于仪表板样式概述
		报告
		高级（业务）视图的受监视资源
	历史数据存储
		数据存储在数据库中
		可配置历史
		内置内务程序
	配置方便
		将受监控的设备添加为主机
		主机被拾取用于监视，一次在数据库中
		将模板应用于受监控的设备
	使用模板
		在模板中分组检查
		模板可以继承其他模板
	网络发现
		自动发现网络设备
		代理自动注册
		发现文件系统，网络接口和SNMP OID
	快速的网页界面
		PHP中的基于Web的前端
		可从任何地方访问
		你可以点击你的方式
		审计日志
	Zabbix API
		ZABBIX API提供可编程接口的zabbix大规模操作，第三方软件集成等多种用途。
	权限系统
		安全用户认证
		某些用户可以限制到某些视图
	全功能和易扩展的代理
		部署在监控目标上
		可以部署在Linux和Windows上
	二进制守护进程
		写在C，性能和小内存占用
		轻松便携
	准备复杂的环境
		通过使用Zabbix代理，使远程监控变得容易

三、安装
# yum -y install nginx


# yum -y install php70-php php70-php-bcmath php70-php-common php70-php-devel php70-php-gd php70-php-fpm php70-php-mcrypt php70-php-mbstring php70-php-mysqlnd php70-php-pear php70-php-pdo



























