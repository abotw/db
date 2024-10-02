--切换到完整恢复模式下
alter database JXGL set recovery full
go			--创建一个备份设备
exec sp_addumpdevice 'disk','mylog','d:\backup\mylog.bak'
go			--完整备份数据库JXGL（基础部分）
backup database JXGL to mylog with name='jxg完整备份3',description='完整备份3',format
go			--创建事务日志备份1
backup log JXGL to mylog with name='JXGL日志备份1',description='第1次日志'
go
--创建事务日志备份2
backup log JXGL to mylog with name='JXGL日志备份2',description='第2次日志'
go
--查询备份集信息结果
restore headeronly from mylog
