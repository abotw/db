use master
go
--�л��������ָ�ģʽ��
if db_id('JXGL') is not null
    alter database JXGL set recovery full
go
--�ָ����ݿ��������
restore database JXGL from mydiff 
with replace,                                       --δ���ݽ�β��־������ͬ�����ݿ�
file=1,							            --�����������
--���ݿ��ļ�·������Ǩ�Ƶ�����λ�ã���e:\restore_data\
--move 'JXGL_data' to 'e:\restore_data\��ѧ����.mdf', 
--move 'JXGL_log' to 'e:\restore_data\��ѧ����.ldf',
norecovery
go
--�ָ����ݿ⵽ָ��ʱ�̣����2�β������ݿⱸ��ʱ��
restore database JXGL from mydiff 
with file=3,recovery
go
