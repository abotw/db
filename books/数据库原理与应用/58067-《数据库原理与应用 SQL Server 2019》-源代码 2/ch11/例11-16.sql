use jxgl
go      --ɾ�����ݿ��ɫ֮ǰ����ת�ƴ����ݿ��ɫӵ�еļܹ�
alter authorization on schema::db_accessadmin to db_accessadmin
go      --ɾ�����ݿ��ɫ֮ǰ����ɾ�������ݿ��ɫ�еĳ�Ա
alter role user_role_ssms drop member win_regA_U 
go
if exists(select * from sys.database_principals where name='user_role_ssms')
drop role user_role_ssms
