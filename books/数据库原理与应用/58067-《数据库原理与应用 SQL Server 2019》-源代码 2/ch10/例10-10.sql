--关闭数据库JXGL
use master
go
--切换到完整恢复模式下
alter database JXGL set recovery full 
go
--备份尾日志，进入还原状态
backup log JXGL to mydata with norecovery
go
--还原完整备份3
restore database JXGL from mydata
With replace,						--覆盖现有的同名数据库
file=1,								--完整备份序号
norecovery							--注意，表示继续恢复
go
--这时数据库无法使用，继续恢复差异备份
restore database JXGL from mydata
with file=2, 						--差异备份序号
norecovery							--注意，表示继续恢复
go
--这时数据库仍然无法使用，继续恢复事务日志备份
restore log JXGL from mydata
with file=3, 						--日志备份序号
norecovery 							--注意，表示继续恢复
go
 --应用尾日志
restore log JXGL from mydata
with file=4, 						--尾日志备份序号
recovery 							--完成恢复，数据库可以使用
go
