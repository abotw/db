create trigger up_ͼ��
on ͼ��
for update,insert
as
declare @price int
select  @price =���� from inserted
if @price <20
 begin
  
��rollback transaction
print '���۱�����20Ԫ����'
end
go
