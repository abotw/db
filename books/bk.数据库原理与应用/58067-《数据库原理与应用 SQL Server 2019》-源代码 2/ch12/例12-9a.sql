--A����
use jxgl
go
begin tran
  update ѧ�� set ����='ϯͬ��' where ѧ��='19010101'
  waitfor delay '00:00:10' 						--�ȴ�10��
commit tran
