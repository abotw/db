use library
go 
create trigger ins_����
on ����
for insert
as
if (select count(*) from ���� where ���߱��=(select ���߱�� from inserted ))>20
begin
 rollback transaction
print ���ö����Ѿ������Ѿ�����涨������������ֹ���顯
end
--��֤����
insert into ����(���߱��,������,����)values('1001','F27505', '11')
