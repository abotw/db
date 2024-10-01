--切换到完整恢复模式下
alter database JXGL set recovery full
go
--创建一个备份设备
sp_addumpdevice 'disk','myfull','d:\backup\myfull.bak'
--用backup database备份数据库JXGL
backup database JXGL to myfull with name='JXGL完整备份1',description='完整备份1',format
go
--查看备份集信息
restore headeronly from myfull
