--A����
use jxgl
go
begin tran
  select ʱ��0=getdate(),* from ѧ�� with (holdlock)		--��Ϊ��holdlock��
  where ѧ��='19010101'
  waitfor delay '00:00:10'								--�ӳ�10����������
commit tran
--B����
use jxgl
go
begin tran
  select ʱ��1=getdate(),* from ѧ�� where ѧ��='19010101'--���ȴ�������ִ��
  go
  update ѧ�� set ����='��ΰ��' where ѧ��='19010101'		--����A�����ӳ�
  select ʱ��2=getdate(), * from ѧ�� where ѧ��='19010101'
commit tran
