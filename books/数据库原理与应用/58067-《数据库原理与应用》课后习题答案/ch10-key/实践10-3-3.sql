use master
go
alter database library set recovery full
go
backup database library to mydump 
     with  differential,name='library���챸��'
go
backup log library to disk='e:\dump\dumplog.bak'
     with name='library��־����',init
go
