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









ALTER PROCEDURE		SignUp

	@_username			varchar(16),
	@_emailadd			varchar(32),
	@_password			varchar(16),
	@_usertype			char(1),

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



ALTER PROCEDURE		SignIn

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