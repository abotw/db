use jxgl
go
set implicit_transactions off    --ʹ����ʽ����ģʽ
select ����=0,* from ѧ��			 --��鵱ǰ�������
begin transaction
  insert into ѧ��(ѧ��,����,�Ա�)values('22010101','˾�䳤','��')
save transaction label
  insert into ѧ��(ѧ��,����,�Ա�)values('22010102','�ǼѼ�','Ů')
  select ����=1,* from ѧ��		--��ʾ����������¼
rollback transaction label		--�ع������񱣴��
  select ����=2,* from ѧ��		--��ʾ��1�β���ļ�¼��������
rollback transaction
  select ����=3,* from ѧ��		--��ʾ��2�β���ļ�¼��������
