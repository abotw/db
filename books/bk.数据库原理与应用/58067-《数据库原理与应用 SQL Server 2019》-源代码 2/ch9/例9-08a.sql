use master
go
if exists(select name from sys.objects
 where name ='sp_showtableindex' and type='p')
drop proc sp_showtableindex      --ɾ���Ѵ��ڵ�ͬ���洢����
go
create proc sp_showtableindex @tablename varchar(30)='ѧ��'
as
select tab.name as ����,inx.name as ������,indid as ������ʶ��
 from sysindexes inx join sysobjects tab on tab.id=inx.id
 where tab.name like @tablename
