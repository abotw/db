use jxgl
go
if exists(select * from sysobjects where name='up_ѧ��' and type ='tr') 
drop trigger up_ѧ��    --ɾ���Ѵ��ڵ�ͬ��������
go
create trigger up_ѧ��
on ѧ��
for update
as
if update(ѧ��)
update ѡ�� set ѡ��.ѧ��=inserted.ѧ��		--ѡ��inserted��
from ѡ��,inserted,deleted
where ѡ��.ѧ��=deleted.ѧ��					--ѡ��deleted��
