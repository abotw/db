use jxgl
declare @avgscore float,@sumscore float
select @avgscore=avg(�ɼ�),@sumscore=sum(�ɼ�)
 from ѧ��,ѡ��
where ѧ��.ѧ��=ѡ��.ѧ��
 and �Ա�='��'
select  @avgscore,@sumscore
