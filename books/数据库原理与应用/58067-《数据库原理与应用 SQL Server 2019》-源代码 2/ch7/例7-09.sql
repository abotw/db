declare @sum as int
declare @i as smallint
set @sum=0
set @i=0
while @i<=100   /*����ѭ��ִ�е�����*/
 begin 
  set @i=@i+1
   if (@i%2)=0  /*�ж�@i�Ƿ�2���������ж��Ƿ�Ϊ����*/
    continue
   else
    set @sum=@sum+@i
   if @i>=99
    break 
 end   
print '1��100֮�������֮��Ϊ��'
  +convert(char(6),@sum)  /*���������*/
