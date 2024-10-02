alter database lx 
 add filegroup dy
go
alter database lx 
add file 
(name=dya,filename='d:\stu\dya.ndf'),
(name=dyb,filename='d:\stu\dyb.ndf')
to filegroup dy
go
