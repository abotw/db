use master
go
alter database library set recovery full
go
exec sp_addumpdevice 'disk','mydumplog','e:\dump\dumplog1.bak'
go
backup database library filegroup ='group1'
     to disk='e:\dump\dump2.bak'
     with name='library�ļ��鱸��',init
go
backup log library to mydumplog
     with name='library�ļ�����־����',init
go
