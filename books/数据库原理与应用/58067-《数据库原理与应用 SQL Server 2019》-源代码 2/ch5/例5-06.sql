/*�����޸�*/
use jxgl
go
create table ѡ��(
�ɼ����� int identity(1,1)
,ѧ�� char(8) not null constraint fk_ѧ�� foreign key references ѧ��(ѧ��)
,�γ̺� char(2) not null
,constraint pk_ѡ�� primary key(ѧ��,�γ̺�)
,�ɼ� numeric(3,1) check(�ɼ�>=0 and �ɼ�<=100)	/*checkԼ��Ҳ��������Լ����*/
,��ע varchar(MAX))
