--�ر����ݿ�JXGL
use master
go
--�л��������ָ�ģʽ��
if db_id('JXGL') is not null
 alter database JXGL set recovery full 
go
--����β��־�����뻹ԭ״̬
if db_id('JXGL') is not null
 backup log JXGL to mylog with norecovery
go
--��ԭ��������
restore database JXGL from mylog
with replace,						--�������е�ͬ�����ݿ�
file=1,							--�����������
norecovery							--ע�⣬��ʾ�����ָ�
go
--��ʱ���ݿ��޷�ʹ�ã������ָ�������־����
restore log JXGL from mylog
with file=2, 						--��־�������
norecovery							--ע�⣬��ʾ�����ָ�
go
--��ʱ���ݿ���Ȼ�޷�ʹ�ã������ָ�������־����
restore log JXGL from mylog
with file=3, 						--��־�������
norecovery 						--ע�⣬��ʾ�����ָ�
go
 --Ӧ��β��־
restore log JXGL from mylog
with file=4, 						--β��־�������
recovery 							--��ɻָ������ݿ����ʹ��
go
