use master
go
--�л��������ָ�ģʽ��
if db_id('JXGL') is not null
 alter database JXGL set recovery full
go
--�����ݿ�JXGL��δ�ƻ�ʱ����Ҫ�������ݿ�β����־����
if db_id('JXGL') is not null
 backup log JXGL to myfull with name='JXGLβ��־����',
  description='β��־����',
  norecovery
go
--�ָ����ݿ�
restore database JXGL from myfull with recovery
go
