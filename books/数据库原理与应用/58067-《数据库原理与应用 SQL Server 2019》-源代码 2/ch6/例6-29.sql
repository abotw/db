--���1��
select ����,�������� from ѧ�� where �Ա�='��'
 and ��������>any(select �������� from ѧ�� where �Ա�='Ů')
  go
--���2��
select ����,�������� from ѧ�� where �Ա�='��'
 and ��������>(select min(��������) from ѧ�� where �Ա�='Ů')
