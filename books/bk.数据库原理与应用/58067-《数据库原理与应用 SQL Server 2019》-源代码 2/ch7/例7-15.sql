declare @num2 float
set @num2 = 1234.56
select convert(varchar(50), @num2, 0) --������6λֵ��������Ҫʹ�ÿ�ѧ������
select convert(varchar(50), @num2, 1) --ʼ��Ϊ8λֵ��ʼ��ʹ�ÿ�ѧ������
select convert(varchar(50), @num2, 2) --ʼ��Ϊ16λֵ��ʼ��ʹ�ÿ�ѧ������
