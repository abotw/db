use jxgl
go
create trigger ins_ѡ�� on ѡ��
after insert
as
if (select count(*) from ѧ��,inserted where ѧ��.ѧ��=inserted.ѧ��)=0
begin
print '��ѧ�Ų�����ѧ�����У����ܲ���ü�¼'
rollback transaction
end
