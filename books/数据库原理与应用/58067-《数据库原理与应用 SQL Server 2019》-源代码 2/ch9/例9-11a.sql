use jxgl
go
create trigger ins_choose
on ѡ��
after insert
as
if (select count(*) from �γ�,inserted where �γ�.�γ̺�=inserted.�γ̺�)=0
begin
   raiserror('û�д˿γ�',16,1)
   rollback transaction
end
