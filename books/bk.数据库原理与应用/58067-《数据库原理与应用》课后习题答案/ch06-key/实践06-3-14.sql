Select max(�ѽ�����),min(�ѽ�����),avg(�ѽ�����) from ����

--�Ż��������£�

update ����
set �ѽ�����=(
select COUNT(*) from ���� 
where ����.���߱��=����.���߱��
group by ���߱��)
go
select max(�ѽ�����) as ��������,min(�ѽ�����) as ���ٽ�����,
avg(�ѽ�����) as ƽ�������� from ���� 

