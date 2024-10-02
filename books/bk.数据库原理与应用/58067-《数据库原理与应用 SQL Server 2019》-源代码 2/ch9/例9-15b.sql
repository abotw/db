use master
go
If exists(select * from sys.server_triggers where name=N'Tri_logon')
  drop trigger Tri_logon on all server     --删除已存在的同名触发器
go
create trigger Tri_logon
  on all server for logon
  as
  begin
  if original_login()='Test_logon'and datepart(hh,getdate()) between 8 and 20
   begin
    print N'限制登录用户Test_logon在8~20点之间登录数据库' ;
    rollback
   end
  end
