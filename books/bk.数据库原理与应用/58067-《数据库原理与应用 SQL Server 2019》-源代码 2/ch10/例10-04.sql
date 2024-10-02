--切换到完整恢复模式下
alter database JXGL set recovery full
go
--创建一个备份设备
sp_addumpdevice 'disk','mydiff','d:\backup\mydiff.bak'
go
--完整备份数据库JXGL（基础部分）
backup database JXGL to mydiff with name='JXGL完整备份2',description=' JXGL完整备份',format
go
--差异备份数据库JXGL
backup database JXGL to mydiff
with differential,
noinit,
name='JXGL差异备份1',description='第1次差异备份'
go
backup database JXGL to mydiff
with differential,
noinit,
name='JXGL差异备份2',description='第2次差异备份'
go 
--查看备份集信息
restore headeronly from mydiff
