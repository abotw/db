use library
go 
create trigger ins_����
 on ����
 instead of insert
as
if not exists(select * from ���� where ���߱��=(select ���߱�� from inserted))
/* if exists(select * from ����,inserted where ����.���߱��=inserted.���߱��)=0*/
print '���߱�Ų��洢�ڶ��߱��У����ܲ���ü�¼'
else
begin
  insert into ���� select * from inserted
  print '�Ѿ��ɹ������¼��'
end 
go
--��֤���£�
insert into ����(���߱��,ͼ����,��������,��������)
values('1012','TP0004',GETDATE(),null)

