use jxgl
go
begin transaction
insert into ѧ��(ѧ��,����,�Ա�,�ܷ�,����)
 values('22010104','���л�','��',550,'ɽ��')
select * from ѧ�� where ����='ɽ��'
update ѧ��set �Ա�='Ů' where ѧ��='22010104'
select * from ѧ�� where ����='ɽ��'
commit transaction
