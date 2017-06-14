rsync命令是一个远程数据同步工具，可通过LAN/WAN快速同步多台主机间的文件。rsync使用所谓的“rsync算法”来使本地和远程两个主机之间的文件达到同步，这个算法只传送两个文件的不同部分，而不是每次都整份传送，因此速度相当快。 rsync是一个功能非常强大的工具，其命令也有很多功能特色选项.
	
语法：
	rsync [OPTION]... SRC DEST 
	rsync [OPTION]... SRC [USER@]host:DEST 
	rsync [OPTION]... [USER@]HOST:SRC DEST 
	rsync [OPTION]... [USER@]HOST::SRC DEST 
	rsync [OPTION]... SRC [USER@]HOST::DEST 
	rsync [OPTION]... rsync://[USER@]HOST[:PORT]/SRC [DEST]

对于以上六种命令格式，rsync有六种不同的工作模式：

1、拷贝本地文件，当SRC和DEST路径都不包含有单个冒号":"分隔符时就启动这种工作模式。
	如：rsync -a /data /backup

2、使用一个远程shell程序(如rsh、ssh)来实现将本地机器的内容拷贝到远程机器。当DEST地址路径包含单个冒号":"分隔符时启动该模式。
	如：rsync -avz *.c foo:src

3、使用一个远程shell程序(如rsh、ssh)来实现将远程机器的内容拷贝到本地机器。当SRC地址路径包含单个冒号":"分隔符时启动该模式。
	如：rsync -avz foo:src/bar /data

4、从远程rsync服务器中拷贝文件到本地机器。当SRC


































































































































