use jxgl
go
set transaction isolation level read uncommitted
begin tran 
 update ѧ��set �ܷ�=�ܷ�+5 where ����='ɽ��'
 select ����=1,* from ѧ�� where ����='ɽ��'
 waitfor delay '00:00:10'		--��ͣ10��
 rollback transaction			--�ع�����
 select ����=2,* from ѧ�� where ����='ɽ��'
