 select * from ͼ��
where ����>all(select avg(����) from ͼ��)
--��չ��Ŀ��
--��22��ʹ��Ƕ�ײ�ѯ����ѯ��������ͼ���ƽ�����۴�������ͼ���ƽ�����۵����ߡ�
select ����,avg(����) as ��������ͼ���ƽ������ from ͼ�� group by ����
 having avg(����)>(select avg(����) as ����ͼ���ƽ������ from ͼ��)
 go
 select avg(����) as ����ͼ���ƽ������ from ͼ��