use jxgl
declare @cookie varbinary(8000);                   --��ʼ������
exec sys.sp_setapprole 'approle','123456',
   @fCreateCookie=true,@cookie=@cookie output;   --����Ӧ�ó����ɫ
select * from dbo.�༶                                --��ѯdbo�ܹ��µı�
exec sys.sp_unsetapprole @cookie;                  --���Ӧ�ó����ɫ
