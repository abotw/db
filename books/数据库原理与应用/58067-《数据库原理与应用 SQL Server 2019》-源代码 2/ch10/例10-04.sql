--�л��������ָ�ģʽ��
alter database JXGL set recovery full
go
--����һ�������豸
sp_addumpdevice 'disk','mydiff','d:\backup\mydiff.bak'
go
--�����������ݿ�JXGL���������֣�
backup database JXGL to mydiff with name='JXGL��������2',description=' JXGL��������',format
go
--���챸�����ݿ�JXGL
backup database JXGL to mydiff
with differential,
noinit,
name='JXGL���챸��1',description='��1�β��챸��'
go
backup database JXGL to mydiff
with differential,
noinit,
name='JXGL���챸��2',description='��2�β��챸��'
go 
--�鿴���ݼ���Ϣ
restore headeronly from mydiff
