select ѧ��,avg(�ɼ�) as ƽ���ɼ� from ѡ�� group by ѧ��
 having avg(�ɼ�)>(select avg(�ɼ�) from ѡ��)
