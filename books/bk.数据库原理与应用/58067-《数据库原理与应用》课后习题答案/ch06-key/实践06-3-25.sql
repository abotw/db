select * from ����
where exists (select * from ����,ͼ��
where ����.���߱��=����.���߱�� and ͼ��.ͼ����=����.ͼ����
and ����='���ݽṹ')

go
select * from ����
where exists (select * from ����
where exists (select * from ͼ��
where ����.���߱��=����.���߱�� and ͼ��.ͼ����=����.ͼ����
and ����='���ݽṹ'))
go
select ����.* from ����,����,ͼ��
where ����.���߱��=����.���߱�� and ͼ��.ͼ����=����.ͼ����
and ����='���ݽṹ'
go
select *  from ����
where ���߱�� in (
select ���߱�� from ���� where ͼ����
in ( select ͼ����
from ͼ�� where ����='���ݽṹ') 
)