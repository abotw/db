declare @score float
declare @status int
exec @status = avgscore '19��ƣ�1����', @score output
-- ��鷵��ֵ
if @status = 1
   print'ƽ���ɼ�:'+ cast(@score as varchar(20))
else
   print 'û�ж�Ӧ�ļ�¼'
