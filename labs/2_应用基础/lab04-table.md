---
title: "Lab 04: 数据表的创建和管理"
layout: page
parent: Labs
last updated: 2024-11-13T19:17:00
---

# Lab 04: 数据表的创建和管理 (2h)

## Contents

### 第1关：使用T-SQL语句创建“图书”和“读者”两表

![](Pasted%20image%2020241107172109.png)

#### “图书”表结构

| 列名   | 数据类型          | 备注                    |
| ---- | ------------- | --------------------- |
| 图书编号 | `char(6)`     | not null, primary key |
| 书名   | `varchar(30)` | not null              |
| 类别   | `char(12)`    |                       |
| 作者   | `varchar(20)` |                       |
| 出版社  | `varchar(20)` |                       |
| 出版日期 | `datetime`    |                       |
| 定价   | `money`       |                       |

#### “读者”表结构

| 列名   | 数据类型          | 备注       |
| ---- | ------------- | -------- |
| 读者编号 | `char(4)`     | not null |
| 姓名   | `char(6)`     | not null |
| 性别   | `char(2)`     |          |
| 单位   | `varchar(20)` |          |
| 电话   | `varchar(13)` |          |
| 读者类型 | `int`         |          |
| 已借数量 | `int`         |          |

```sql
-- 指定使用 library 数据库
use library;
go
-- 创建图书表
create table 图书
(图书编号 char(6) not null primary key,
 书名 varchar(30) not null,
 类别 char(12),
 作者 varchar(20),
 出版社 varchar(20),
 出版日期 datetime,
 定价 money
);
-- 创建读者表
create table 读者
(读者编号 char(4) not null,
 姓名 char(6) not null,
 性别 char(2),
 单位 varchar(20),
 电话 varchar(13),
 读者类型 int,
 已借数量 int
);
go
```

### 第2关：使用T-SQL语句创建“读者类型”和“借阅”两表

![](Pasted%20image%2020241107172133.png)

#### "读者类型" 表结构

| 列名   | 数据类型      | 备注       |
| ---- | --------- | -------- |
| 类型编号 | `int`     | not null |
| 类型名称 | `char(6)` | not null |
| 限借数量 | `int`     | not null |
| 借阅期限 | `int`     |          |

#### ”借阅“表结构

| 列名   | 数据类型       | 备注                    |
| ---- | ---------- | --------------------- |
| 读者编号 | `char(4)`  | not null              |
| 图书编号 | `char(6)`  | not null, foreign key |
| 借书日期 | `datetime` | not null              |
| 还书日期 | `datetime` |                       |

```sql
-- 指定使用 library 数据库
use library;
go
-- 创建读者类型表
create table 读者类型
(类型编号 int not null,
 类型名称 char(6) not null,
 限借数量 int not null,
 借阅期限 int
);
-- 创建借阅表
create table 借阅
(读者编号 char(4) not null,
 图书编号 char(6) not null,
 借书日期 datetime not null,
 还书日期 datetime,
 foreign key (图书编号) references 图书(图书编号)
);
go
```

### 第3关：使用T-SQL语句完成数据表的修改：添加主键


```sql
use library;
go

alter table 读者类型
add constraint pk_读者类型_类型编号 primary key (类型编号);
go
```

### 第4关：使用T-SQL语句完成数据表的修改：添加外键

```sql
use library;
go

alter table 读者
add constraint fk_读者_读者类型 foreign key (读者类型) references 读者类型(类型编号);
go
```

### 第5关：使用T-SQL 语句完成数据表的修改：添加主键

```sql
use library;
go

alter table 读者
add constraint pk_读者_读者编号 primary key (读者编号);
go
```

```sql
alter table table_name
add constraint constraint_name primary key (column_name);
```

### 第6关：使用T-SQL 语句完成数据表的修改：添加check约束

```sql
use library;
go

alter table 读者
add constraint ck_读者_性别 check (性别 = '男' or 性别 = '女');
go
```

```sql
alter table table_anme
add constraint constraint_name check conditions;
```

### 第7关：使用T-SQL 语句完成数据表的修改：添加default约束

```sql
use library;
go

alter table 借阅
add constraint df_借阅_借书日期
default getdate() for 借书日期;
go
```

```sql
alter table table_name
add constraint constraint_name
default default_value for column_name;
```

### 第8关：使用T-SQL 语句完成数据表的修改：添加外键约束

```sql
use library;
go

alter table 借阅
add constraint fk_借阅_读者
foreign key (读者编号) references 读者(读者编号);
go
```

```sql
alter table table_name
add constraint constraint_name
foreign key (column_name) references table_name(column_name);
```

### 第9关：使用T-SQL 语句完成数据表的修改：添加唯一约束

```sql
use library;
go

alter table 借阅
add constraint uk_借阅
unique (读者编号, 图书编号, 借书日期);
go
```

```sql
alter table table_name
add constraint constraint_name
unique (column_name1, column_name2, ...)
```

### 第10关：使用T-SQL 语句完成数据表的修改：添加列并附加标识规范列和主键约束

```sql
use library;
go

alter table 借阅
add 串号 int identity
constraint pk_借阅_串号 primary key;
go
```

### 第11关：创建用户自定义数据类型

```sql
use library;
go

create type dbo.编号
from varchar(20) not null;
go
```

## Notes

### [CREATE TABLE (Transact-SQL)](https://learn.microsoft.com/zh-tw/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver16)

#### syntax

```sql
CREATE TABLE
    { database_name.schema_name.table_name | schema_name.table_name | table_name }
    ( { <column_definition> } [ ,... n ] )
[ ; ]
```

```sql
CREATE TABLE
    { database_name.schema_name.table_name | schema_name.table_name | table_name }
    [ AS FileTable ]
    ( { <column_definition>
        | <computed_column_definition>
        | <column_set_definition>
        | [ <table_constraint> ] [ ,... n ]
        | [ <table_index> ] }
          [ ,... n ]
          [ PERIOD FOR SYSTEM_TIME ( system_start_time_column_name
             , system_end_time_column_name ) ]
      )
    [ ON { partition_scheme_name ( partition_column_name )
           | filegroup
           | "default" } ]
    [ TEXTIMAGE_ON { filegroup | "default" } ]
    [ FILESTREAM_ON { partition_scheme_name
           | filegroup
           | "default" } ]
    [ WITH ( <table_option> [ ,... n ] ) ]
[ ; ]

<column_definition> ::=
column_name <data_type>
    [ FILESTREAM ]
    [ COLLATE collation_name ]
    [ SPARSE ]
    [ MASKED WITH ( FUNCTION = 'mask_function' ) ]
    [ [ CONSTRAINT constraint_name ] DEFAULT constant_expression ]
    [ IDENTITY [ ( seed , increment ) ]
    [ NOT FOR REPLICATION ]
    [ GENERATED ALWAYS AS { ROW | TRANSACTION_ID | SEQUENCE_NUMBER } { START | END } [ HIDDEN ] ]
    [ [ CONSTRAINT constraint_name ] {NULL | NOT NULL} ]
    [ ROWGUIDCOL ]
    [ ENCRYPTED WITH
        ( COLUMN_ENCRYPTION_KEY = key_name ,
          ENCRYPTION_TYPE = { DETERMINISTIC | RANDOMIZED } ,
          ALGORITHM = 'AEAD_AES_256_CBC_HMAC_SHA_256'
        ) ]
    [ <column_constraint> [ ,... n ] ]
    [ <column_index> ]

<data_type> ::=
[ type_schema_name. ] type_name
    [ ( precision [ , scale ] | max |
        [ { CONTENT | DOCUMENT } ] xml_schema_collection ) ]

<column_constraint> ::=
[ CONSTRAINT constraint_name ]
{
   { PRIMARY KEY | UNIQUE }
        [ CLUSTERED | NONCLUSTERED ]
        [ ( <column_name> [ ,... n ] ) ]
        [
            WITH FILLFACTOR = fillfactor
          | WITH ( <index_option> [ ,... n ] )
        ]
        [ ON { partition_scheme_name ( partition_column_name )
            | filegroup | "default" } ]

  | [ FOREIGN KEY ]
        REFERENCES [ schema_name. ] referenced_table_name [ ( ref_column ) ]
        [ ON DELETE { NO ACTION | CASCADE | SET NULL | SET DEFAULT } ]
        [ ON UPDATE { NO ACTION | CASCADE | SET NULL | SET DEFAULT } ]
        [ NOT FOR REPLICATION ]

  | CHECK [ NOT FOR REPLICATION ] ( logical_expression )
}

<column_index> ::=
 INDEX index_name [ CLUSTERED | NONCLUSTERED ]
    [ WITH ( <index_option> [ ,... n ] ) ]
    [ ON { partition_scheme_name ( column_name )
         | filegroup_name
         | default
         }
    ]
    [ FILESTREAM_ON { filestream_filegroup_name | partition_scheme_name | "NULL" } ]

<computed_column_definition> ::=
column_name AS computed_column_expression
[ PERSISTED [ NOT NULL ] ]
[
    [ CONSTRAINT constraint_name ]
    { PRIMARY KEY | UNIQUE }
        [ CLUSTERED | NONCLUSTERED ]
        [
            WITH FILLFACTOR = fillfactor
          | WITH ( <index_option> [ ,... n ] )
        ]
        [ ON { partition_scheme_name ( partition_column_name )
        | filegroup | "default" } ]

    | [ FOREIGN KEY ]
        REFERENCES referenced_table_name [ ( ref_column ) ]
        [ ON DELETE { NO ACTION | CASCADE } ]
        [ ON UPDATE { NO ACTION } ]
        [ NOT FOR REPLICATION ]

    | CHECK [ NOT FOR REPLICATION ] ( logical_expression )
]

<column_set_definition> ::=
column_set_name XML COLUMN_SET FOR ALL_SPARSE_COLUMNS

<table_constraint> ::=
[ CONSTRAINT constraint_name ]
{
    { PRIMARY KEY | UNIQUE }
        [ CLUSTERED | NONCLUSTERED ]
        ( column_name [ ASC | DESC ] [ ,... n ] )
        [
            WITH FILLFACTOR = fillfactor
           | WITH ( <index_option> [ ,... n ] )
        ]
        [ ON { partition_scheme_name (partition_column_name)
            | filegroup | "default" } ]
    | FOREIGN KEY
        ( column_name [ ,... n ] )
        REFERENCES referenced_table_name [ ( ref_column [ ,... n ] ) ]
        [ ON DELETE { NO ACTION | CASCADE | SET NULL | SET DEFAULT } ]
        [ ON UPDATE { NO ACTION | CASCADE | SET NULL | SET DEFAULT } ]
        [ NOT FOR REPLICATION ]
    | CHECK [ NOT FOR REPLICATION ] ( logical_expression )
}

<table_index> ::=
{
    {
      INDEX index_name [ UNIQUE ] [ CLUSTERED | NONCLUSTERED ]
         ( column_name [ ASC | DESC ] [ ,... n ] )
    | INDEX index_name CLUSTERED COLUMNSTORE [ ORDER (column_name [ , ...n ] ) ]
    | INDEX index_name [ NONCLUSTERED ] COLUMNSTORE ( column_name [ ,... n ] )
    }
    [ INCLUDE ( column_name [ ,... n ] ) ]
    [ WHERE <filter_predicate> ]
    [ WITH ( <index_option> [ ,... n ] ) ]
    [ ON { partition_scheme_name ( column_name )
         | filegroup_name
         | default
         }
    ]
    [ FILESTREAM_ON { filestream_filegroup_name | partition_scheme_name | "NULL" } ]
}

<table_option> ::=
{
    [ DATA_COMPRESSION = { NONE | ROW | PAGE }
      [ ON PARTITIONS ( { <partition_number_expression> | <range> }
      [ ,... n ] ) ] ]
    [ XML_COMPRESSION = { ON | OFF }
      [ ON PARTITIONS ( { <partition_number_expression> | <range> }
      [ ,... n ] ) ] ]
    [ FILETABLE_DIRECTORY = <directory_name> ]
    [ FILETABLE_COLLATE_FILENAME = { <collation_name> | database_default } ]
    [ FILETABLE_PRIMARY_KEY_CONSTRAINT_NAME = <constraint_name> ]
    [ FILETABLE_STREAMID_UNIQUE_CONSTRAINT_NAME = <constraint_name> ]
    [ FILETABLE_FULLPATH_UNIQUE_CONSTRAINT_NAME = <constraint_name> ]
    [ SYSTEM_VERSIONING = ON
        [ ( HISTORY_TABLE = schema_name.history_table_name
          [ , DATA_CONSISTENCY_CHECK = { ON | OFF } ]
    ) ]
    ]
    [ REMOTE_DATA_ARCHIVE =
      {
        ON [ (  [ ,... n] ) ]
        | OFF ( MIGRATION_STATE = PAUSED )
      }
    ]
    [ DATA_DELETION = ON
          { (
             FILTER_COLUMN = column_name,
             RETENTION_PERIOD = { INFINITE | number { DAY | DAYS | WEEK | WEEKS
                              | MONTH | MONTHS | YEAR | YEARS }
        ) }
    ]
    [ LEDGER = ON [ ( <ledger_option> [ ,... n ] ) ]
    | OFF
    ]
}

<ledger_option>::=
{
    [ LEDGER_VIEW = schema_name.ledger_view_name [ ( <ledger_view_option> [ ,... n ] ) ] ]
    [ APPEND_ONLY = ON | OFF ]
}

<ledger_view_option>::=
{
    [ TRANSACTION_ID_COLUMN_NAME = transaction_id_column_name ]
    [ SEQUENCE_NUMBER_COLUMN_NAME = sequence_number_column_name ]
    [ OPERATION_TYPE_COLUMN_NAME = operation_type_id column_name ]
    [ OPERATION_TYPE_DESC_COLUMN_NAME = operation_type_desc_column_name ]
}

 ::=
{
    [ FILTER_PREDICATE = { NULL | table_predicate_function } , ]
      MIGRATION_STATE = { OUTBOUND | INBOUND | PAUSED }
 }

<index_option> ::=
{
    PAD_INDEX = { ON | OFF }
  | FILLFACTOR = fillfactor
  | IGNORE_DUP_KEY = { ON | OFF }
  | STATISTICS_NORECOMPUTE = { ON | OFF }
  | STATISTICS_INCREMENTAL = { ON | OFF }
  | ALLOW_ROW_LOCKS = { ON | OFF }
  | ALLOW_PAGE_LOCKS = { ON | OFF }
  | OPTIMIZE_FOR_SEQUENTIAL_KEY = { ON | OFF }
  | COMPRESSION_DELAY = { 0 | delay [ Minutes ] }
  | DATA_COMPRESSION = { NONE | ROW | PAGE | COLUMNSTORE | COLUMNSTORE_ARCHIVE }
       [ ON PARTITIONS ( { partition_number_expression | <range> }
       [ ,... n ] ) ]
  | XML_COMPRESSION = { ON | OFF }
      [ ON PARTITIONS ( { <partition_number_expression> | <range> }
      [ ,... n ] ) ]
}

<range> ::=
<partition_number_expression> TO <partition_number_expression>
```


#### [A. Create a PRIMARY KEY constraint on a column](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver16#a-create-a-primary-key-constraint-on-a-column)

```sql
CREATE TABLE dbo.Employee (
    EmployeeID INT PRIMARY KEY CLUSTERED
);
```
#### [B. Use FOREIGN KEY constraints](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver16#b-use-foreign-key-constraints)

```sql
SalesPersonID INT NULL REFERENCES SalesPerson(SalesPersonID)
```

```sql
FOREIGN KEY (SalesPersonID) REFERENCES SalesPerson(SalesPersonID)
```

```sql
CONSTRAINT FK_SpecialOfferProduct_SalesOrderDetail
    FOREIGN KEY (ProductID, SpecialOfferID)
    REFERENCES SpecialOfferProduct (ProductID, SpecialOfferID)
```

#### [C. Use UNIQUE constraints](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver16#a-create-a-primary-key-constraint-on-a-column)

```sql
Name NVARCHAR(100) NOT NULL
UNIQUE NONCLUSTERED
```

#### [D. Use DEFAULT definitions](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver16#a-create-a-primary-key-constraint-on-a-column)

```sql
DEFAULT 'New Position - title not formalized yet'
```

```sql
DEFAULT (GETDATE())
```

```sql
DEFAULT USER
```

#### [E. Use CHECK constraints](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver16#e-use-check-constraints)

```sql
CHECK (CreditRating >= 1 and CreditRating <= 5)
```

```sql
CONSTRAINT CK_emp_id CHECK (
    emp_id LIKE '[A-Z][A-Z][A-Z][1-9][0-9][0-9][0-9][0-9][FM]'
    OR emp_id LIKE '[A-Z]-[A-Z][1-9][0-9][0-9][0-9][0-9][FM]'
)
```

```sql
CHECK (
    emp_id IN ('1389', '0736', '0877', '1622', '1756')
    OR emp_id LIKE '99[0-9][0-9]'
)
```

#### [F. Show the complete table definition](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-table-transact-sql?view=sql-server-ver16#e-use-check-constraints)

```sql
CREATE TABLE dbo.PurchaseOrderDetail
(
    PurchaseOrderID int NOT NULL
        REFERENCES Purchasing.PurchaseOrderHeader(PurchaseOrderID),
    LineNumber smallint NOT NULL,
    ProductID int NULL
        REFERENCES Production.Product(ProductID),
    UnitPrice money NULL,
    OrderQty smallint NULL,
    ReceivedQty float NULL,
    RejectedQty float NULL,
    DueDate datetime NULL,
    rowguid uniqueidentifier ROWGUIDCOL NOT NULL
        CONSTRAINT DF_PurchaseOrderDetail_rowguid DEFAULT (NEWID()),
    ModifiedDate datetime NOT NULL
        CONSTRAINT DF_PurchaseOrderDetail_ModifiedDate DEFAULT (GETDATE()),
    LineTotal AS ((UnitPrice*OrderQty)),
    StockedQty AS ((ReceivedQty-RejectedQty)),
    CONSTRAINT PK_PurchaseOrderDetail_PurchaseOrderID_LineNumber
               PRIMARY KEY CLUSTERED (PurchaseOrderID, LineNumber)
               WITH (IGNORE_DUP_KEY = OFF)
)
ON [PRIMARY];
```

### [ALTER TABLE (Transact-SQL)](https://learn.microsoft.com/en-us/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver16)

#### syntax

```sql
ALTER TABLE { database_name.schema_name.table_name | schema_name.table_name | table_name }
{
    ALTER COLUMN column_name
    {
        [ type_schema_name. ] type_name
            [ (
                {
                   precision [ , scale ]
                 | max
                 | xml_schema_collection
                }
            ) ]
        [ COLLATE collation_name ]
        [ NULL | NOT NULL ] [ SPARSE ]
      | { ADD | DROP }
          { ROWGUIDCOL | PERSISTED | NOT FOR REPLICATION | SPARSE | HIDDEN }
      | { ADD | DROP } MASKED [ WITH ( FUNCTION = ' mask_function ') ]
    }
    [ WITH ( ONLINE = ON | OFF ) ]
    | [ WITH { CHECK | NOCHECK } ]
  
    | ADD
    {
        <column_definition>
      | <computed_column_definition>
      | <table_constraint>
      | <column_set_definition>
    } [ ,...n ]
      | [ system_start_time_column_name datetime2 GENERATED ALWAYS AS ROW START
                [ HIDDEN ] [ NOT NULL ] [ CONSTRAINT constraint_name ]
            DEFAULT constant_expression [WITH VALUES] ,
                system_end_time_column_name datetime2 GENERATED ALWAYS AS ROW END
                   [ HIDDEN ] [ NOT NULL ][ CONSTRAINT constraint_name ]
            DEFAULT constant_expression [WITH VALUES] ,
                start_transaction_id_column_name bigint GENERATED ALWAYS AS TRANSACTION_ID START
                   [ HIDDEN ] NOT NULL [ CONSTRAINT constraint_name ]
            DEFAULT constant_expression [WITH VALUES],
                  end_transaction_id_column_name bigint GENERATED ALWAYS AS TRANSACTION_ID END
                   [ HIDDEN ] NULL [ CONSTRAINT constraint_name ]
            DEFAULT constant_expression [WITH VALUES],
                  start_sequence_number_column_name bigint GENERATED ALWAYS AS SEQUENCE_NUMBER START
                   [ HIDDEN ] NOT NULL [ CONSTRAINT constraint_name ]
            DEFAULT constant_expression [WITH VALUES],
                  end_sequence_number_column_name bigint GENERATED ALWAYS AS SEQUENCE_NUMBER END
                   [ HIDDEN ] NULL [ CONSTRAINT constraint_name ]
            DEFAULT constant_expression [WITH VALUES]
        ]
       PERIOD FOR SYSTEM_TIME ( system_start_time_column_name, system_end_time_column_name )
    | DROP
     [ {
         [ CONSTRAINT ][ IF EXISTS ]
         {
              constraint_name
              [ WITH
               (  [ ,...n ] )
              ]
          } [ ,...n ]
          | COLUMN [ IF EXISTS ]
          {
              column_name
          } [ ,...n ]
          | PERIOD FOR SYSTEM_TIME
     } [ ,...n ]
    | [ WITH { CHECK | NOCHECK } ] { CHECK | NOCHECK } CONSTRAINT
        { ALL | constraint_name [ ,...n ] }
  
    | { ENABLE | DISABLE } TRIGGER
        { ALL | trigger_name [ ,...n ] }
  
    | { ENABLE | DISABLE } CHANGE_TRACKING
        [ WITH ( TRACK_COLUMNS_UPDATED = { ON | OFF } ) ]
  
    | SWITCH [ PARTITION source_partition_number_expression ]
        TO target_table
        [ PARTITION target_partition_number_expression ]
        [ WITH ( <low_priority_lock_wait> ) ]

    | SET
        (
            [ FILESTREAM_ON =
                { partition_scheme_name | filegroup | "default" | "NULL" } ]
            | SYSTEM_VERSIONING =
                  {
                    OFF
                  | ON
                      [ ( HISTORY_TABLE = schema_name . history_table_name
                          [, DATA_CONSISTENCY_CHECK = { ON | OFF } ]
                          [, HISTORY_RETENTION_PERIOD =
                          {
                              INFINITE | number {DAY | DAYS | WEEK | WEEKS
                  | MONTH | MONTHS | YEAR | YEARS }
                          }
                          ]
                        )
                      ]
                  }
            | DATA_DELETION =
                {
                      OFF
                    | ON
                        [(  [ FILTER_COLUMN = column_name ]
                            [, RETENTION_PERIOD = { INFINITE | number {DAY | DAYS | WEEK | WEEKS
                                    | MONTH | MONTHS | YEAR | YEARS }}]
                        )]
                    }
    | REBUILD
      [ [PARTITION = ALL]
        [ WITH ( <rebuild_option> [ ,...n ] ) ]
      | [ PARTITION = partition_number
           [ WITH ( <single_partition_rebuild_option> [ ,...n ] ) ]
        ]
      ]
  
    | <table_option>
    | <filetable_option>
    | 
}
[ ; ]
  
-- ALTER TABLE options
  
<column_set_definition> ::=
    column_set_name XML COLUMN_SET FOR ALL_SPARSE_COLUMNS

 ::=
    {
        MAXDOP = max_degree_of_parallelism
      | ONLINE = { ON | OFF }
      | MOVE TO
         { partition_scheme_name ( column_name ) | filegroup | "default" }
    }
<table_option> ::=
    {
        SET ( LOCK_ESCALATION = { AUTO | TABLE | DISABLE } )
    }
  
<filetable_option> ::=
    {
       [ { ENABLE | DISABLE } FILETABLE_NAMESPACE ]
       [ SET ( FILETABLE_DIRECTORY = directory_name ) ]
    }
  
 ::=
    {
      SET (
        REMOTE_DATA_ARCHIVE
        {
            = ON ()
          | = OFF_WITHOUT_DATA_RECOVERY ( MIGRATION_STATE = PAUSED )
          | (  [, ...n] )
        }
            )
    }
  
 ::=
    {
     [ FILTER_PREDICATE = { null | table_predicate_function } , ]
       MIGRATION_STATE = { OUTBOUND | INBOUND | PAUSED }
    }
  
<single_partition_rebuild__option> ::=
{
      SORT_IN_TEMPDB = { ON | OFF }
    | MAXDOP = max_degree_of_parallelism
    | DATA_COMPRESSION = { NONE | ROW | PAGE | COLUMNSTORE | COLUMNSTORE_ARCHIVE} }
    | ONLINE = { ON [( <low_priority_lock_wait> ) ] | OFF }
}
  
<low_priority_lock_wait>::=
{
    WAIT_AT_LOW_PRIORITY ( MAX_DURATION = <time> [ MINUTES ],
        ABORT_AFTER_WAIT = { NONE | SELF | BLOCKERS } )
}
```


#### [A. Add a new column](https://learn.microsoft.com/en-us/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver16#a-add-a-new-column)

```sql
CREATE TABLE dbo.doc_exa (column_a INT) ;
GO
ALTER TABLE dbo.doc_exa ADD column_b VARCHAR(20) NULL ;
GO
```

#### [B. Add a column with a constraint](https://learn.microsoft.com/en-us/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver16#a-add-a-new-column)

```sql
CREATE TABLE dbo.doc_exc (column_a INT) ;
GO
ALTER TABLE dbo.doc_exc ADD column_b VARCHAR(20) NULL
    CONSTRAINT exb_unique UNIQUE ;
GO
EXEC sp_help doc_exc ;
GO
DROP TABLE dbo.doc_exc ;
GO
```

#### [C. Add an unverified CHECK constraint to an existing column](https://learn.microsoft.com/en-us/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver16#c-add-an-unverified-check-constraint-to-an-existing-column)

```sql
CREATE TABLE dbo.doc_exd (column_a INT) ;
GO
INSERT INTO dbo.doc_exd VALUES (-1) ;
GO
ALTER TABLE dbo.doc_exd WITH NOCHECK
ADD CONSTRAINT exd_check CHECK (column_a > 1) ;
GO
EXEC sp_help doc_exd ;
GO
DROP TABLE dbo.doc_exd ;
GO
```

#### [D. Add a DEFAULT constraint to an existing column](https://learn.microsoft.com/en-us/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver16#d-add-a-default-constraint-to-an-existing-column)

```sql
CREATE TABLE dbo.doc_exz (column_a INT, column_b INT) ;
GO
INSERT INTO dbo.doc_exz (column_a) VALUES (7) ;
GO
ALTER TABLE dbo.doc_exz
  ADD CONSTRAINT col_b_def
  DEFAULT 50 FOR column_b ;
GO
INSERT INTO dbo.doc_exz (column_a) VALUES (10) ;
GO
SELECT * FROM dbo.doc_exz ;
GO
DROP TABLE dbo.doc_exz ;
GO
```

```sql
alter table table_name
	add constraint constraint_name
	default default_value for column_name
```

#### [E. Add several columns with constraints](https://learn.microsoft.com/en-us/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver16#e-add-several-columns-with-constraints)

```sql
CREATE TABLE dbo.doc_exe (column_a INT CONSTRAINT column_a_un UNIQUE) ;
GO
ALTER TABLE dbo.doc_exe ADD

-- Add a PRIMARY KEY identity column.
column_b INT IDENTITY
CONSTRAINT column_b_pk PRIMARY KEY,

-- Add a column that references another column in the same table.
column_c INT NULL
CONSTRAINT column_c_fk
REFERENCES doc_exe(column_a),

-- Add a column with a constraint to enforce that
-- nonnull data is in a valid telephone number format.
column_d VARCHAR(16) NULL
CONSTRAINT column_d_chk
CHECK
(column_d LIKE '[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]' OR
column_d LIKE
'([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),

-- Add a nonnull column with a default.
column_e DECIMAL(3,3)
CONSTRAINT column_e_default
DEFAULT .081 ;
GO
EXEC sp_help doc_exe ;
GO
DROP TABLE dbo.doc_exe ;
GO
```

#### [D. Add and dropping a FOREIGN KEY constraint](https://learn.microsoft.com/en-us/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver16#d-add-a-default-constraint-to-an-existing-column)

```sql
CREATE TABLE Person.ContactBackup
    (ContactID INT) ;
GO

ALTER TABLE Person.ContactBackup
ADD CONSTRAINT FK_ContactBackup_Contact FOREIGN KEY (ContactID)
    REFERENCES Person.Person (BusinessEntityID) ;
GO

ALTER TABLE Person.ContactBackup
DROP CONSTRAINT FK_ContactBackup_Contact ;
GO

DROP TABLE Person.ContactBackup ;
```

#### [F. Add a nullable column with default values](https://learn.microsoft.com/en-us/sql/t-sql/statements/alter-table-transact-sql?view=sql-server-ver16#f-add-a-nullable-column-with-default-values)

```sql
CREATE TABLE dbo.doc_exf (column_a INT) ;
GO
INSERT INTO dbo.doc_exf VALUES (1) ;
GO
ALTER TABLE dbo.doc_exf
ADD AddDate smalldatetime NULL
CONSTRAINT AddDateDflt
DEFAULT GETDATE() WITH VALUES ;
GO
DROP TABLE dbo.doc_exf ;
GO
```

### [CREATE TYPE (Transact-SQL)](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-type-transact-sql?view=sql-server-ver16)

#### [A. Create an alias type based on the varchar data type](https://learn.microsoft.com/en-us/sql/t-sql/statements/create-type-transact-sql?view=sql-server-ver16#a-create-an-alias-type-based-on-the-varchar-data-type)

```sql
CREATE TYPE SSN
FROM VARCHAR(11) NOT NULL;
```
