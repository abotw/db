select * from ����
where  ���߱�� in (select ���߱�� from ����
group by ���߱�� having count(*)>=2)
