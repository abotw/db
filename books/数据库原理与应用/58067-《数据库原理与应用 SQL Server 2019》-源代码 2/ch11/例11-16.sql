use jxgl
go      --删除数据库角色之前，需转移此数据库角色拥有的架构
alter authorization on schema::db_accessadmin to db_accessadmin
go      --删除数据库角色之前，需删除此数据库角色中的成员
alter role user_role_ssms drop member win_regA_U 
go
if exists(select * from sys.database_principals where name='user_role_ssms')
drop role user_role_ssms
