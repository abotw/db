use jxgl
go
if exists(select * from sysobjects where name='up_ѡ��' and type ='tr') 
  drop trigger up_ѡ��     --ɾ���Ѵ��ڵ�ͬ��������
go
create trigger up_ѡ��
on ѡ��
for update
as
if update(�ɼ�)
begin
 select inserted.ѧ��,inserted.�γ̺�,deleted.�ɼ� ԭ�ɼ�,inserted.�ɼ� �³ɼ�
 from deleted,inserted
 where deleted.ѧ��= inserted.ѧ�� and deleted.�γ̺�= inserted.�γ̺� 
end
