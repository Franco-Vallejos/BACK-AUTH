create database userDataBase
go
use userDataBase
go

create schema [user]
go
create schema [api]
go

-- use master drop database calendar

create login loginUserData
with password = 'sqlUserData'
go

create user userData for login loginUserData
go
ALTER LOGIN loginUserData WITH DEFAULT_DATABASE = userDataBase;
go
ALTER USER userData WITH LOGIN = loginUserData;
go
Grant execute on schema::[api] to userData
go
--drop login calendar
--drop user calendar

-------------------------------TABLES-------------------------------

create table [user].userTable (
	username int check (username < 99999999 and username>10000000) primary key,
	password varchar(20)
)

create table [user].tokenTable(
	username int check (username < 99999999 and username>10000000) primary key,
	token nvarchar(max)	
)
go

-------------------------------CONSTRAINT-------------------------------

alter table [user].tokenTable add constraint tokenTable_FK foreign key (username)
references [user].userTable(username)


-------------------------------LOTE DE PRUEBA-------------------------------

insert into [user].userTable (username, password) values (43386520, 1234)
insert into [user].userTable (username, password) values (70000000, 12345)
insert into [user].userTable (username, password) values (60000000, 123456)


-------------------------------STORE PROCEDURE-------------------------------

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'getUserData') AND type in (N'P', N'PC'))
  DROP PROCEDURE [api].getUserData
GO

create or alter procedure [api].getUserData (@username int)
WITH EXECUTE AS OWNER 
as 
begin
    declare @SQLDinamic nvarchar(max);
    set @SQLDinamic = N'select * from [user].userTable where username = ' + cast(@username as char(8)) + N'';
    exec sys.[sp_executesql] @SQLDinamic;
end
go

create or alter procedure [api].removeToken (@token nvarchar(max))
WITH EXECUTE AS OWNER 
as 
begin
    declare @SQLDinamic nvarchar(max);
    set @SQLDinamic = N'delete from [user].tokenTable where token = ''' + @token + '''';
	print(@sqlDinamic)
    exec sys.[sp_executesql] @SQLDinamic;
end
go

create or alter procedure [api].setToken (@user int, @token varchar(max))
WITH EXECUTE AS OWNER 
as 
begin
	if exists (select 1 from [user].tokenTable where username = @user)
		update [user].tokenTable set token = @token where username = @user
	else
		insert into [user].tokenTable (username, token) values (@user, @token)
end
go

create or alter procedure [api].getUserFromToken (@token varchar(max))
WITH EXECUTE AS OWNER 
as 
begin
	select username from [user].tokenTable where token = @token
end
go



select * from [user].tokenTable

exec [api].removeToken N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJuYW1lIjo3MDAwMDAwMCwicGFzc3dvcmQiOiIxMjM0NSJ9LCJpYXQiOjE3MDg1Mjc0MTIsImV4cCI6MTcwODUzMTAxMn0.sFWDlOH2qeH9RLIUFtAjEz3fBBm7EjRjQgc1DvUuVzk'

exec [api].getUserFromToken N'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7InVzZXJuYW1lIjo0MzM4NjUyMCwicGFzc3dvcmQiOiIxMjM0In0sImlhdCI6MTcwODUyMjA2NSwiZXhwIjoxNzA4NTI1NjY1fQ.xQHkMqcfL-_llcMcZQRiAapWVR96qbkqpRIFjtC3f6U'
-------------------------------VIEW----------------------------

create or alter view [api].showRefreshToken 
with SCHEMABINDING 
AS
select username, token from [user].tokenTable
go
