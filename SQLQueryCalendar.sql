create database calendar
go
use calendar
go

create schema [months]
go
create schema [api]
go

create schema [dbo]
go
-- use master drop database calendar

create login calendar
with password = 'sqlcalendar'
go
create user calendar for login calendar
go
ALTER LOGIN calendar WITH DEFAULT_DATABASE = calendar;
go
ALTER USER calendar WITH LOGIN = calendar;
go
Grant execute on schema::[api] to calendar
go
Grant select on schema::[api] to calendar
go
--drop login calendar
--drop user calendar

-------------------------------TABLES-------------------------------

create table [months].january(
	dni int primary key,
	[1] char(3), [2] char(3), [3] char(3), [4] char(3), [5] char(3),
	[6] char(3), [7] char(3), [8] char(3), [9] char(3), [10] char(3),
	[11] char(3), [12] char(3), [13] char(3), [14] char(3), [15] char(3),
	[16] char(3), [17] char(3), [18] char(3), [19] char(3), [20] char(3),
	[21] char(3), [22] char(3), [23] char(3), [24] char(3), [25] char(3),
	[26] char(3), [27] char(3),	[28] char(3), [29] char(3), [30] char(3), [31] char(3)
)
go

create table [months].february(
	dni int primary key,
	[1] char(3), [2] char(3), [3] char(3), [4] char(3), [5] char(3),
	[6] char(3), [7] char(3), [8] char(3), [9] char(3), [10] char(3),
	[11] char(3), [12] char(3), [13] char(3), [14] char(3), [15] char(3),
	[16] char(3), [17] char(3), [18] char(3), [19] char(3), [20] char(3),
	[21] char(3), [22] char(3), [23] char(3), [24] char(3), [25] char(3),
	[26] char(3), [27] char(3),	[28] char(3), [29] char(3)
)
go
create table [months].march(
	dni int primary key,
	[1] char(3), [2] char(3), [3] char(3), [4] char(3), [5] char(3),
	[6] char(3), [7] char(3), [8] char(3), [9] char(3), [10] char(3),
	[11] char(3), [12] char(3), [13] char(3), [14] char(3), [15] char(3),
	[16] char(3), [17] char(3), [18] char(3), [19] char(3), [20] char(3),
	[21] char(3), [22] char(3), [23] char(3), [24] char(3), [25] char(3),
	[26] char(3), [27] char(3),	[28] char(3), [29] char(3), [30] char(3), [31] char(3)
)
go

create table [months].april(
	dni int primary key,
	[1] char(3), [2] char(3), [3] char(3), [4] char(3), [5] char(3),
	[6] char(3), [7] char(3), [8] char(3), [9] char(3), [10] char(3),
	[11] char(3), [12] char(3), [13] char(3), [14] char(3), [15] char(3),
	[16] char(3), [17] char(3), [18] char(3), [19] char(3), [20] char(3),
	[21] char(3), [22] char(3), [23] char(3), [24] char(3), [25] char(3),
	[26] char(3), [27] char(3),	[28] char(3), [29] char(3), [30] char(3)
)
go
create table [months].may(
	dni int primary key,
	[1] char(3), [2] char(3), [3] char(3), [4] char(3), [5] char(3),
	[6] char(3), [7] char(3), [8] char(3), [9] char(3), [10] char(3),
	[11] char(3), [12] char(3), [13] char(3), [14] char(3), [15] char(3),
	[16] char(3), [17] char(3), [18] char(3), [19] char(3), [20] char(3),
	[21] char(3), [22] char(3), [23] char(3), [24] char(3), [25] char(3),
	[26] char(3), [27] char(3),	[28] char(3), [29] char(3), [30] char(3), [31] char(3)
)
go
create table [months].june(
	dni int primary key,
	[1] char(3), [2] char(3), [3] char(3), [4] char(3), [5] char(3),
	[6] char(3), [7] char(3), [8] char(3), [9] char(3), [10] char(3),
	[11] char(3), [12] char(3), [13] char(3), [14] char(3), [15] char(3),
	[16] char(3), [17] char(3), [18] char(3), [19] char(3), [20] char(3),
	[21] char(3), [22] char(3), [23] char(3), [24] char(3), [25] char(3),
	[26] char(3), [27] char(3),	[28] char(3), [29] char(3), [30] char(3)
)
go
create table [months].july(
	dni int primary key,
	[1] char(3), [2] char(3), [3] char(3), [4] char(3), [5] char(3),
	[6] char(3), [7] char(3), [8] char(3), [9] char(3), [10] char(3),
	[11] char(3), [12] char(3), [13] char(3), [14] char(3), [15] char(3),
	[16] char(3), [17] char(3), [18] char(3), [19] char(3), [20] char(3),
	[21] char(3), [22] char(3), [23] char(3), [24] char(3), [25] char(3),
	[26] char(3), [27] char(3),	[28] char(3), [29] char(3), [30] char(3), [31] char(3)
)
go
create table [months].august(
	dni int primary key,
	[1] char(3), [2] char(3), [3] char(3), [4] char(3), [5] char(3),
	[6] char(3), [7] char(3), [8] char(3), [9] char(3), [10] char(3),
	[11] char(3), [12] char(3), [13] char(3), [14] char(3), [15] char(3),
	[16] char(3), [17] char(3), [18] char(3), [19] char(3), [20] char(3),
	[21] char(3), [22] char(3), [23] char(3), [24] char(3), [25] char(3),
	[26] char(3), [27] char(3),	[28] char(3), [29] char(3), [30] char(3), [31] char(3)
)
go
create table [months].september(
	dni int primary key,
	[1] char(3), [2] char(3), [3] char(3), [4] char(3), [5] char(3),
	[6] char(3), [7] char(3), [8] char(3), [9] char(3), [10] char(3),
	[11] char(3), [12] char(3), [13] char(3), [14] char(3), [15] char(3),
	[16] char(3), [17] char(3), [18] char(3), [19] char(3), [20] char(3),
	[21] char(3), [22] char(3), [23] char(3), [24] char(3), [25] char(3),
	[26] char(3), [27] char(3),	[28] char(3), [29] char(3), [30] char(3)
)
go
create table [months].october(
	dni int primary key,
	[1] char(3), [2] char(3), [3] char(3), [4] char(3), [5] char(3),
	[6] char(3), [7] char(3), [8] char(3), [9] char(3), [10] char(3),
	[11] char(3), [12] char(3), [13] char(3), [14] char(3), [15] char(3),
	[16] char(3), [17] char(3), [18] char(3), [19] char(3), [20] char(3),
	[21] char(3), [22] char(3), [23] char(3), [24] char(3), [25] char(3),
	[26] char(3), [27] char(3),	[28] char(3), [29] char(3), [30] char(3), [31] char(3)
)
go
create table [months].november(
	dni int primary key,
	[1] char(3), [2] char(3), [3] char(3), [4] char(3), [5] char(3),
	[6] char(3), [7] char(3), [8] char(3), [9] char(3), [10] char(3),
	[11] char(3), [12] char(3), [13] char(3), [14] char(3), [15] char(3),
	[16] char(3), [17] char(3), [18] char(3), [19] char(3), [20] char(3),
	[21] char(3), [22] char(3), [23] char(3), [24] char(3), [25] char(3),
	[26] char(3), [27] char(3),	[28] char(3), [29] char(3), [30] char(3)
)
go
create table [months].december(
	dni int primary key,
	[1] char(3), [2] char(3), [3] char(3), [4] char(3), [5] char(3),
	[6] char(3), [7] char(3), [8] char(3), [9] char(3), [10] char(3),
	[11] char(3), [12] char(3), [13] char(3), [14] char(3), [15] char(3),
	[16] char(3), [17] char(3), [18] char(3), [19] char(3), [20] char(3),
	[21] char(3), [22] char(3), [23] char(3), [24] char(3), [25] char(3),
	[26] char(3), [27] char(3),	[28] char(3), [29] char(3), [30] char(3), [31] char(3)
)
go
create table [dbo].personal(
	namesurname varchar(40),
	dni int check (dni < 99999999 and dni>10000000) primary key
)

create table [dbo].request(
	originDni int check (originDni < 99999999 and originDni>10000000),
	originDate date,
	destinationDni int check (destinationDni < 99999999 and destinationDni>10000000),
	destinationDate date
)

insert into dbo.request (originDni, originDate, destinationDni, destinationDate) values (43386520, DATEFROMPARTS(2024, 01, 31), 60000000, DATEFROMPARTS(2024, 02, 28))
select * from dbo.request
-------------------------------CONSTRAINT-------------------------------

alter table [months].january add constraint january_FK foreign key (dni)
references personal(dni)

alter table [months].february add constraint february_FK foreign key (dni)
references personal(dni)

alter table [months].march add constraint march_FK foreign key (dni)
references personal(dni)

alter table [months].april add constraint april_FK foreign key (dni)
references personal(dni)

alter table [months].may add constraint may_FK foreign key (dni)
references personal(dni)

alter table [months].june add constraint june_FK foreign key (dni)
references personal(dni)

alter table [months].july add constraint july_FK foreign key (dni)
references personal(dni)

alter table [months].august add constraint august_FK foreign key (dni)
references personal(dni)

alter table [months].september add constraint september_FK foreign key (dni)
references personal(dni)

alter table [months].november add constraint november_FK foreign key (dni)
references personal(dni)

alter table [months].december add constraint december_FK foreign key (dni)
references personal(dni)

-------------------------------LOTE DE PRUEBA-------------------------------

insert into [dbo].personal (namesurname, dni) values ('Vallejos Franco', 43386520)
insert into [dbo].personal (namesurname, dni) values ('Roldan Gonza', 50000000)
insert into [dbo].personal (namesurname, dni) values ('Sloboyen Carlos', 60000000)
insert into [dbo].personal (namesurname, dni) values ('Quatrano Marcos', 70000000)
go

insert into months.january (dni, [1], [2], [4], [6], [8], [10]) values (43386520, 'TTT', 'TTT', 'TTM', 'TTT', 'TTM', 'TTM')
insert into months.january (dni, [1], [2], [4], [6], [8], [10]) values (60000000, 'TTM', 'TTM', 'TTT', 'TTM', 'TTT', 'TTT')
insert into months.january (dni, [2], [3], [5], [7], [9]) values (50000000, 'TTT', 'TTT', 'TTM', 'TTT', 'TTM')
go


insert into months.february(dni, [1], [2], [4], [6], [8], [10]) values (50000000, 'TTT', 'TTT', 'TTM', 'TTT', 'TTM', 'TTM')
insert into months.february (dni, [1], [2], [4], [6], [8], [10]) values (43386520, 'TTM', 'TTM', 'TTT', 'TTM', 'TTT', 'TTT')
insert into months.february (dni, [2], [3], [5], [7], [9]) values (60000000, 'TTT', 'TTT', 'TTM', 'TTT', 'TTM')
insert into months.february(dni, [2], [3], [5]) values (70000000, 'TTM', 'TTM', 'TTM')
go

insert into months.march(dni, [1], [2], [4], [6], [8], [10], [15], [17], [20], [25]) values (50000000, 'TTT', 'TTT', 'TTM', 'TTT', 'TTM', 'TTM', 'TTM', 'TTT', 'TTM', 'TTT')
insert into months.march (dni, [1], [2], [4], [6], [8], [10], [15], [17], [20], [25]) values (43386520, 'TTT', 'TTM', 'TTT', 'TTM', 'TTT', 'TTT', 'TTT', 'TTM', 'TTT', 'TTM')
insert into months.march (dni, [2], [3], [5], [7], [9], [15], [17], [20], [25]) values (60000000, 'TTT', 'TTT', 'TTM', 'TTT', 'TTM', 'TTM', 'TTT', 'TTM', 'TTT')
insert into months.march(dni, [2], [3], [5]) values (70000000, 'TTM', 'TTM', 'TTM')
go

-------------------------------STORE PROCEDURE-------------------------------

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'showPersonalCalendar') AND type in (N'P', N'PC'))
  DROP PROCEDURE [api].showPersonalCalendar
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'showCalendar') AND type in (N'P', N'PC'))
  DROP PROCEDURE [api].showCalendar
GO


create or alter procedure [api].showPersonalCalendar (@months varchar(10), @tech char(8))
WITH EXECUTE AS OWNER 
as 
begin
    declare @SQLDinamic nvarchar(max);
    set @SQLDinamic = N'select * from [months].' + @months + N' where dni = ' + @tech + N'';
    exec sys.[sp_executesql] @SQLDinamic;
end
go

create or alter procedure [api].showCalendar (@months varchar(10))
WITH EXECUTE AS OWNER 
as 
begin
    declare @SQLDinamic nvarchar(max);
    set @SQLDinamic = N'select * from [months].' + @months;
    exec sys.[sp_executesql] @SQLDinamic;
end
go

create or alter procedure [api].showUserRequest (@dni int)
WITH EXECUTE AS OWNER
as
begin
	declare @SQLDinamic nvarchar(max);
	set @SQLDinamic = N'select * from [dbo].request where originDni = ' + cast(@dni as varchar) + N' or destinationDni = ' + cast(@dni as varchar); 
	exec sys.[sp_executesql] @SQLDinamic;
END

exec api.showUserRequest 43386520
-------------------------------VIEW-------------------------------

create or alter view [api].showPersonal 
with SCHEMABINDING 
AS
select dni, namesurname from [dbo].[personal]
go


select * from api.showPersonal

exec api.showCalendar 'march'