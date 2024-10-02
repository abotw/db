use jxgl
declare @cookie varbinary(8000);                   --初始化变量
exec sys.sp_setapprole 'approle','123456',
   @fCreateCookie=true,@cookie=@cookie output;   --激活应用程序角色
select * from dbo.班级                                --查询dbo架构下的表
exec sys.sp_unsetapprole @cookie;                  --解除应用程序角色
