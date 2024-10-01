alter trigger alt_jxgl
on database 
after drop_table,alter_table,drop_index
as 	
begin
print '禁止删除表、修改表结构和删除索引'
rollback transaction
end
