---
title: SQL
layout: page
parent: Notes
---

# SQL

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-21.png)

- **SFW (SELECT-FROM-WHERE)** statements
- SQL uses **bag semantics** by default
- Use keyword **`AS`** for renaming when needed
- **`ORDER BY`** clause: ordering output
- **`LIMIT`** clause for top-n queries
- Set operations: **`UNION`**, **`INTERSECT`**, **`EXCEPT`**


## Intro
### SQL: Structured Query Lanuage

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-03.png)

- SQL: Structured Query Lanuage
- Pronounced “S-Q-L” or “sequel”
- SQL is the standard query language supported by most DBMS.

- A brief history
	- IBM system R, early 1970s
	- ANSI/ISO SQL-86 (SQL1)
	- ANSI SQL-89
	- **ANSI/ISO SQL-92 (SQL2)**
	- ANSI/ISO SQL:1999 (SQL3)
	- SQL:2003, SQL:2005, SQL:2008, SQL:2011, SQL:2016, SQL:2019
	- **SQL:2023**, adds data type JSON, add **SQL/PGQ** for property graph queries

### Relational Database language

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-04.png)

- **Procedural**: specify what data are needed and how to get the data.
- **Declarative**: specify what data are needed without specifying how to get the data.
- DDL (**data definition language**): Specification notation for defining the database schema.
- DML (**data manipulation language**): DML is also known as query language.

## SQL DDL

### SQL DDL

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-06.png)

```sql
CREATE TABLE R(
	...,
	attribute_name attribute_type,
	...,
	[integrity_constraints],
	...
);
DROP TABLE R;
```

#### Example

```sql
create table department(        -- sql is insensitive to case
    dept_name   varchar(20),    -- sql is insensitive to white spaces
    building    varchar(15),    -- everything from '--' to the end of
    budget      numeric(12, 2), -- line is ignored
    primary     key(dept_name));-- primary key constraint
drop table department;
```

### Built-in data types in SQL

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-07.png)


|                            |                                                               |
| -------------------------- | ------------------------------------------------------------- |
| `char(n)`                  | fixed-length string with len=n                                |
| `varchar(n)`               | variable-length string with max_len=n                         |
| `int`, `smallint`          | integer, small integer                                        |
| `numeric(p, d)`            | fixed point number                                            |
| `real`, `double` precision | floating point and double-precision<br>floating point numbers |
| `float(n)`                 | floating-point number, with precision at least n digits       |

- **Machine dependent types**: int, smallint, real, double precision.
- Each type has a special value called **`NULL`**.
- **`NULL`** means that the value is **unknown** or **not applicable**.
	- SQL introduce special rules for dealing with NULL’s.

### Integrity constraints

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-08.png)

```sql
CREATE TABLE instructor (
    ID          varchar(5),
    name        varchar(20) NOT NULL,
    dept_name   varchar(20),
    salary      numeric(8, 2),
    primary key (ID),
    foreign key (dept_name) references department);
```

- **`primary key (A1, . . . , An)`**: attributes A1, …, An form the primary key for the relation.
- **`foreign key (A1, . . . , An) references S`**: the values of attributes (A1, . . . , Ak) must correspond to values of the primary key of table S.
- `not null`: the null value is not allowed for the specified attribute.
- Primary keys are **not** nullable.

### Basic database modification

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-09.png)

- DBMS will prevent any update to the database that would violate an integrity constraint.

#### Insertion

- Insertion: insert a tuple into table R

```sql
INSERT INTO R(A_1, ..., A_n) VALUES (v_1, ..., v_n);

INSERT INTO instrcutor VALUES('10211', 'Turing', 'Comp. Sci.', 95000);
INSERT INTO instructor(ID, name) VALUES('10222', 'Root');
```

#### Deletion

- Deletion: purge tuples satisfying a given condition from table R

```sql
DELETE FROM R WHERE condition

DELETE FROM instrcutor WHERE name = 'Turing';
DELETE FROM student;
```

## Basic SQL Queries

### SFW

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-11.png)

- a **SELECT-FROM-WHERE** statement

```sql
SELECT  A1, A2, ..., An -- a list of desired attributes in the query
FROM    R1, R2, ..., Rm -- a list of tables accessed during the query evaluation
WHERE   P;              -- a filtering predicate involving the attributes from R1, R2, …, Rm
```

#### Examples

> [!example]
> 
> List the ID and name of every instructor from the Computer Science department.

```sql
SELECT ID, name FROM instructor WHERE dept_name = 'Comp. Sci.';
```

```sql
-- * is a shorthand for all attributes
-- The WHERE clause is optional
SELECT * FROM instrcutor;

-- Use logical connectives AND, OR and NOT in the WHERE caluse
SELECT ID, name FROM student
WHERE tot_cred > 30 AND (dept_name = 'Physics' OR
							dept_name = 'Music');

-- SELECT list can contain expressions
SELECT ID, name, salary/12 FROM instructor;

-- Use a relation name prefix to distinguish attributes with the same name
SELECT student.name, instructor.name
FROM student, advisor, instrcutor
WHERE student.ID = advisor.S_ID
	AND advisor.i_ID = instrcutor.ID;
```

### Semantics of SFW statements

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-13.png)

```
for each tuple t_1 in R_1 do
	...
		for each tuple t_m in R_m do
			if P is true w.r.t t_1, ..., t_m then
				evaluate A_1, ..., A_n according to
					t_1, ..., t_m to produce a tuple in the result
```

### DISTINCT

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-14.png)

- Use keyword **`DISTINCT`** to eliminate duplicates explicitly.

### String operations

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-15.png)

- Strings literals (**case sensitive**) are quoted by **single quotes**
  `SELECT ID, name FROM instructor WHERE dept_name = 'Comp. Sci';`
- **Comparison**: `str1 < str2` w.r.t. the lexicographic order
	- Similar for `=`, `>=`, `<`, `<=`, `<>`
- **Pattern matching**: **`LIKE`** matches a string against a pattern

```sql
-- The percent (`%`) character matches any string of zero or more characters
SELECT name FROM instrcutor
WHERE name LIKE '%and%';

-- The underscore (`_`) character matches any single character
SELECT ID FROM instrcutor
WHERE name LIKE '___';

-- Use keyword `ESCAPE` to specify an escape character
SELECT ID FROM instrcutor
WHERE name LIKE 'ab\%cd' ESCAPE '\';
```

### Renaming

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-16.png)

```sql
-- Keyword `AS` in the `SELECT` to rename attributes
SELECT ID, salary/12 AS month_salary FROM instrcutor;

-- Keyword `AS` in the `FROM` clause to rename relations
SELECT DISTINCT name
FROM instrcutor, advisor AS S, advisor AS T
WHERE instrcutor.ID = S.i_ID AND
		S.i_ID = T.i_ID AND S.s_ID <> T.s_ID;

-- The keyword `AS` is optional
SELECT ID, salary/12 month_salary FROM instructor;
```

### Ordering output

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-17.png)

```sql
SELECT  ...
FROM    ...
[WHERE  ...]
ORDER BY ..., column[ASC|DESC], ...;
```

- Append a **`ORDER BY`** clause at the end of a SFW query to sort the query result.
	- DESC = descending, ASC=ascending.
	- ASC is the default option.


> [!example]
> 
> List all instructors, sort them by salary (descending) and name (ascending).

```sql
SELECT * FROM instructor
ORDER BY salary DESC, name;
```

### Limit output

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-18.png)

- A **`LIMIT`** n clause can be append to a query to limit the number of tuples in output.
- We can write top-n queries by combing an **`ORDER BY`** clause and a **`LIMIT`** n clause.

```sql
SELECT * FROM instructor LIMIT 2;
SELECT name FROM instructor ORDER BY salary DESC LIMIT 1;
SELECT ID FROM STUDENT ORDER BY tot_cred LIMIT 3;
```

### Set operations

![](courses/ai3613.24fa/attachments/Lec3-SQL-1-19.png)

- SQL supports **`UNION`**, **`INTERSECT`** and **`EXCEPT`** as in RA.
- They all eliminate duplicates by default.
- To retain all duplicates in query results, explicitly use keyword **`ALL`**
	- **`UNION ALL`**
	- **`INTERSECT ALL`**
	- **`EXCEPT ALL`**

### Examples


> [!example] 
> 
> Find the courses taught in Fall 2017 or in Spring 2018.

```sql
SELECT course_id FROM section
WHERE semester = 'Fall' AND year = 2017
UNION
SELECT course_id FROM section
WHERE semester = 'Spring' AND year = 2018;
```

> [!example] 
> 
> Find the courses taught in Fall 2017 but not in Spring 2018.

```sql
SELECT course_id FROM section
WHERE semester = 'Fall' AND year = 2017
EXCEPT
SELECT course_id FROM section
WHERE semester = 'Spring' AND year = 2018;
```

## Aggregation and Grouping

### Aggregate functions

![](courses/ai3613.24fa/attachments/Lec4-SQL-2-05.png)

An aggregate function combines a collection of values into a single value.

### Basic aggregation

![](courses/ai3613.24fa/attachments/Lec4-SQL-2-06.png)

Aggregate functions can only be used in the **`SELECT`** output list

```sql
-- Find the average salary of instructors in the CS department
SELECT AVG(salary)
FROM instructor
WHERE dept_anme = 'Comp. Sci.';

-- Find the number of tuples in the course relation
SELECT COUNT(*) FROM course;

-- Get the number of students in CS and their average credits
SELECT COUNT(*), AVG(tot_cred)
FROM student
WHERE dept_name = 'Comp. Sci.';
```

### Distinct aggregation

![](courses/ai3613.24fa/attachments/Lec4-SQL-2-07.png)
- **`COUNT`**, **`SUM`** and **`AVG`** support keyword **`DISTINCT`**.
- Question. How about **`MIN`** and **`MAX`**?

```sql
-- Find the total number of instrcutors who have taught in the Spring 2010 semester
SELECT COUNT(DISTINCT ID)
FROM teaches
WHERE semester = 'Spring' AND year = 2010;
```

### Aggregation with grouping

![](courses/ai3613.24fa/attachments/Lec4-SQL-2-08.png)


## Null Values

## More Joins

## Subqueries

## Constraints

## Modification

## View

## Index

---

Last updated: 