use jxgl
go
if exists (select * from sys.triggers where parent_class=0 and name='alt_JXGL')
   drop trigger alt_JXGL on database   --删除已存在的同名触发器
go
create trigger alt_JXGL
  on database
  after drop_table,alter_table
  as
   begin
    print '禁止删除表和修改表结构'
    rollback transaction
   end
