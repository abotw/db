--�л��������ָ�ģʽ��
alter database JXGL set recovery full
go			--����һ�������豸
exec sp_addumpdevice 'disk','mylog','d:\backup\mylog.bak'
go			--�����������ݿ�JXGL���������֣�
backup database JXGL to mylog with name='jxg��������3',description='��������3',format
go			--����������־����1
backup log JXGL to mylog with name='JXGL��־����1',description='��1����־'
go
--����������־����2
backup log JXGL to mylog with name='JXGL��־����2',description='��2����־'
go
--��ѯ���ݼ���Ϣ���
restore headeronly from mylog
