core = �ɼ� from deleted 
if @score>60
begin
 rollback transaction 
 raiserror('������ɾ���ɼ�����60�ļ�¼',16,1)
end
