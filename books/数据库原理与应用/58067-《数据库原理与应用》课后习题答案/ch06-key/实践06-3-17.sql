select count(*) as �ݲ�����,���� 
into author from ͼ�� group by ���� 
having count(*)>=all(select count(*) from ͼ�� group by ����)
--����
select top 1 count(*) as �ݲ�����,���� 
into author from ͼ�� group by ���� order by count(*) desc