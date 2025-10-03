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
	id int identity(1,1) primary key,
	originDni int check (originDni < 99999999 and originDni>10000000),
	originDate date,
	destinationDni int check (destinationDni < 99999999 and destinationDni>10000000),
	destinationDate date,
	[state] int default (3)
)

create table [dbo].[state] (
	id int primary key,
	[state] varchar(8)
)

insert into dbo.request (originDni, originDate, destinationDni, destinationDate) values (43386520, DATEFROMPARTS(2024, 01, 31), 60000000, DATEFROMPARTS(2024, 02, 28))
insert into dbo.request (originDni, originDate, destinationDni, destinationDate) values (60000000, DATEFROMPARTS(2024, 01, 30), 43386520, DATEFROMPARTS(2024, 02, 26))

insert into [dbo].[state] (id, [state]) values (1, 'accepted')
insert into [dbo].[state] (id, [state]) values (2, 'rejected')
insert into [dbo].[state] (id, [state]) values (3, 'waiting')


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

alter table [dbo].request add constraint [state_FK] foreign key ([state])
references [dbo].[state](id)
go
-------------------------------LOTE DE PRUEBA-------------------------------

insert into [dbo].personal (namesurname, dni) values ('Vallejos Franco', 43386520)
insert into [dbo].personal (namesurname, dni) values ('Roldan Gonza', 50000000)
insert into [dbo].personal (namesurname, dni) values ('Sloboyen Carlos', 60000000)
insert into [dbo].personal (namesurname, dni) values ('Quatrano Marcos', 70000000)
insert into [dbo].personal (namesurname, dni) values ('Esquivel Diego', 80000000)
insert into [dbo].personal (namesurname, dni) values ('Torres Jose', 90000000)
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

insert into months.november(dni, [1], [2], [4], [6], [8], [10], [15], [17], [20], [25]) values (50000000, 'TTT', 'TTT', 'TTM', 'TTT', 'TTM', 'TTM', 'TTM', 'TTT', 'TTM', 'TTT')
insert into months.november(dni, [1], [2], [4], [6], [8], [10], [15], [17], [20], [25], [27]) values (43386520, 'TTT', 'TTM', 'TTT', 'TTM', 'TTT', 'TTT', 'TTT', 'TTM', 'TTT', 'TTM', 'TTT')
insert into months.november(dni, [2], [3], [5], [7], [9], [15], [17], [20], [25]) values (60000000, 'TTT', 'TTT', 'TTM', 'TTT', 'TTM', 'TTM', 'TTT', 'TTM', 'TTT')
insert into months.november(dni, [2], [3], [5]) values (70000000, 'TTM', 'TTM', 'TTM')

insert into months.april(dni, [1], [2], [4], [6], [8], [10], [15], [17], [20], [25]) values (50000000, 'TTT', 'TTT', 'TTM', 'TTT', 'TTM', 'TTM', 'TTM', 'TTT', 'TTM', 'TTT')
insert into months.april (dni, [1], [2], [4], [6], [8], [10], [15], [17], [20], [25], [27]) values (43386520, 'TTT', 'TTM', 'TTT', 'TTM', 'TTT', 'TTT', 'TTT', 'TTM', 'TTT', 'TTM', 'TTT')
insert into months.april (dni, [2], [3], [5], [7], [9], [15], [17], [20], [25]) values (60000000, 'TTT', 'TTT', 'TTM', 'TTT', 'TTM', 'TTM', 'TTT', 'TTM', 'TTT')
insert into months.april(dni, [2], [3], [5]) values (70000000, 'TTM', 'TTM', 'TTM')
insert into months.april(dni, [1], [2], [4], [6], [8], [10], [15], [17], [20], [25]) values (80000000, 'RTT', 'RTT', 'RTM', 'RTT', 'RTM', 'RTM', 'RTM', 'RTT', 'RTM', 'RTT')
insert into months.april (dni, [1], [2], [4], [6], [8], [10], [15], [17], [20], [25], [27]) values (90000000, 'RTT', 'RTM', 'RTT', 'RTM', 'RTT', 'RTT', 'RTT', 'RTM', 'RTT', 'RTM', 'RTT')

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

	select r.id, r.originDni, r.originDate, r.destinationDni, r.destinationDate, s.[state] from [dbo].request as r 
	inner join [dbo].[state] as s on 
	s.id = r.[state]
	where originDni = @dni or destinationDni =  @dni
END
go


create or alter procedure [api].insertOnRequest (@originDni int, @originDate date, @destinationDni int, @destinationDate date)
WITH EXECUTE AS OWNER
as
begin
	declare @SQLDinamic nvarchar(max);
	set @SQLDinamic = N'INSERT INTO [dbo].request (originDni, originDate, destinationDni, destinationDate)
					values (' + CAST(@originDni as nvarchar(20)) + ', ''' + CONVERT(nvarchar(20), @originDate, 120) + 
					''', ' + CAST(@destinationDni as nvarchar(20)) + ', ''' + CONVERT(nvarchar(20), @destinationDate, 120) + ''' );'
	exec sys.[sp_executesql] @SQLDinamic;
end
go

create or alter procedure [api].deleteOnRequest (@id int)
WITH EXECUTE AS OWNER
as
begin
	delete from dbo.request where id = @id;
end
go

create or alter procedure [api].rejectRequest (@id int)
WITH EXECUTE AS OWNER
as
begin
	update dbo.request set [state] = 2 where id = @id;
end
go

CREATE OR ALTER PROCEDURE [api].updateCalendar (@id INT)
WITH EXECUTE AS OWNER
AS
BEGIN
    DECLARE @originDate DATE,
            @destinationDate DATE,
            @originTypeTurn CHAR(3),
            @destinationTypeTurn CHAR(3),
            @originDni INT,
            @destinationDni INT,
            @SQLDynamic NVARCHAR(MAX)

    SET @originDate = (SELECT originDate FROM dbo.request WHERE id = @id)
    SET @destinationDate = (SELECT destinationDate FROM dbo.request WHERE id = @id)
    SET @originDni = (SELECT originDni FROM dbo.request WHERE id = @id)
    SET @destinationDni = (SELECT destinationDni FROM dbo.request WHERE id = @id)

    SET @SQLDynamic = N'set @originTypeTurn = (select [' + CAST(DAY(@originDate) AS NVARCHAR) + N'] from [months].' + DATENAME(MONTH,@originDate) + N' where dni = ' + CAST(@originDni AS NVARCHAR) + N');'
    EXEC sys.sp_executesql @SQLDynamic, N'@originTypeTurn CHAR(3) OUTPUT', @originTypeTurn OUTPUT;

    SET @SQLDynamic = N'set @destinationTypeTurn = (select [' + CAST(DAY(@destinationDate) AS NVARCHAR) + N'] from [months].' + DATENAME(MONTH, @destinationDate) + N' where dni = ' + CAST(@destinationDni AS NVARCHAR) + N');'
    EXEC sys.sp_executesql @SQLDynamic, N'@destinationTypeTurn CHAR(3) OUTPUT', @destinationTypeTurn OUTPUT;

    SET @SQLDynamic = N'UPDATE [months].' + DATENAME(MONTH, @originDate) + N' SET [' + CAST(DAY(@originDate) AS NVARCHAR) + N'] = @originTypeTurn WHERE dni = ' +  CAST(@destinationDni AS NVARCHAR) + N';'
    EXEC sys.sp_executesql @SQLDynamic, N'@originTypeTurn CHAR(3)', @originTypeTurn;

    SET @SQLDynamic = N'UPDATE [months].' + DATENAME(MONTH, @destinationDate) + N' SET [' + CAST(DAY(@destinationDate) AS NVARCHAR) + N'] = @destinationTypeTurn WHERE dni = ' +  CAST(@originDni AS NVARCHAR) + N';'
    EXEC sys.sp_executesql @SQLDynamic, N'@destinationTypeTurn CHAR(3)', @destinationTypeTurn;

	SET @SQLDynamic = N'UPDATE [months].' + DATENAME(MONTH, @originDate) + N' SET [' + CAST(DAY(@originDate) AS NVARCHAR) + N'] = NULL WHERE dni = ' +  CAST(@originDni AS NVARCHAR) + N';'
    EXEC sys.sp_executesql @SQLDynamic;

    SET @SQLDynamic = N'UPDATE [months].' + DATENAME(MONTH, @destinationDate) + N' SET [' + CAST(DAY(@destinationDate) AS NVARCHAR) + N'] = NULL WHERE dni = ' +  CAST(@destinationDni AS NVARCHAR) + N';'
    EXEC sys.sp_executesql @SQLDynamic;

	update [dbo].request set [state] = 1 where id = @id
END

exec [api].InsertOnRequest 43386520, '2024-2-26',  50000000, '2024-2-25';
exec [api].insertOnRequest 43386520, '2024-3-27', 50000000, '2024-3-25';
delete from dbo.request
exec api.InsertOnRequest 43386520, '2023-01-01', 70000000, '2023-02-11'

exec api.deleteOnRequest 1

select * from dbo.request

exec api.updateCalendar 10;

select * from months.march
DELETE FROM dbo.request where id = 9

-------------------------------VIEW-------------------------------

create or alter view [api].showPersonal 
with SCHEMABINDING 
AS
select dni, namesurname from [dbo].[personal]
go


select * from api.showPersonal

exec api.showCalendar 'april'

select * from months.april