use jxgl
go
if exists (select * from sys.triggers where parent_class=0 and name='alt_JXGL')
   drop trigger alt_JXGL on database   --ɾ���Ѵ��ڵ�ͬ��������
go
create trigger alt_JXGL
  on database
  after drop_table,alter_table
  as
   begin
    print '��ֹɾ������޸ı�ṹ'
    rollback transaction
   end
