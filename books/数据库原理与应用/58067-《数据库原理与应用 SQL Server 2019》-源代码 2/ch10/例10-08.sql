use master
go
--切换到完整恢复模式下
if db_id('JXGL') is not null
    alter database JXGL set recovery full
go
--恢复数据库基础部分
restore database JXGL from mydiff 
with replace,                                       --未备份结尾日志，覆盖同名数据库
file=1,							            --完整备份序号
--数据库文件路径可以迁移到其他位置，如e:\restore_data\
--move 'JXGL_data' to 'e:\restore_data\教学管理.mdf', 
--move 'JXGL_log' to 'e:\restore_data\教学管理.ldf',
norecovery
go
--恢复数据库到指定时刻，如第2次差异数据库备份时刻
restore database JXGL from mydiff 
with file=3,recovery
go
