/* �����ձ����Ż���ԭ������Ҳ��*/
use jxgl
go
if exists(select name from sys.objects
 where name ='proc_score' and type ='p')
drop proc proc_score     --ɾ���Ѵ��ڵ�ͬ���洢����
go
--�����洢���̷�����1������������߷�
create procedure proc_score;1
as
select �༶��,max(�ɼ�) as ��߷� from ѧ��,ѡ��
  where ѡ��.ѧ��=ѧ��.ѧ��
    group by�༶��
go
--�����洢���̷�����2������������ͷ�
create procedure proc_score;2
as
select �༶��,min(�ɼ�) as ��ͷ�
  from ѧ��,ѡ��
  where ѡ��.ѧ��=ѧ��.ѧ��
    group by �༶��
 go
