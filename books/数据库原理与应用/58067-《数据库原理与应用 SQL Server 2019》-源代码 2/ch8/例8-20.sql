/* �����ձ����Ż���ԭ������Ҳ��*/

use jxgl
go
declare boy cursor for
  select * from ѧ�� where �Ա�='��' for read only	--�����α�
open boy													--���α�
close boy													--�ر��α�
declare boy scroll cursor for							
  select * from ѧ�� where �Ա�='��' 
     and �༶��='190101' /*�Ż���Ĵ���*/	     --����ͬ���α�
go
