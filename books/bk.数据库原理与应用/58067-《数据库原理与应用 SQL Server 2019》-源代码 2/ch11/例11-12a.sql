use jxgl
--创建应用程序角色
create application role approle with password='123456'
--授予应用程序角色select权限
grant select on object::dbo.班级 to approle
--创建登录账户
create login sql_loginP with password ='test',default_database=JXGL
--创建数据用户
create user sql_loginP_U for login sql_loginP
