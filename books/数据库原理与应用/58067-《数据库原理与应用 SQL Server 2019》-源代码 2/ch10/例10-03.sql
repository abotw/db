--�л��������ָ�ģʽ��
alter database JXGL set recovery full
go
--����һ�������豸
sp_addumpdevice 'disk','myfull','d:\backup\myfull.bak'
--��backup database�������ݿ�JXGL
backup database JXGL to myfull with name='JXGL��������1',description='��������1',format
go
--�鿴���ݼ���Ϣ
restore headeronly from myfull
