use library
go
--�����ʻ���bank--
if exists(select * from sys.objects where name='bank')
    drop table bank
create table bank(
customerName char(10), --�˿�����
currentMoney  money   --��ǰ���
)
go
/**//*--���Լ�����ʻ���������Ԫ--*/
alter table bank add constraint CK_currentMoney check(currentMoney>=1)
/**//*--�����������--*/
insert into bank(customerName,currentMoney)
select '����',1000 union
select '����',1
select * from bank
go
/**//*--ʹ������--*/
use library
go
--�ָ�ԭ��������
--update bank set currentMoney=currentMoney-1000 where customerName='��'
set nocount on    --����ʾ��Ӱ�������
print '�鿴ת������ǰ�����'
select * from bank
go
/**//*--��ʼ����--*/
begin transaction
declare @errorSum int    --��������������ۼ�����ִ�й����еĴ���
/**//*--ת��--*/
update bank set currentMoney=currentMoney-800 where customerName='����'
set @errorSum=@errorSum+@@error    --�ۼ��Ƿ��д���
update bank set currentMoney=currentMoney+800 where customerName='����'
set @errorSum=@errorSum+@@error --�ۼ��Ƿ��д���
print '�鿴ת����������е����'
select * from bank
/**//*--�����Ƿ��д���ȷ���������ύ���ǻع�--*/
if @errorSum>0
    begin
        print '����ʧ�ܣ��ع�����.'
        rollback transaction
    end
else
    begin
        print '���׳ɹ����ύ����д��Ӳ�̣����ñ��棡'
        commit transaction
    end
go
print '�鿴ת�ʺ�����'
select * from bank
go
