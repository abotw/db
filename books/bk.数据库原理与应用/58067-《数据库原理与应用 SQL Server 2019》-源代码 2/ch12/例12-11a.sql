use jxgl
go
begin tran
  select ʱ��0=getdate(),* from ѧ�� with (tablock)		--��Ϊ��tablock��
  where ѧ��='19010101'
  waitfor delay '00:00:10'								--�ӳ�10����������
commit tran
