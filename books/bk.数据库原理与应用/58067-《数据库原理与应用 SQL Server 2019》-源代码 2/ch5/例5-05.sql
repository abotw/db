/*�����޸�*/
use jxgl
go
create table ѧ��(
ѧ�� char(8) not null constraint pk_ѧ�� primary key,
���� char(6) not null,
�Ա� char(2) constraint df_ѧ��_�Ա� default '��',
�������� datetime,
�ܷ� int,���� char(4),��ע varchar(MAX),�༶�� char(6))
