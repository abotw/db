select ͼ����,���� from ͼ��
where  ͼ���� in (select ͼ���� from ����
group by ͼ���� having count(*)>=2)
