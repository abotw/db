declare @xh char(8),@my cursor
set @xh='19010101'
exec cursor_ѡ�� @xh,@my output
fetch next from @my			    --��ȡ����
while(@@fetch_status=0)
 begin
  fetch next from @my			--��ȡ����
 end
close @my						--�ر��α�
deallocate @my					--ɾ���α�
