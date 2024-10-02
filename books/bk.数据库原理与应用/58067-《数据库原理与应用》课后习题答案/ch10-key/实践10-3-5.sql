use master
go
restore database library
   from mydump
with file=1,norecovery,replace
go
restore database library
   from mydump
with file=2,norecovery,replace
go
restore log library 
   from disk='e:\dump\dumplog.bak'
go
