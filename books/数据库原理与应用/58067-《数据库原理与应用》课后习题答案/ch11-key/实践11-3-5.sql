--��1��
use library
go
grant create table to stu_login1_u
--��2��
use library
go
grant select,insert,update,delete on ͼ��to stu_login1_u
--��3��
use library
go
grant select on ͼ��(ͼ����,����,��������) to myrole with grant option
grant select on ͼ��(ͼ����,����,��������) to stu_login1_u,stu_login2_u with grant option
--(4)
select * from ͼ��   --�޷���ѯ
select ͼ����,����,��������from ͼ��  ---�ܲ�ѯ
--ע�⣺��֤���ڵ�¼��stu_login1״̬��
