use master
go
If exists(select * from sys.server_triggers where name=N'Tri_logon')
  drop trigger Tri_logon on all server     --ɾ���Ѵ��ڵ�ͬ��������
go
create trigger Tri_logon
  on all server for logon
  as
  begin
  if original_login()='Test_logon'and datepart(hh,getdate()) between 8 and 20
   begin
    print N'���Ƶ�¼�û�Test_logon��8~20��֮���¼���ݿ�' ;
    rollback
   end
  end
