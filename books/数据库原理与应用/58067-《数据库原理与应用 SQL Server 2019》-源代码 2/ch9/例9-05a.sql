use jxgl
go
create proc pro_avg_�ɼ�
@xm char(6)='������',@avgscore float output
as
select @avgscore=avg(�ɼ�)
 from ѧ��,ѡ��
 where ѧ��.ѧ��=ѡ��.ѧ�� and ����=@xm
go
