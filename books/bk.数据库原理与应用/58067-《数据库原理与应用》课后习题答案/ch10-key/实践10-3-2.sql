use master
go
alter database library
modify filegroup group2 readonly
go
alter database library
modify filegroup group3 readonly
go
backup database library to mydump 
     with name='library��������',init
go
