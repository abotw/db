select * from ����
where not exists (select * from ���� 
 where ���߱��=����.���߱��)
go --����
select * from ����
where ���߱�� not in (select ���߱�� from ����)