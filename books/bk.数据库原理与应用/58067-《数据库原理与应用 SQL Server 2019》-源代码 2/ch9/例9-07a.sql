/* �����ձ����Ż���ԭ������Ҳ��*/
use jxgl
go
create procedure avgscore 
@classname varchar(20),@score float output
as
declare @classid int        --����ֵ����ֻ����int����
set @classid = 0
--ͨ���༶���Ʋ���@classname, ��ȡ�༶���@classid
select @classid = �༶�� from �༶
  where �༶����=@classname   
if @classid=0				--�ַ����Ϳ�ת��Ϊint����
  return 0 					--���÷���ֵΪ0
else
  begin
 select @score=avg(�ɼ�) from ѧ��,ѡ��
    where ѡ��.ѧ��=ѧ��.ѧ��
	 and �༶��=@classid
  return 1					--���÷���ֵΪ1
  end
