use jxgl
--����Ӧ�ó����ɫ
create application role approle with password='123456'
--����Ӧ�ó����ɫselectȨ��
grant select on object::dbo.�༶ to approle
--������¼�˻�
create login sql_loginP with password ='test',default_database=JXGL
--���������û�
create user sql_loginP_U for login sql_loginP
