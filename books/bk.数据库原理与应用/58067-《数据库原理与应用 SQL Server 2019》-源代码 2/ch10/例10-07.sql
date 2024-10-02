use master
go
--切换到完整恢复模式下
if db_id('JXGL') is not null
 alter database JXGL set recovery full
go
--当数据库JXGL尚未破坏时，需要进行数据库尾部日志备份
if db_id('JXGL') is not null
 backup log JXGL to myfull with name='JXGL尾日志备份',
  description='尾日志备份',
  norecovery
go
--恢复数据库
restore database JXGL from myfull with recovery
go
