use master
go
if exists(select name from sys.objects
 where name ='sp_showtableindex' and type='p')
drop proc sp_showtableindex      --删除已存在的同名存储过程
go
create proc sp_showtableindex @tablename varchar(30)='学生'
as
select tab.name as 表名,inx.name as 索引名,indid as 索引标识号
 from sysindexes inx join sysobjects tab on tab.id=inx.id
 where tab.name like @tablename
