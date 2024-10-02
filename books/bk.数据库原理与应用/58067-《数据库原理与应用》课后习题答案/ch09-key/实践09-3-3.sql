use library
go
create proc book_lend
@tsbh char(6),@jyrs int output
as 
select @jyrs=count(∂¡’ﬂ±‡∫≈)
from ΩË‘ƒ
where Õº È±‡∫≈=@tsbh
go
declare @tsbh char(6),@jyrs int
set @tsbh='TP0001'
exec book_lend @tsbh,@jyrs output
print @jyrs
