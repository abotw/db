use jxgl
go 
declare del_score_cursor cursor
for select ѧ��,�γ̺�,�ɼ� from ѡ�� where �ɼ� is null
  for update											--�����α�
open del_score_cursor								--���α�
fetch next from del_score_cursor					--��ȡ�α�����
while @@fetch_status=0								--ѭ��ɾ���Ͷ�ȡ�α�������
 begin
  delete from ѡ��
    where current of del_score_cursor
  fetch next from del_score_cursor
 end
close del_score_cursor								--�ر��α�
deallocate del_score_cursor							--�ͷ��α�
--��ѯ�ɼ���Ϊ�յ�������
select ѧ��,�γ̺�,�ɼ� from ѡ�� where �ɼ� is null
