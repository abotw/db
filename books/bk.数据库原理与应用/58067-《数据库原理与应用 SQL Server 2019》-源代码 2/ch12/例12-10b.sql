--B����
use jxgl
go
begin tran
  select ʱ��1=getdate(),* from ѧ�� where ѧ��='19010101'--���ȴ�������ִ��
  go
  update ѧ�� set ����='��ΰ��' where ѧ��='19010101'		--����A�����ӳ�
  select ʱ��2=getdate(), * from ѧ�� where ѧ��='19010101'
commit tran
