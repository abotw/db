use jxgl
go
set implicit_transactions on    --ʹ����ʽ����ģʽ
   insert into ѧ��(ѧ��,����,�Ա�)values('22010102','�ǼѼ�','Ů')
rollback
   insert into ѧ��(ѧ��,����,�Ա�)values('22010101','˾�䳤','��')
commit
   select * from ѧ��
