use jxgl
go
begin tran
  select ʱ��1=getdate(),* from ѧ�� where ѧ��='19010101'--���ȴ�������ִ��
  go
  update ѧ�� set ����='������' where ѧ��='19010101'		--���ȴ�������ִ��
  select ʱ��2=getdate(), * from ѧ�� where ѧ��='19010101'
commit tran
