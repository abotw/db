--�ر����ݿ�JXGL
use master
go
--�л��������ָ�ģʽ��
alter database JXGL set recovery full 
go
--����β��־�����뻹ԭ״̬
backup log JXGL to mydata with norecovery
go
--��ԭ��������3
restore database JXGL from mydata
With replace,						--�������е�ͬ�����ݿ�
file=1,								--�����������
norecovery							--ע�⣬��ʾ�����ָ�
go
--��ʱ���ݿ��޷�ʹ�ã������ָ����챸��
restore database JXGL from mydata
with file=2, 						--���챸�����
norecovery							--ע�⣬��ʾ�����ָ�
go
--��ʱ���ݿ���Ȼ�޷�ʹ�ã������ָ�������־����
restore log JXGL from mydata
with file=3, 						--��־�������
norecovery 							--ע�⣬��ʾ�����ָ�
go
 --Ӧ��β��־
restore log JXGL from mydata
with file=4, 						--β��־�������
recovery 							--��ɻָ������ݿ����ʹ��
go
