create database Struktura
use Struktura
create table Banks(
BankID smallint primary key not null identity(1,1),
City varchar(255) not null,
BankName varchar(255) not null)
insert into Banks values ('Warszawa','PKO Bank Polski'),('Katowice','ING Bank Œl¹ski'), ('Kraków','mBank')
create table Employees (
EmployeeID smallint primary key not null identity(1,1),
FirstName varchar(255) not null,
SecondName varchar(255) not null)
insert into Employees values('Jan', 'Kowalski'), ('Martyna', 'Kowalska'),('Maciej','Pi¹tek'), ('Karolina','Pi¹tek')
create table Clients(
ClientID smallint primary key not null identity(1,1),
FirstName varchar(255) not null,
SecondName varchar(255)not null,
PESEL varchar(255) not null,
PostalCode varchar(255) not null,
City varchar(255) not null,
District varchar(255) not null)
insert into Clients values('Bogumi³','Kaczmarczyk','19940010590','40-000','Katowice','Œl¹sk'),('Ariel','Szulc','19840010590','40-000','Katowice','Œl¹sk'),('Joachim','Kwiatkowski','19340010590','41-800','Zabrze','Œl¹sk'),
('Daniel','Kwiatkowski','12310105901','30-007','Zabrze','Ma³opolska'),('Micha³','Duda','17840010590','30-007','Kraków','Ma³opolska'),('Dominika','Duda','16840010590','30-007','Kraków','Ma³opolska'),('Kacper','Majkowski','10840010590','45-573','Wroc³aw','Dolny Œl¹sk'),
('Cyprian','Majkowski','12840010590','45-573','Wroc³aw','Dolny Œl¹sk'),('Dominik','Kowalski','16840010590','45-573','Opole','Opolskie')

create table Accounts(
AccountNumber varchar(255) not null primary key,
EmployeeID smallint not null foreign key references Employees(EmployeeID),
BankID smallint not null foreign key references Banks(BankID),
DateOfCreation date not null check (DateOfCreation between '2001-01-01' and GetDate()),
ClientID smallint not null foreign key references Clients(ClientID))
alter table Accounts
ADD CONSTRAINT accountn unique(AccountNumber)
insert into Accounts values('9012401910176543',1,1,'2002-02-14',1),('9112401910172315',1,1,'2002-03-14',1),('8012401910170876',1,1,'2002-04-10',1),('8712401910170098',1,1,'2003-02-24',1),('5412401910177786',1,1,'2005-10-01',1),('4012401910175664',1,1,'2007-01-12',1),('3012401910174323',1,1,'2007-04-17',1),('1212401910177654',1,1,'2009-12-02',1),('18124019101776540002',1,1,'2009-12-02',1)
delete from Accounts where AccountNumber like '18124019101776540002'
insert into Accounts values('1812401910177654',1,1,'2009-12-02',1)
Select Banks.BankID from Banks
Join Accounts on Banks.BankID= Accounts.BankID
Select Employees.EmployeeID from Employees
Join Accounts on Employees.EmployeeID = Accounts.EmployeeID
Select Clients.ClientID from Clients
Join Accounts on Clients.ClientID = Accounts.ClientID
update Accounts set BankID = 1 where AccountNumber like '9%'
update Accounts set BankID = 2 where AccountNumber like '8%'
update Accounts set BankID = 3 where AccountNumber not like '8%' and AccountNumber not like '9%'
update Accounts set EmployeeID = 1 where YEAR(DateOfCreation) = 2002 and Month(DateOfCreation) < 4
update Accounts set EmployeeID = 2 where BankID = 2
update Accounts set EmployeeID = 3 where YEAR(DateOfCreation) between 2004 and 2008
update Accounts set EmployeeID = 4 where YEAR(DateOfCreation) = 2009
update Accounts set ClientID = 1 where EmployeeID = 4
update Accounts set ClientID = 2 where EmployeeID = 1
update Accounts set ClientID = 3 where EmployeeID = 2
update Accounts set ClientID = 4 where EmployeeID = 3
Select ClientID, SecondName,FirstName from Clients
Select AccountNumber from Accounts
Where YEAR(DateOfCreation) < 2007
drop table Accounts
drop database Struktura



