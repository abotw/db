use jxgl
go
declare status_boy cursor scroll
 for select * from ѧ�� where �Ա�='��'
print cursor_status('global','status_boy')	--���α�ǰ  ��ʾ��-1
open status_boy								--���α�
print cursor_status('global','status_boy')	--���α��  ��ʾ��1
close status_boy							--�ر��α�
print cursor_status('global','status_boy')	--�ر��α��  ��ʾ��-1
deallocate status_boy						--�ͷ��α�
print cursor_status('global','status_boy')	--�ͷ��α��  ��ʾ��-3
