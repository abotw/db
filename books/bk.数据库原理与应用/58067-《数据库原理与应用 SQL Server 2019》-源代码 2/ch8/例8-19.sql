/* �����ձ����Ż���ԭ������Ҳ��*/
use jxgl
declare pass_score scroll cursor
   for 
   select * from ѡ�� where �༶��='190101' /*�Ż���Ĵ���*/
      and �ɼ�>=60 order by ѧ��
open pass_score					--���α�
fetch next from pass_score				--��ȡ�α�
--ѭ����ȡ�α�
while @@fetch_status=0
begin
 fetch next from pass_score
end
