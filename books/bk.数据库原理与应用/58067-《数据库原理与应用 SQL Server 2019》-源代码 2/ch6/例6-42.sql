use jxgl
go
create table ����(ѧ�� char(8),�γ̺� char(2),�ɼ� tinyint)
go
create proc retake as select ѧ��,�γ̺�, �ɼ� from ѡ�� where �ɼ�<60
go
insert into ����(ѧ��,�γ̺�, �ɼ� ) execute retake
