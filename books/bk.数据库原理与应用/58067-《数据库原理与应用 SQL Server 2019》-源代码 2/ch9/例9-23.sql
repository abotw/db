use jxgl
go
create trigger up_�༶ on �༶
after update
as
if update(�༶��)
begin
print '�γ̱�İ༶�Ų����޸�'
rollback transaction
end
