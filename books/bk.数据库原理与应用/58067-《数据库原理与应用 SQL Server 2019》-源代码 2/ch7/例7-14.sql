declare @num money
set @num = 1234.56
select convert(varchar(50), @num, 0)  --����ʾǧλ�ָ�����С�����Ҳ�ȡ��λ��
select convert(varchar(50), @num, 1)  --��ʾǧλ�ָ�����С�����Ҳ�ȡ��λ��
select convert(varchar(50), @num, 2)  --����ʾǧλ�ָ�����С�����Ҳ�ȡ��λ��
