use library
go
create proc reader_info
@dzbh char(4)='1001'
as
select * from ���� where ���߱��=@dzbh
go
exec reader_info
go
exec reader_info default
go
exec reader_info '1002'
go
