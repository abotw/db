select ѧ��,avg(�ɼ�) as avg_�ɼ� into temp from ѡ�� group by ѧ��
go
select ѡ��.* from ѡ��,temp  where  ѡ��.ѧ��=temp.ѧ�� and �ɼ�>avg_�ɼ�
