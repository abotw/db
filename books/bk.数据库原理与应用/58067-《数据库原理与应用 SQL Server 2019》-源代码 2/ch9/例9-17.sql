alter trigger alt_jxgl
on database 
after drop_table,alter_table,drop_index
as 	
begin
print '��ֹɾ�����޸ı�ṹ��ɾ������'
rollback transaction
end
