alter database test2 add filegroup group1
go
alter database test2 add file
(name=test2a_data,filename='d:\test\test2a_data.ndf'),
(name=test2b_data,filename='d:\test\test2b_data.ndf') to filegroup group1
go
alter database test2 
  add log file(name=test2a_log,filename='d:\test\test2a_log.ldf')
