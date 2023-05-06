	--CREATE VIEW	SelfProfile
	--AS
		
	--	SELECT	username, usertype, fullname, birthdate, gender, CNIC, picture, aboutuser, phonenumber, emailaddress, workaddress, bankaccount, walletmoney, rating, jobsnotdone, jobsongoing, jobsdone FROM Users

	--GO

	--CREATE VIEW NonSelfProfile
	--AS

	--	SELECT	

	--GO



	
create view Q3 as
select O.CustomerNo as StarCustomer, SUM(OD.Quantity*I.Price) as Purchases
from [Order] as O
join OrderDetails as OD on O.OrderNo=OD.OrderNo
join Items as I on OD.ItemNo=I.ItemNo
group by O.CustomerNo
having SUM(OD.Quantity*I.Price)>2000
go;

select * from Q3
go;
















-- -------------------- --
--  Functionality # 5:	--
-- -------------------- --

	CREATE PROCEDURE		DepositMoney

		@_userID			int,
		@_amount			money,
		@_password			varchar(16),
		@_usertype			int,

		@_ret_val_			int					output

	AS
		BEGIN

			INSERT INTO MoneyTransfers VALUES (CURRENT_TIMESTAMP, @_amount, NULL, @_userID, NULL)
			UPDATE Users SET walletmoney = (walletmoney - @_amount) WHERE userID = @_userID
			

		END
	GO

-- -----

	CREATE PROCEDURE		WithdrawMoney

		@_username			varchar(16),
		@_emailadd			varchar(32),
		@_password			varchar(16),
		@_usertype			int,

		@_ret_val_			int					output

	AS
		BEGIN

			IF		NOT EXISTS (SELECT * FROM Users WHERE username=@_username)
				BEGIN
					INSERT INTO Users (username, userpass, emailaddress, usertype) VALUES (@_username, @_password, @_emailadd, @_usertype)
					SET		@_ret_val_ = 0
				END
			ELSE
					SET		@_ret_val_ = -1

		END
	GO









-- -------------------- --
--  Functionality #21:	--
-- -------------------- --

	CREATE PROCEDURE		DeleteAccount

		@_username			varchar(16),
		@_password			varchar(16),

		@_ret_val_			int					output

	AS
		BEGIN

			IF		EXISTS	(SELECT * FROM Users WHERE username=@_username)
			BEGIN
				IF		(SELECT userpass FROM Users WHERE username=@_username)=@_password
					BEGIN
						--UPDATE	Users SET 
						SELECT	@_user_ID_ = userID FROM Users WHERE username=@_username
						SELECT	@_usertype = usertype FROM Users WHERE username=@_username
						SET		@_ret_val_ = 0
					END
				ELSE
						SET		@_ret_val_ = -1
			END
			ELSE
				SET		@_ret_val_ = -2

		END
	GO













-- Creating Tables (note that table ID columns will be auto-generated):



create table Users
(
	userID			int				primary key		identity(1,1),

	username		varchar(16)		not null		unique,
	userpass		varchar(16)		not null,
	usertype		int				not null,	--char(1)

	fullname		varchar(64)		,--not null,
	birthdate		date			,--not null,
	gender			char(1)			,--not null,
	CNIC			varchar(15)		,--not null		unique,

	picture			image,
	aboutuser		text,

	phonenumber		varchar(14),
	emailaddress	varchar(50)		not null,
	workaddress		varchar(128),
	bankaccount		varchar(34)		,--not null,
			-- International Bank Account Number (IBAN) may be up to 34 characters long

	walletmoney		money			default 0,

	rating			int				default 3,
	jobsnotdone		int				default 0,
	jobsongoing		int				default 0,
	jobsdone		int				default 0,

	check (usertype=2 or usertype=1 or usertype=0),
			-- client (C), freelancer (F) or admin (A)
	check (gender='M' or gender='F' or gender='O'),
			-- male (M), female (F) or other (O)
	check (CNIC like '_____-_______-_'),
			-- format of Pakistani CNICs
	check (phonenumber like '+92___-_______'),
			-- format of Pakistani phone numbers
	check (emailaddress like '%@%.%'),
	check (rating in (1,2,3,4,5))
);
go

create table Jobs
(
	jobID			int				primary key		identity(1,1),

	clientID		int				foreign key		references Users (userID),

	jobtitle		varchar(32)		not null,
	jobtype			varchar(32),

	jobvalue		money			not null,
	jobdetail		text			not null,

	postdate		date			not null,
	duedate			date,

	jobstatus		char(1)			default 'T',

	lancerID		int				foreign key		references Users (userID),
	deliverable		varbinary(max),
			-- file uploaded by freelancer upon work completion

	check (jobstatus='N' or jobstatus='T' or jobstatus='O' or jobstatus='D' or jobstatus='R')
			-- not done (N), to be assigned (T), ongoing (O), done (D) or withdrawn (W)
);
go

create table Proposals
(
	proposalID		int				primary key		identity(1,1),
				
	jobID			int				foreign key		references Jobs (jobID),
	lancerID		int				foreign key		references Users (userID),

	applydate		date			not null,
	proposaldetail	text,

	approvalstatus	char(1)			default 'P',
	approvaldate	date,

	check (approvalstatus='A' or approvalstatus='R' or approvalstatus='P' or approvalstatus='W')
			-- approved (A), rejected (R), pending (P) or withdrawn (W)
);
go

create table MoneyTransfers
(
	transferID		int				primary key		identity(1,1),

	transfertime	datetime		not null,
	amount			money			not null,

	forjob			int				foreign key		references Jobs (jobID),

	srcuser			int				foreign key		references Users (userID),
	dstuser			int				foreign key		references Users (userID)
);
go

create table Requests		-- complaints/feedback/requests for admins by clients/freelancers
(
	requestID		int				primary key		identity(1,1),

	sentby			int				foreign key		references Users (userID),
	handledby		int				foreign key		references Users (userID),

	requestdate		date			not null,
	details			text			not null,

	requeststatus	char(1)			default 'P',
	donedate		date,

	check (requeststatus='P' or requeststatus='H' or requeststatus='R')
			-- pending (P), handled (H) or refused (R)
);
go


/* Note that the logical specifications of the project are such that tuples will not need to be deleted
so there is no need for 'on delete set null/set default/cascade/no action' statements on foreign keys.
Similarly, updating a tuple will not alter the autogenerated IDs so 'on update set null/set default/
cascade/no action' statements are also not needed */


-- Trial Data Insertions (just for testing schema):
/*
insert into Users (username,userpass,usertype,fullname,birthdate,gender,CNIC,picture,aboutuser,phonenumber,emailaddress,workaddress,bankaccount) values
('client1','pw1','2','First Client','2.19.2003','M','36501-1234567-1',NULL,'Hello1','+92336-1234567','abc@def.com','address1','123456789'),
('lancer1','pw2','F','First Lancer','3.18.2004','F','36501-1586799-5',NULL,'Hello2','+92331-1234567','ghj@def.com','address2','123447891'),
('admins1','pw3','A','First Admins','6.23.2001','M','36533-1235355-6',NULL,'Hello3','+92336-1234454','etw@def.com','address3','123435434')
go

select * from Users;

insert into Jobs (clientID,jobtitle,jobtype,jobvalue,jobdetail,postdate,duedate) values
(1,'First Job','Graphic Design',54,'Design a logo for me.',getdate(),'4.25.2023')
go

select * from Jobs;

insert into Proposals (jobID,lancerID,applydate,proposaldetail) values
(1,3,getdate(),'I will design a logo.')
go

select * from Proposals

insert into MoneyTransfers (transfertime,amount,forjob,srcuser,dstuser) values
(getdate(),50.00,2,6,3)
go

select * from MoneyTransfers

insert into Requests (sentby, requestdate, details) values
(2, getdate(), 'Money not paid by client1')
go

select * from Requests
*/










EXEC sp_tables @table_type = "'TABLE'"

select * from information_schema.routines where routine_type = 'Procedure'

select * from Users
select * from Jobs

insert into Jobs values (4,'My Job','Web Design',54,'Design a website for me.',getdate(),'4.25.2023','T',NULL,NULL)

select * from Proposals
insert into Proposals values (2,2,getdate(),'I will design best logo.','P', NULL)
drop table Users

insert into Users (username, userpass, emailaddress, usertype) values ('webmaster', 'MASUMCorp.2023', 'webmaster@jobdelta.com', 0)


drop table TestTable1
















CREATE DATABASE [JobDeltaDB] ON  PRIMARY 
(NAME = N'JobDeltaDB', FILENAME = N'H:\DBLP\JobDelta\App_Data\JobDeltaDB.mdf')
LOG ON 
( NAME = N'JobDeltaDBLog', FILENAME = N'H:\DBLP\JobDelta\App_Data\JobDeltaDBLog.ldf')
GO

use JobDeltaDB

create table TestTable1
(
	testID		int,
	testName	varchar(20)
)

drop table TestTable1;

insert into TestTable1 values (1, 'ABC')

drop database [H:\DBLP\JOBDELTA\APP_DATA\JOBDELTADB.MDF]
go
















CREATE PROCEDURE		SignUp

	@_username			varchar(16),
	@_emailadd			varchar(32),
	@_password			varchar(16),
	@_usertype			int,

	@_ret_val_			int					output

AS
	BEGIN

		IF		NOT EXISTS (SELECT * FROM Users WHERE username=@_username)
			BEGIN
				INSERT INTO Users (username, userpass, emailaddress, usertype) VALUES (@_username, @_password, @_emailadd, @_usertype)
				SET		@_ret_val_ = 0
			END
		ELSE
				SET		@_ret_val_ = -1

	END
GO



CREATE PROCEDURE		SignIn

	@_username			varchar(16),
	@_password			varchar(16),

	@_user_ID_			int					output,
	@_usertype			int					output,
	@_ret_val_			int					output

AS
	BEGIN

		IF		EXISTS	(SELECT * FROM Users WHERE username=@_username)
			BEGIN
				IF		(SELECT userpass FROM Users WHERE username=@_username)=@_password
					BEGIN
						SELECT	@_user_ID_ = userID FROM Users WHERE username=@_username
						SELECT	@_usertype = usertype FROM Users WHERE username=@_username
						SET		@_ret_val_ = 0
					END
				ELSE
						SET		@_ret_val_ = -1
			END
		ELSE
				SET		@_ret_val_ = -2

	END
GO








CREATE PROCEDURE		RecoverPassword

	@_username			varchar(16),
	@_emailadd			varchar(50),

	@_password			varchar(16)			output,
	@_ret_val_			int					output

AS
	BEGIN

		IF		EXISTS	(SELECT * FROM Users WHERE username=@_username)
			BEGIN
				IF		(SELECT emailaddress FROM Users WHERE username=@_username)=@_emailadd
					BEGIN
						SELECT	@_password = userpass FROM Users WHERE username=@_username
						SET		@_ret_val_ = 0
					END
				ELSE
						SET		@_ret_val_ = -1
			END
		ELSE
				SET		@_ret_val_ = -2

	END
GO



truncate table Users
select * from Users



































