use jxgl
declare boy scroll cursor
   for select * from ѧ�� where �Ա�='��'
-- û�д��α�ʱ��@@cursor_rows����ֵΪ0
print @@cursor_rows
open boy
-- ���α��,@@cursor_rows���ص�ǰ�α��������
if @@cursor_rows > 0
   print @@cursor_rows
go
