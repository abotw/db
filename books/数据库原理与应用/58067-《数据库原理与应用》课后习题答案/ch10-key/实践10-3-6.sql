use master
go
restore database library1 filegroup ='group1'
from mydump
with partial,replace,
move 'bsgroup1file1' to 'f:\group1file1data.ndf',
move 'bsgroup1file2' to 'f:\group1file2data.ndf',
move 'bsprimaryfile1' to 'f:\primaryfile1data.mdf',
move 'bslogfile1' to 'f:\logfile1.ldf'
go
