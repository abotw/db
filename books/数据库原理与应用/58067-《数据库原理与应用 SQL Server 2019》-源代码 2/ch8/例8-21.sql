use jxgl
go
declare up_score_cursor cursor for
  select ѧ��,�γ̺�,�ɼ�,��ע from ѡ�� where �ɼ�<60
    for update of ��ע							--�����α�
open up_score_cursor							--���α�
  fetch next from up_score_cursor				--��ȡ�α�����
while @@fetch_status=0							--ѭ�����ºͶ�ȡ�α��е�������
 begin
  update ѡ�� set ��ע='֪ͨ����' 
   where current of up_score_cursor
  fetch next from up_score_cursor
 end
close up_score_cursor					--�ر��α�
deallocate up_score_cursor				--�ͷ��α�
--��ѯ�ɼ���С��60��������
select ѧ��,�γ̺�,�ɼ�,��ע from ѡ�� where �ɼ�<60
