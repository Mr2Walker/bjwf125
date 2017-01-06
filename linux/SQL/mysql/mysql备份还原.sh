一、备份
$ sudo mysqldump -uroot  --master-data=2 --single-transaction --all-databases --socket=/data/mysql/mysql.sock >all.sql
二、恢复
$ mysql < all.sql
CHANGE MASTER TO MASTER_LOG_FILE='mysql-bin.000600', MASTER_LOG_POS=606032919;