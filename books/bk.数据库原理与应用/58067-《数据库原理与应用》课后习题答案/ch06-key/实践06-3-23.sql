select * from ͼ��
where ������='�ߵȽ���������' and ����>all(select avg(����) from ͼ��)


--��չ��Ŀ��
--��23����ѯ�����������Ķ��۸���������ͼ���ƽ�����۵�ͼ����Ϣ��
Select * from ͼ�� a
 where ����>(select avg(����) from ͼ�� b where a.������=b.������)
