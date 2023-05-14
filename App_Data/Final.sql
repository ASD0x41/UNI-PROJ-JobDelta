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

	requestdate		date,		
	details			varchar(250),

	requeststatus	char(1)			default 'P',
	donedate		date,

	UName		varchar(25),
	email		varchar(50),
	improve		varchar(250),
	complain	varchar(250),
	suggestion	varchar(250),

	check (requeststatus='P' or requeststatus='H' or requeststatus='R')
			-- pending (P), handled (H) or refused (R)
);
go
--drop table Requests

create table feedback		-- complaints/feedback/requests for admins by clients/freelancers
(
	feedbackID		int				primary key		identity(1,1),
	sentby			int				foreign key		references Users (userID),
	UName		varchar(25),
	email		varchar(50),
	feedback	varchar(250),
	rating		int
);
go
--drop table feedback


create table Complain		-- complaints/feedback/requests for admins by clients/freelancers
(
	ComplainID		int				primary key		identity(1,1),
	sentby			int				foreign key		references Users (userID),
	improve		varchar(250),
	complain	varchar(250),
	suggestion	varchar(250)
);
go




create table complaints		-- complaints for admins by clients/freelancers
(
	complaintID		int				primary key		identity(1,1),

	sentby			int				foreign key		references Users (userID),
	sentfor         int             foreign key     references Users (userID),

	onJob           int             foreign key		references Jobs (jobID),

	posteddate		date			not null,
	details			text			not null,

	status	char(1)			default 'P',

	check (status='P' or status='H' or status='R')
			-- pending (P), handled (H) or refused (R)
);
go


--drop table deliverable
create table deliverable
(
  
	jobID			int				foreign key		references Jobs (jobID),
	Ext  varchar(10)
);
go



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------Prodecures---------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





--Taken frok Sultans procedures
-----------------------------------------GetUserById------------------------------------------
CREATE PROCEDURE GetUserById(
    @UserId INT
)
AS
BEGIN
    SELECT username
    FROM Users
    WHERE UserId = @UserId
END

GO


/*

Description:
The "GetUserById" stored procedure retrieves the username of a user from the "Users" table in the database based on the given user ID.

Input Parameters:

"@UserId" (INT): The ID of the user whose username needs to be retrieved.
Output:

"username" (VARCHAR): The username associated with the input user ID, retrieved from the "Users" table.
Example Usage:
To retrieve the username for a user with ID = 123, execute the following SQL statement:
EXEC GetUserById @UserId = 123

Notes:

This stored procedure assumes that there is a "Users" table in the database that contains a "UserId" column and a "username" column.
If no user with the given ID exists in the "Users" table, this stored procedure will not return any results.

*/

-----------------------------------------GetBirthDate------------------------------------------

CREATE PROCEDURE GetUserBirthdateById
	@userID int
AS
BEGIN
	SELECT birthdate
	FROM Users
	WHERE userID = @userID
END
GO


-----------------------------------------GetGender------------------------------------------
CREATE PROCEDURE GetUserGenderById
	@userID int
AS
BEGIN
	SELECT gender
	FROM Users
	WHERE userID = @userID
END
GO

-----------------------------------------GetWorkAddress------------------------------------------

CREATE PROCEDURE GetUserWorkAddressById
	@userID int
AS
BEGIN
	SELECT workaddress
	FROM Users
	WHERE userID = @userID
END
GO

-----------------------------------------GetCNIC------------------------------------------

CREATE PROCEDURE GetUserCNICById
	@userID int
AS
BEGIN
	SELECT CNIC
	FROM Users
	WHERE userID = @userID
END
GO

-----------------------------------------GetAboutinfo------------------------------------------

CREATE PROCEDURE GetUserAboutById
	@userID int
AS
BEGIN
	SELECT aboutuser
	FROM Users
	WHERE userID = @userID
END
GO

-----------------------------------------GetBankAccount------------------------------------------

CREATE PROCEDURE GetUserBankAccountById
	@userID int
AS
BEGIN
	SELECT bankaccount
	FROM Users
	WHERE userID = @userID
END
GO

-----------------------------------------WalletMoney------------------------------------------

CREATE PROCEDURE GetUserWalletMoneyById
	@userID int
AS
BEGIN
	SELECT walletmoney
	FROM Users
	WHERE userID = @userID
END
GO

-----------------------------------------GetUserFullName------------------------------------------

CREATE PROCEDURE GetUserFullName
    @userID int
AS
BEGIN
    SELECT fullname
    FROM Users
    WHERE userID = @userID
END

GO

/*

Description:
The "GetUserFullName" stored procedure retrieves the full name of a user from the "Users" table in the database based on the given user ID.

Input Parameters:

"@userID" (INT): The ID of the user whose full name needs to be retrieved.
Output:

"fullname" (VARCHAR): The full name associated with the input user ID, retrieved from the "Users" table.
Example Usage:
To retrieve the full name for a user with ID = 123, execute the following SQL statement:
EXEC GetUserFullName @userID = 123

Notes:

This stored procedure assumes that there is a "Users" table in the database that contains a "userID" column and a "fullname" column.
If no user with the given ID exists in the "Users" table, this stored procedure will not return any results.


*/


-----------------------------------------GetUserEmail------------------------------------------

CREATE PROCEDURE GetEmail_ID
    @UserId INT
AS
BEGIN
    SELECT emailaddress
    FROM Users
    WHERE UserId = @UserId
END

GO

/*

Description:
The "GetEmail_ID" stored procedure retrieves the email address of a user from the "Users" table in the database based on the given user ID.

Input Parameters:

"@UserId" (INT): The ID of the user whose email address needs to be retrieved.
Output:

"emailaddress" (VARCHAR): The email address associated with the input user ID, retrieved from the "Users" table.
Example Usage:
To retrieve the email address for a user with ID = 123, execute the following SQL statement:
EXEC GetEmail_ID @UserId = 123

Notes:

This stored procedure assumes that there is a "Users" table in the database that contains a "UserId" column and an "emailaddress" column.
If no user with the given ID exists in the "Users" table, this stored procedure will not return any results.

*/


CREATE PROCEDURE GetPhoneNumber 
 @userID INT
AS
BEGIN
	SELECT phonenumber
	FROM Users
	WHERE userID = @userID;
END;
GO

/*

Description:
The "GetPhoneNumber" stored procedure retrieves the phone number of a user based on their ID from the "Users" table in the database.

Input Parameters:

"@userID" (INT): The ID of the user whose phone number needs to be retrieved.
Output:

"phonenumber" (VARCHAR): The phone number of the user ID, retrieved from the "Users" table.
Example Usage:
To retrieve the phone number of a user with ID = 123, execute the following SQL statement:
EXEC GetPhoneNumber @userID = 123

Notes:

This stored procedure assumes that there is a "Users" table in the database that contains a "phonenumber" column.
If no user exists in the "Users" table with the given ID, this stored procedure will return an empty result set.
The "phonenumber" output value represents the phone number of the given user ID.

*/

-----------------------------------------GetRating------------------------------------------

CREATE PROCEDURE GetUserRating
    @userID int
AS
BEGIN
    SELECT rating
    FROM Users
    WHERE userID = @userID
END

GO

/*

Description:
The "GetUserRating" stored procedure retrieves the rating of a user from the "Users" table in the database based on the given user ID.

Input Parameters:

"@userID" (INT): The ID of the user whose rating needs to be retrieved.
Output:

"rating" (INT): The rating associated with the input user ID, retrieved from the "Users" table.
Example Usage:
To retrieve the rating for a user with ID = 123, execute the following SQL statement:
EXEC GetUserRating @userID = 123

Notes:

This stored procedure assumes that there is a "Users" table in the database that contains a "userID" column and a "rating" column.
If no user with the given ID exists in the "Users" table, this stored procedure will not return any results.

*/

-----------------------------------------TotalJobs------------------------------------------

CREATE PROCEDURE GetTotalJobsByUserID
	@userID INT
AS
BEGIN
	SELECT SUM(jobsongoing + jobsdone) AS totaljobs
	FROM Users
	WHERE userID = @userID;
END
GO

/*

Description:
The "GetTotalJobsByUserID" stored procedure calculates the total number of jobs (i.e., ongoing jobs and completed jobs) associated with a specific user ID from the "Users" table in the database.

Input Parameters:

"@userID" (INT): The ID of the user whose total number of jobs needs to be calculated.
Output:

"totaljobs" (INT): The sum of "jobsongoing" and "jobsdone" columns for the user ID, retrieved from the "Users" table.
Example Usage:
To retrieve the total number of jobs for a user with ID = 123, execute the following SQL statement:
EXEC GetTotalJobsByUserID @userID = 123

Notes:

This stored procedure assumes that there is a "Users" table in the database that contains a "userID" column, a "jobsongoing" column, and a "jobsdone" column.
If no user with the given ID exists in the "Users" table, this stored procedure will not return any results.
The "totaljobs" output value represents the sum of ongoing jobs and completed jobs associated with the given user ID.

*/


-----------------------------------------JobsDone------------------------------------------
CREATE PROCEDURE GetJobsDoneByUserID
	@userID INT
AS
BEGIN
	SELECT jobsdone
	FROM Users
	WHERE userID = @userID;
END
GO

/*

Description:
The "GetJobsDoneByUserID" stored procedure retrieves the total number of jobs completed by a specific user from the "Users" table in the database.

Input Parameters:

"@userID" (INT): The ID of the user whose completed jobs need to be calculated.
Output:

"jobsdone" (INT): The total number of jobs completed by the user ID, retrieved from the "Users" table.
Example Usage:
To retrieve the total number of jobs completed by a user with ID = 123, execute the following SQL statement:
EXEC GetJobsDoneByUserID @userID = 123

Notes:

This stored procedure assumes that there is a "Users" table in the database that contains a "userID" column and a "jobsdone" column.
If no user with the given ID exists in the "Users" table, this stored procedure will not return any results.
The "jobsdone" output value represents the total number of completed jobs associated with the given user ID.

*/

-----------------------------------------ActiveJobs------------------------------------------

CREATE PROCEDURE GetJobsOnGoingByUserID
	@userID INT
AS
BEGIN
	SELECT jobsongoing
	FROM Users
	WHERE userID = @userID;
END
GO

/*

Description:
The "GetJobsOnGoingByUserID" stored procedure retrieves the total number of ongoing jobs assigned to a specific user from the "Users" table in the database.

Input Parameters:

"@userID" (INT): The ID of the user whose ongoing jobs need to be calculated.
Output:

"jobsongoing" (INT): The total number of ongoing jobs assigned to the user ID, retrieved from the "Users" table.
Example Usage:
To retrieve the total number of ongoing jobs assigned to a user with ID = 123, execute the following SQL statement:
EXEC GetJobsOnGoingByUserID @userID = 123

Notes:

This stored procedure assumes that there is a "Users" table in the database that contains a "userID" column and a "jobsongoing" column.
If no user with the given ID exists in the "Users" table, this stored procedure will not return any results.
The "jobsongoing" output value represents the total number of ongoing jobs assigned to the given user ID.

*/

-----------------------------------------JobsNotActive------------------------------------------

CREATE PROCEDURE GetJobsNotDoneByUserID
	@userID INT
AS
BEGIN
	SELECT jobsnotdone
	FROM Users
	WHERE userID = @userID;
END
GO

/*

Description:
The "GetJobsNotDoneByUserID" stored procedure retrieves the total number of jobs that are not yet completed or ongoing and assigned to a specific user from the "Users" table in the database.

Input Parameters:

"@userID" (INT): The ID of the user whose not-done jobs need to be calculated.
Output:

"jobsnotdone" (INT): The total number of jobs that are not yet completed or ongoing and assigned to the user ID, retrieved from the "Users" table.
Example Usage:
To retrieve the total number of jobs that are not yet completed or ongoing and assigned to a user with ID = 123, execute the following SQL statement:
EXEC GetJobsNotDoneByUserID @userID = 123

Notes:

This stored procedure assumes that there is a "Users" table in the database that contains a "userID" column and a "jobsnotdone" column.
If no user with the given ID exists in the "Users" table, this stored procedure will not return any results.
The "jobsnotdone" output value represents the total number of jobs that are not yet completed or ongoing and assigned to the given user ID.

*/


-----------------------------------------TotalEarning------------------------------------------

CREATE PROCEDURE GetTotalEarnings
    @userId INT
AS
BEGIN
    SELECT  COALESCE(SUM(amount), 0) AS TotalAmountReceived
    FROM MoneyTransfers
    WHERE dstuser = @userId AND srcuser IS NOT NULL
END
GO


/*

Description:
The "GetTotalEarnings" stored procedure retrieves the total amount of money received by a user based on their ID from the "MoneyTransfers" table in the database.

Input Parameters:

"@userId" (INT): The ID of the user whose total earnings need to be calculated.
Output:

"TotalAmountReceived" (MONEY): The total amount of money received by the user ID, retrieved from the "MoneyTransfers" table.
Example Usage:
To retrieve the total amount of money received by a user with ID = 123, execute the following SQL statement:
EXEC GetTotalEarnings @userId = 123

Notes:

This stored procedure assumes that there is a "MoneyTransfers" table in the database that contains a "dstuser" column and an "amount" column.
If no money transfer has been made to the user with the given ID in the "MoneyTransfers" table, this stored procedure will return a total amount of 0.
The "TotalAmountReceived" output value represents the total amount of money received by the given user ID.

*/

-----------------------------------------TotalSpendings------------------------------------------

CREATE PROCEDURE GetTotalSpendings
    @userId INT
AS
BEGIN
    SELECT COALESCE(SUM(amount), 0) AS TotalAmountReceived
    FROM MoneyTransfers
    WHERE srcuser = @userId AND dstuser IS NOT NULL
END
GO


/*

Description:
The "GetTotalSpendings" stored procedure calculates the total amount of money spent by a user based on their ID from the "MoneyTransfers" table in the database.

Input Parameters:

"@userId" (INT): The ID of the user whose total spendings needs to be calculated.
Output:

"TotalAmountReceived" (DECIMAL): The total amount of money spent by the user ID, calculated from the "MoneyTransfers" table.
Example Usage:
To calculate the total amount of money spent by a user with ID = 123, execute the following SQL statement:
EXEC GetTotalSpendings @userId = 123

Notes:

This stored procedure assumes that there is a "MoneyTransfers" table in the database that contains an "amount" column.
If no money transfers exist in the "MoneyTransfers" table with the given user ID as the source user, this stored procedure will return an empty result set with the value "NULL" for "TotalAmountReceived".
The "TotalAmountReceived" output value represents the total amount of money spent by the given user ID.

*/


------------------UpdateProceduers--------------------------

CREATE PROCEDURE UpdateUserFullNameById
	@userID int,
	@fullname varchar(64)
AS
BEGIN
	UPDATE Users
	SET fullname = @fullname
	WHERE userID = @userID
END
GO

CREATE PROCEDURE UpdateUserPhoneNumberById
	@userID int,
	@phonenumber varchar(14)
AS
BEGIN
	UPDATE Users
	SET phonenumber = @phonenumber
	WHERE userID = @userID
END
GO

CREATE PROCEDURE UpdateUserEmailAddressById
	@userID int,
	@emailaddress varchar(50)
AS
BEGIN
	UPDATE Users
	SET emailaddress = @emailaddress
	WHERE userID = @userID
END
GO

CREATE PROCEDURE UpdateUserWorkAddressById
	@userID int,
	@workaddress varchar(128)
AS
BEGIN
	UPDATE Users
	SET workaddress = @workaddress
	WHERE userID = @userID
END
GO

CREATE PROCEDURE UpdateUserAboutById
	@userID int,
	@aboutuser text
AS
BEGIN
	UPDATE Users
	SET aboutuser = @aboutuser
	WHERE userID = @userID
END
GO

CREATE PROCEDURE UpdateUserBankAccountById
	@userID int,
	@bankaccount varchar(34)
AS
BEGIN
	UPDATE Users
	SET bankaccount = @bankaccount
	WHERE userID = @userID
END
GO

CREATE PROCEDURE UpdateUserWalletMoneyById
	@userID int,
	@walletmoney money
AS
BEGIN
	UPDATE Users
	SET walletmoney = @walletmoney
	WHERE userID = @userID
END
GO

-----------------------CompleteProfile-------------------------------
CREATE PROCEDURE UpdateUserInfo
    @userId int,
    @fullname varchar(64),
    @birthdate date,
    @gender char(1),
    @CNIC varchar(15),
    @aboutuser text,
    @phonenumber varchar(14),
    @emailaddress varchar(50),
    @workaddress varchar(128),
    @bankaccount varchar(34)
AS
BEGIN
    UPDATE Users
    SET
        fullname = @fullname,
        birthdate = @birthdate,
        gender = @gender,
        CNIC = @CNIC,
        aboutuser = @aboutuser,
        phonenumber = @phonenumber,
        emailaddress = @emailaddress,
        workaddress = @workaddress,
        bankaccount = @bankaccount
    WHERE userID = @userId;
END;
GO


-------------------------------WALLETPROCEDUERS-----------------------------------

CREATE PROCEDURE Withdraw
    @userId INT,
	@amount INT
AS
BEGIN
    insert into MoneyTransfers (transfertime,amount,forjob,srcuser,dstuser) values
    (getdate(),@amount,NULL,@userId,NULL)

	UPDATE Users
	SET walletmoney -= @amount
	WHERE userID = @userID

END
GO


CREATE PROCEDURE Deposite
    @userId INT,
	@amount INT
AS
BEGIN
    insert into MoneyTransfers (transfertime,amount,forjob,srcuser,dstuser) values
    (getdate(),@amount,NULL,NULL,@userId)

	UPDATE Users
	SET walletmoney += @amount
	WHERE userID = @userID

END
GO

CREATE PROCEDURE GetTotalWithdraws
    @userId INT
AS
BEGIN
    SELECT COALESCE(SUM(amount), 0) AS TotalAmountReceived
    FROM MoneyTransfers
    WHERE srcuser = @userId AND dstuser IS NULL
END
GO

CREATE PROCEDURE GetTotalDeposites
    @userId INT
AS
BEGIN
    SELECT  COALESCE(SUM(amount), 0) AS TotalAmountReceived
    FROM MoneyTransfers
    WHERE dstuser = @userId AND srcuser IS NULL
END
GO


CREATE FUNCTION GetUsernameById
(
    @UserId INT
)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @Username VARCHAR(50)
    SELECT @Username = username
    FROM Users
    WHERE UserId = @UserId

    RETURN @Username
END
GO



CREATE PROCEDURE DisplayTransactionInfo
    @UserID int
AS
BEGIN

    SELECT 
        transfertime,
        amount,
        CASE 
            WHEN srcuser IS NOT NULL THEN dbo.GetUsernameById(srcuser)
            ELSE 'BankTransfer'
        END AS srcusername,
        CASE 
            WHEN dstuser IS NOT NULL THEN dbo.GetUsernameById(dstuser)
            ELSE 'BankTransfer'
        END AS dstusername
    FROM 
        MoneyTransfers
    WHERE 
        srcuser = @UserID OR dstuser = @UserID
    ORDER BY 
        transfertime DESC;
END
GO

CREATE PROCEDURE AddImage
	@userID int,
	@ImageData image
AS
BEGIN
	UPDATE Users
	SET picture = @ImageData
	WHERE userID = @userID
END
GO

CREATE PROCEDURE GetImageData
    @UserId INT
AS
BEGIN
    SELECT picture FROM Users WHERE userID = @UserId
END
GO


CREATE PROCEDURE GetPhoneNumber 
 @userID INT
AS
BEGIN
	SELECT phonenumber
	FROM Users
	WHERE userID = @userID;
END;
GO




CREATE PROCEDURE GetUserById(
    @UserId INT
)
AS
BEGIN
    SELECT username
    FROM Users
    WHERE UserId = @UserId
END

GO

--------------------------------ADMIN-PAGE-------------------------------------


CREATE PROCEDURE DisplayUsersInfo
AS
BEGIN

    SELECT 
         userID,
	     username,
	     usertype,
	     fullname,
	     birthdate,
	     gender,
	     CNIC,
		 phonenumber,
		 emailaddress,
		 workaddress,
		 bankaccount,
	     walletmoney
    FROM 
        Users
    ORDER BY 
        UserID ASC;
END
GO



CREATE PROCEDURE DisplayJobInfo
AS
BEGIN

    SELECT 
         jobtitle,
	     jobtype,
	     jobvalue,
	     jobdetail,
	     postdate,
	     duedate,
	     jobstatus,
         dbo.GetUsernameById(clientID) AS clientName,
         CASE
         WHEN lancerID IS NOT NULL THEN dbo.GetUsernameById(lancerID)
            ELSE 'JOB STILL NOT ACCEPTED'
             END AS lancerName
    FROM 
        Jobs
    ORDER BY 
        postdate DESC;
END
GO



CREATE FUNCTION GetJobTitle
(
    @JobId INT
)
RETURNS VARCHAR(50)
AS
BEGIN
    DECLARE @JobName VARCHAR(50)
    SELECT @JobName = jobtitle
    FROM Jobs
    WHERE jobID = @JobId

    RETURN @JobName
END
GO


CREATE PROCEDURE DisplayMoneyTransfersInfo
AS
BEGIN
    SELECT 
        transfertime,
        amount,
        CASE 
            WHEN srcuser IS NOT NULL THEN dbo.GetUsernameById(srcuser)
            ELSE 'BankTransfer'
        END AS srcusername,
        CASE 
            WHEN dstuser IS NOT NULL THEN dbo.GetUsernameById(dstuser)
            ELSE 'BankTransfer'
        END AS dstusername,
        dbo.GetJobTitle(forjob) AS JobTitle
    FROM 
        MoneyTransfers
    ORDER BY 
        transfertime DESC;
END
GO


CREATE PROCEDURE DisplayProposalInfo
AS
BEGIN

    SELECT 
    dbo.GetJobTitle(jobID) AS JobTitle,
	dbo.GetUsernameById(lancerID) AS LancerName,
	applydate,
	proposaldetail,
	approvalstatus
    FROM 
        Proposals
    ORDER BY 
        jobID DESC;
END
GO


CREATE PROCEDURE DisplayRequestInfo
AS
BEGIN

    SELECT 
    dbo.GetUsernameById(sentby) AS UserName,
	requestdate,
	details,
	requeststatus
    FROM 
        Requests
END
GO

CREATE PROCEDURE DisplayComplains
AS
BEGIN

    SELECT 
    dbo.GetUsernameById(sentby) AS UserName,
	dbo.GetUsernameById(sentfor) AS [Posted Against],
    dbo.GetJobTitle(onJob) AS [Job Title],
    posteddate AS [Date],
    details,
	status 
    FROM 
        Complaints
END
GO

CREATE PROCEDURE PostComplaint
  @jobID int,
  @sentby int,
  @details text
AS
BEGIN
  DECLARE @sentfor int;

  IF EXISTS (SELECT 1 FROM Jobs WHERE jobID = @jobID AND clientID = @sentby)
    SET @sentfor = (SELECT lancerID FROM Jobs WHERE jobID = @jobID);
  ELSE
    SET @sentfor = (SELECT clientID FROM Jobs WHERE jobID = @jobID);

  INSERT INTO complaints (sentby, sentfor, onJob, posteddate, details)
  VALUES (@sentby, @sentfor, @jobID, GETDATE(), @details);
END
go


CREATE PROCEDURE HandleComplaint
    @complaintid int
AS
BEGIN
    UPDATE Complaints
    SET complaintstatus = 'D'
    WHERE complaintid = @complaintid;
END

go





---------------------------------------------------------------------
---------------------------------------------------------------------
--Taken from schema file

CREATE PROCEDURE DepositMoney

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


-----this one was being altered and its name was ViewPostedJobs so i added 2
create PROCEDURE ViewPostedJobs2
	@clientId INT
AS
BEGIN
	SELECT jobID, jobtitle, jobtype, jobvalue, jobdetail, postdate, duedate, jobstatus
	FROM Jobs
	WHERE clientID = @clientId;
END
go




--------------------Taken from storedprocedures file-----------------

CREATE PROCEDURE usp_CreateAccount
	@userID int,
    @Username varchar(50),
    @Password varchar(50),
    
    @Gender varchar(10),
    @CNIC varchar(15),
    @DOB date,
    @PhoneNumber varchar(20),
    @Email varchar(50),
    @Expertise varchar(50) = NULL,
    @Qualifications varchar(500) = NULL,
    @userType varchar(10),
	@workaddress varchar (30),
	@bankaccount varchar(20)
AS
BEGIN
    

    IF @userType = 'C' or @userType='A'
    BEGIN
        INSERT INTO Users (UserID, username, userpass, CNIC, birthdate, PhoneNumber, emailaddress)
		
        VALUES (@UserID,@Username, @Password, @CNIC, @DOB, @PhoneNumber, @Email)
    END

    IF @userType = 'F'
    BEGIN
        INSERT INTO Users (UserID, username, userpass, CNIC, birthdate, PhoneNumber, emailaddress,expertise)
        VALUES (@userID,  @Username, @Password, @CNIC, @DOB, @PhoneNumber, @Email, @Expertise)
    END
	
END


go


--/////////////////////////////////////////////////////////////////////////////////////////////
---------------------------------------------LOGIN----------------------------------------------

CREATE PROCEDURE Login(

    @Username VARCHAR(50),
    @Password VARCHAR(50)
)
AS
BEGIN
    DECLARE @Role VARCHAR(20)
    
    
    SELECT @Role = 'C'
    FROM Users
    WHERE Username = @Username AND userpass = @Password
    
    IF @Role IS NULL
    BEGIN
        
        SELECT @Role = 'F'
        FROM Users
        WHERE Username = @Username AND userpass = @Password
    END
    
    IF @Role IS NULL
    BEGIN
        
        SELECT @Role = 'A'
        FROM Users
        WHERE Username = @Username AND userpass = @Password
    END
    
    
    IF @Role IS NOT NULL
        SELECT @Role
    ELSE
        PRINT 'Invalid credentials'
END




go



CREATE PROCEDURE ForgotPassword(
    @Username VARCHAR(50),
    @Email VARCHAR(50)
)
AS
BEGIN
    DECLARE @Password VARCHAR(50)
    
   
    SELECT @Password = userpass
    FROM users
    WHERE Username = @Username AND emailaddress = @Email
    
    IF @Password IS NULL
    BEGIN
        
        SELECT @Password = userpass
        FROM users
        WHERE Username = @Username AND emailaddress = @Email
    END
    
    
    IF @Password IS NOT NULL
    BEGIN
        DECLARE @Body VARCHAR(MAX)
        SET @Body = 'Your password is: ' + @Password
        EXEC msdb.dbo.sp_send_dbmail 
            @profile_name='YourMailProfile',
            @recipients=@Email,
            @subject='Forgot Password',
            @body=@Body
    END
    ELSE
        PRINT 'Invalid credentials'
END
go


-----it was alter procedure------
create procedure AddExtension
@jobID int,
@extension varchar (10)
as
begin
insert into deliverable (jobID,Ext )
values (@jobID, @extension)
end
go




-----it was alter procedure------
create procedure createExt
@JobID int,
@extension varchar (10)
as
begin
    
    insert into deliverable values (@jobID, @extension)

end
go



-----it was alter procedure------
create procedure GetExtension
@JobID int
as
begin
if exists (select * from deliverable where jobID = @JobID)
    begin
    select Ext from deliverable where jobID = @JobID
    end
end
go



CREATE PROCEDURE UpdateUserProfile(
    @UserID INT,
    @Username VARCHAR(50),
    @Password VARCHAR(50),
    @Email VARCHAR(50),
    @Phone VARCHAR(50),
    @Name VARCHAR(50),
	@usertype char,
    @DateOfBirth DATE
	)
AS
BEGIN
    
    IF @usertype='A'
    BEGIN
        
        UPDATE [Users]
        SET Username = @Username,
            userpass = @Password,
            emailaddress = @Email,
            phonenumber = @Phone,
            birthdate = @DateOfBirth
        WHERE UserID = @UserID
    END



    ELSE IF @usertype='C' or @usertype='F'
    BEGIN

        UPDATE Users
        SET Username = @Username,
            userpass = @Password,
            Emailaddress = @Email,
            Phonenumber = @Phone
        WHERE UserID = @UserID
        
  
        IF (@Username <> (SELECT username FROM Users WHERE UserID = @UserID)) OR (@DateOfBirth <> (SELECT birthdate FROM Users WHERE UserID = @UserID) or (@userID <> (SELECT userID FROM Users WHERE UserID = @UserID)))
        BEGIN
            RAISERROR('Clients and freelancers are not authorized to change their username, date of birth or userID without contacting an admin.', 16, 1)
        END
    END
    ELSE
    BEGIN
       
        RAISERROR('Invalid user ID.', 16, 1)
    END
END


go


CREATE PROCEDURE DepositMoneyToWallet
    @UserID INT,
    @Amount DECIMAL(10, 2)
AS
BEGIN
    DECLARE @BankBalance DECIMAL(10, 2)
    
   
    IF NOT EXISTS (SELECT 1 FROM moneytransfers WHERE srcuser = @UserID)
    BEGIN
        RAISERROR('User does not have a valid bank account.', 16, 1)
        RETURN
    END
    
    
    SELECT @BankBalance = amount
    FROM MoneyTransfers
    WHERE srcuser = @UserID
    
    
    UPDATE moneytransfers
    SET amount = amount - @Amount
    WHERE srcuser = @UserID
    
    
    UPDATE MoneyTransfers
    SET amount = amount + @Amount,
       transfertime = GETDATE()
    WHERE dstuser = @UserID
    
    
    IF @BankBalance - @Amount != (SELECT amount FROM MoneyTransfers WHERE dstuser = @UserID)
    BEGIN
        RAISERROR('Error occurred while depositing money to wallet.', 16, 1)
        RETURN
    END
END
go


CREATE PROCEDURE WithdrawMoneyFromWallet
    @UserID INT,
    @Amount DECIMAL(10, 2),
    @BankAccountNumber VARCHAR(50)
AS
BEGIN
    DECLARE @WalletBalance DECIMAL(10, 2)
    
    
    IF NOT EXISTS (SELECT 1 FROM MoneyTransfers WHERE srcuser = @UserID AND bankaccount = @BankAccountNumber)
    BEGIN
        RAISERROR('User does not have a valid bank account.', 16, 1)
        RETURN
    END
    
   
    IF (SELECT amount FROM MoneyTransfers WHERE srcuser = @UserID) < @Amount
    BEGIN
        RAISERROR('Wallet balance is insufficient.', 16, 1)
        RETURN
    END
    
   
    SELECT @WalletBalance = amount
    FROM MoneyTransfers
    WHERE srcuser = @UserID
    
   
    UPDATE MoneyTransfers
    SET amount = amount - @Amount,
        transfertime = GETDATE()
    WHERE srcuser = @UserID
    
  
    UPDATE MoneyTransfers
    SET amount = amount + @Amount
    WHERE srcuser = @UserID AND bankaccount = @BankAccountNumber
    
  
    IF @WalletBalance - @Amount != (SELECT amount FROM MoneyTransfers WHERE srcuser = @UserID)
    BEGIN
        RAISERROR('Error occurred while withdrawing money from wallet.', 16, 1)
        RETURN
    END
END

go



-----it was alter procedure------
create PROCEDURE CheckIfUserHasApplied
	@jobID INT,
    @lancerID INT,
    @return_val  INT OUTPUT
AS
Begin
    if exists( select * from Proposals where jobID = @jobID and lancerID = @lancerID)
    begin
        set @return_val = 1
    end
    else
        set @return_val = 0
    
end
go

-----it was alter procedure------
create procedure getProposal
@jobID INT,
@lancerID INT,
@proposalID INT OUTPUT,
@proposaldetail varchar(1000) OUTPUT,
@approvalstatus VARCHAR(32) OUTPUT,
@applydate DATE OUTPUT
as
begin
    if(exists(select * from Proposals where jobID = @jobID and lancerID = @lancerID))
    begin
        select @proposalID=proposalID,@proposaldetail = proposaldetail,@approvalstatus = approvalstatus,@applydate = applydate from Proposals where jobID = @jobID and lancerID = @lancerID
    end
end




CREATE PROCEDURE EditJob
    @jobID INT,
    @clientID INT,
    @jobtitle VARCHAR(32),
    @jobtype VARCHAR(32),
    @jobvalue MONEY,
    @jobdetail TEXT,
    @duedate DATE
AS
BEGIN
    
    IF EXISTS(SELECT 1 FROM Jobs WHERE jobID = @jobID AND clientID = @clientID AND jobstatus = 'T')
    BEGIN
        
        IF NOT EXISTS(SELECT 1 FROM Jobs WHERE jobID = @jobID AND jobstatus = 'N')
        BEGIN
            
            UPDATE Jobs
            SET jobtitle = @jobtitle,
                jobtype = @jobtype,
                jobvalue = @jobvalue,
                jobdetail = @jobdetail,
                duedate = @duedate
            WHERE jobID = @jobID AND clientID = @clientID AND jobstatus = 'T'
        END
        ELSE
        BEGIN
            
            RAISERROR('Cannot edit job as a freelancer has already applied for it', 16, 1)
        END
    END
    ELSE
    BEGIN
        
        RAISERROR('Invalid job or client', 16, 1)
    END
END

go




CREATE PROCEDURE RemoveJob
    @jobID int,
    @clientID int
AS
BEGIN
    SET NOCOUNT ON;

    
    IF EXISTS (
        SELECT 1
        FROM Jobs
        WHERE jobID = @jobID AND clientID = @clientID AND jobstatus IN ('T', 'N')
    )
    BEGIN
        
       -- UPDATE Walletmoney
        --SET balance = balance + j.jobvalue
        --FROM Jobs j
        --JOIN Wallet w ON j.clientID = w.userID
        --WHERE j.jobID = @jobID

        DELETE FROM Jobs
        WHERE jobID = @jobID AND clientID = @clientID

        SELECT 'Job removed successfully' AS Message
    END
    --ELSE
    BEGIN
        RAISERROR('Cannot remove job. It has already been assigned to a freelancer.', 16, 1)
    END
END
go


create procedure markproposal
@jobID INT,
@proposalID INT
AS
BEGIN
	if exists(select * from Proposals where jobID = @jobID and proposalID = @proposalID)
	begin
		update Proposals set approvalstatus = 'A' where jobID = @jobID and proposalID = @proposalID
        update Jobs set jobstatus = 'O' where jobID = @jobID
        update Jobs set lancerID = (select lancerID from Proposals where jobID = @jobID and proposalID = @proposalID) where jobID = @jobID
	end
end
go



----it was alter procedure-------
create procedure getstatus
@jobID INT,
@ret_val char(1) output
as
begin
	if exists (select jobstatus from Jobs where jobID = @jobID)
begin
		select @ret_val = jobstatus from Jobs where jobID = @jobID
	end
end
go


CREATE PROCEDURE UploadDeliverable
    @jobID INT,
    @deliverable VARBINARY(MAX)
AS
BEGIN
    UPDATE Jobs
    SET deliverable = @deliverable, jobstatus = 'D'
    WHERE jobID = @jobID
END
go





create procedure getDeliverable
@jobID INT,
@ret_val varbinary(max) output
as
begin
	if exists(select deliverable from Jobs where jobID = @jobID)
	begin
		select @ret_val = deliverable from Jobs where jobID = @jobID
	end
end
go



create procedure ViewOngoingJobs
@lancerID INT
as
begin
	select jobID, jobtitle, jobdetail, jobtype, jobvalue,jobstatus ,duedate from Jobs where lancerID = @lancerID
end

go

create procedure getProposals
@jobID INT
as
begin
	select proposalID,lancerID,proposaldetail,approvalstatus,applydate from Proposals where jobID = @jobID
end
go




create procedure checklancer
@lancerID Int,
@ret_val int output
as
begin
	if exists(select * from Jobs where lancerID = @lancerID)
	begin
		set @ret_val = 1
	end
	else
	begin
		set @ret_val = 0
	end
end
go

---it was alter procedure----

create procedure getlancerID
    @jobID INT,
    @lancerID int output
AS
BEGIN
	if exists (select lancerID from Jobs where jobID = @jobID)
    select @lancerID=lancerID from Jobs where jobID = @jobID
    else
    select @lancerID = 0
END
go




---it was alter procedure----
create PROCEDURE ifproposal
    @jobID INT,
    @ret_val INT OUTPUT
AS
BEGIN
    IF EXISTS (SELECT 1 FROM Proposals WHERE jobID = @jobID)
        SET @ret_val = 1
    ELSE
        SET @ret_val = 0
END
GO



---it was alter procedure----
create PROCEDURE ViewPostedJobs_F
    @jobID INT,
    @jobTitle VARCHAR(32) OUTPUT,
    @jobType VARCHAR(32) OUTPUT,
    @jobValue MONEY OUTPUT,
    @jobDetail NVARCHAR(1000) OUTPUT,
    @postDate DATE OUTPUT,
    @dueDate DATE OUTPUT

AS
BEGIN
    IF EXISTS (SELECT * FROM Jobs WHERE jobID = @jobID)
    BEGIN
        SELECT @jobTitle = jobtitle,
               @jobType = jobtype,
               @jobValue = jobvalue,
               @jobDetail = jobdetail,
               @postDate = postdate,
               @dueDate = duedate
               
        FROM Jobs
        WHERE jobID = @jobID
    END
END
go



CREATE PROCEDURE SearchAvailJobs
AS
BEGIN
	SELECT jobID,clientID, jobtitle, jobtype, jobvalue, jobdetail
    FROM Jobs WHERE jobstatus = 'T'
END
go



CREATE PROCEDURE SearchJobsByCategory
    @category varchar(32)
AS
BEGIN
    SELECT * FROM Jobs WHERE jobstatus = 'T' AND jobtype = @category
END
go


------it was alter procedure---
create PROCEDURE submitProposal
    @lancerID int,
    @jobID int,
    @proposalDetail Text

AS
BEGIN

   
    INSERT INTO Proposals(lancerID, jobID,applydate,proposaldetail )
    VALUES (@lancerID, @jobID, GETDATE(),@proposalDetail);
END
go

CREATE PROCEDURE ViewApplicantsAndRatings
    @clientID int,
    @jobID int
AS
BEGIN
    
    IF NOT EXISTS (SELECT 1 FROM Jobs WHERE jobID = @jobID AND clientID = @clientID)
    BEGIN
        RAISERROR ('The specified job either does not exist or was not posted by the specified client', 16, 1);
        RETURN;
    END

   
    SELECT 
        u.username AS freelancer_username,
        u.rating AS freelancer_rating
    FROM 
        Proposals as a 
        INNER JOIN Users u ON a.lancerID = u.userID
    WHERE 
        a.jobID = @jobID;

END
go





CREATE PROCEDURE AllocateJob
    @jobID int,
    @freelancerID int
AS
BEGIN
    
    DECLARE @jobStatus char(1);
    SELECT @jobStatus = jobstatus FROM Jobs WHERE jobID = @jobID;
    IF @jobStatus <> 'T'
    BEGIN
        RAISERROR ('Job is not available for allocation', 16, 1);
        RETURN;
    END

    
    UPDATE Jobs SET lancerID = @freelancerID, jobstatus = 'O' WHERE jobID = @jobID;

    
    DECLARE @freelancerEmail varchar(50);
    SELECT @freelancerEmail = emailaddress FROM Users WHERE userID = @freelancerID;
    SELECT @freelancerEmail AS 'Freelancer Email';
END
go



CREATE PROCEDURE ViewAppliedJobs
    @freelancerID int
AS
BEGIN
    SELECT J.jobID, J.jobtitle, J.jobtype, J.jobvalue, J.jobdetail, J.postdate, J.duedate, J.jobstatus, 
           U.username AS client_username, U.emailaddress AS client_email
    FROM Jobs J
    INNER JOIN Proposals A ON J.jobID = A.jobID
    INNER JOIN Users U ON J.clientID = U.userID
    WHERE A.lancerID = @freelancerID
    ORDER BY J.postdate DESC;
END
go







CREATE PROCEDURE MarkJobDone
	@jobID INT,
	@clientID INT
AS
BEGIN
	
	IF NOT EXISTS (SELECT * FROM Jobs WHERE jobID = @jobID AND clientID = @clientID)
	BEGIN
		RAISERROR('Job does not exist or does not belong to the specified client.', 16, 1)
		RETURN
	END

	DECLARE @jobValue MONEY, @lancerID INT, @walletMoney MONEY
	SELECT @jobValue = jobValue, @lancerID = lancerID FROM Jobs WHERE jobID = @jobID

	
	IF NOT EXISTS (SELECT * FROM Jobs WHERE jobID = @jobID AND jobstatus = 'D')
	BEGIN
		RAISERROR('Job is not marked as done by the freelancer.', 16, 1)
		RETURN
	END

	BEGIN TRANSACTION

	
	UPDATE Users SET walletmoney = walletmoney + @jobValue WHERE userID = @lancerID
	UPDATE Users SET walletmoney = walletmoney - @jobValue WHERE userID = @clientID

	
	UPDATE Jobs SET jobstatus = 'D' WHERE jobID = @jobID

	
	COMMIT TRANSACTION
END
go


------already exists above---
/*
CREATE PROCEDURE UploadDeliverable
    @jobID int,
    @freelancerID int,
    @deliverable varbinary(max)
AS
BEGIN
    
    IF NOT EXISTS (SELECT 1 FROM Jobs WHERE jobID = @jobID AND lancerID = @freelancerID)
    BEGIN
        RAISERROR ('Job has not been allocated to this freelancer', 16, 1);
        RETURN;
    END

    UPDATE Jobs SET jobstatus = 'D' WHERE jobID = @jobID;

    
    INSERT INTO Jobs(jobID, lancerID, deliverable, duedate)
    VALUES (@jobID, @freelancerID, @deliverable, GETDATE());
END
go

*/

CREATE PROCEDURE RateUser
    @raterID int,
    @ratedID int,
    @jobID int,
    @rating int,
    @feedback text
AS
BEGIN
    IF NOT EXISTS (SELECT * FROM Users WHERE userID = @raterID)
    BEGIN
        RAISERROR('Invalid rater ID', 16, 1)
        RETURN
    END

    IF NOT EXISTS (SELECT * FROM Users WHERE userID = @ratedID)
    BEGIN
        RAISERROR('Invalid rated ID', 16, 1)
        RETURN
    END

    IF NOT EXISTS (SELECT * FROM Jobs WHERE jobID = @jobID)
    BEGIN
        RAISERROR('Invalid job ID', 16, 1)
        RETURN
    END

    IF NOT EXISTS (SELECT * FROM Jobs WHERE jobID = @jobID AND clientID = @raterID)
    BEGIN
        RAISERROR('Only clients can rate freelancers for this job', 16, 1)
        RETURN
    END

    IF NOT EXISTS (SELECT * FROM Jobs WHERE jobID = @jobID AND lancerID = @raterID)
    BEGIN
        RAISERROR('Only freelancers can rate clients for this job', 16, 1)
        RETURN
    END

    IF @rating NOT BETWEEN 1 AND 5
    BEGIN
        RAISERROR('Rating should be between 1 and 5', 16, 1)
        RETURN
    END

    IF @raterID = @ratedID
    BEGIN
        RAISERROR('Cannot rate yourself', 16, 1)
        RETURN
    END

    IF NOT EXISTS (SELECT * FROM Proposals WHERE jobID = @jobID AND lancerID = @ratedID AND approvalstatus = 'A')
    BEGIN
        RAISERROR('The freelancer must have an approved proposal for this job', 16, 1)
        RETURN
    END

    UPDATE Users SET rating = ((rating * jobsdone) + @rating) / (jobsdone + 1), jobsdone = jobsdone + 1 WHERE userID = @ratedID

    --INSERT INTO Feedback (raterID, ratedID, jobID, rating, feedback) VALUES (@raterID, @ratedID, @jobID, @rating, @feedback)

    RETURN
END
go


CREATE PROCEDURE SendRequest
	@UserID INT,        
	@RequestText TEXT   
AS
BEGIN
	
	INSERT INTO Requests (sentby, requestdate, details, requeststatus)
	VALUES (@UserID, GETDATE(), @RequestText, 'P')

	
END
go




CREATE PROCEDURE ViewRequests
AS
BEGIN
	SELECT r.requestID, u.username AS sentby, r.requestdate, r.details, r.requeststatus
	FROM Requests r
	INNER JOIN Users u ON r.sentby = u.userID
	WHERE r.requeststatus = 'P'

	UNION

	SELECT r.requestID, u.username AS sentby, r.requestdate, r.details, r.requeststatus
	FROM Requests r
	INNER JOIN Users u ON r.handledby = u.userID
	WHERE r.requeststatus <> 'P'
	ORDER BY requestdate DESC;
END
GO

CREATE PROCEDURE HandleRequest
	@requestID int,
	@handledby int,
	@requeststatus char(1),
	@donedate date
AS
BEGIN
	UPDATE Requests
	SET handledby = @handledby,
	requeststatus = @requeststatus,
	donedate = @donedate
	WHERE requestID = @requestID;
END
GO


create procedure DeleteUserAccount
	@userID int
as
	begin
		
		delete from Users where userID = @userID;

		
		delete from Proposals where lancerID = @userID;

		
		delete from Jobs where clientID = @userID;

		
		delete from MoneyTransfers where srcuser = @userID or dstuser = @userID;

		
		delete from Requests where sentby = @userID;

		
		select 'User account deleted successfully.' as Message;
	end;
go




CREATE PROCEDURE Feedback_store
	--@feedID int,
 --   @compID int,
    @sentID int,
    @Username varchar(20),
    @usemail  varchar(50),
    @urating   varchar(5),
    @feedbck varchar(250),
    @improvement varchar(250),
    @comp varchar(250),
    @sugges varchar(250),
    @_ret_val_			int					output
AS
BEGIN
        INSERT INTO feedback (sentby, UName, email, feedback, rating)
        VALUES  (@sentID, @Username, @usemail, @feedbck, @urating)

    
        INSERT INTO Complain (sentby, improve, complain, suggestion)
        VALUES (@sentID, @improvement, @comp, @sugges)

        SET		@_ret_val_ = 0
	
END
go





-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------Functions---------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


CREATE FUNCTION ViewJobs (@_userID int) -- Functionality #9
RETURNS TABLE
AS
    RETURN (SELECT * FROM Jobs WHERE clientID = @_userID)
GO



CREATE FUNCTION ViewApplicants (@_jobID int) -- Functionality #12
    RETURNS TABLE
AS
    RETURN (SELECT * FROM Proposals WHERE jobID = @_jobID)
GO

CREATE FUNCTION ViewApplications (@_userID int) -- Functionality #14
    RETURNS TABLE
AS
    RETURN (SELECT * FROM Proposals WHERE lancerID = @_userID)
GO

CREATE FUNCTION GetDeliverable (@_jobID int) -- Functionality #16
    RETURNS varbinary(max)
AS
BEGIN
        DECLARE @file varbinary(max)
        SELECT @file = deliverable FROM Jobs WHERE jobID = @_jobID
        RETURN @file
END
GO

CREATE FUNCTION CalculateNewRating (@_userID int, @new_rating int) -- Functionality #18
    RETURNS int
AS
BEGIN
    DECLARE @newrating int, @oldrating int, @oldjobs int
    SELECT @oldrating = (SELECT rating FROM Users WHERE userID = @userID)
    SELECT @oldjobs = (SELECT jobsdone FROM Users WHERE userID = @userID)
    SELECT @newrating = ((@oldrating * @oldjobs) + @new_rating) / (@oldjobs + 1)
    RETURN @newrating
END
GO

CREATE FUNCTION ViewComplaints () -- Functionality #20
    RETURNS TABLE
AS
    RETURN (SELECT * FROM PendingComplaints)
GO

CREATE FUNCTION GetPassword (@_username int, @_emailaddress varchar(50)) -- Functionality #3
    RETURNS varchar(16)
AS
BEGIN
    DECLARE @_password varchar (16)
    IF EXISTS (SELECT * FROM Users WHERE username = @username)
        IF ((SELECT emailaddress FROM Users WHERE username = @_username) = @_emailaddress)
               SELECT @_password = [password] FROM Users WHERE username = @_username
        ELSE
               SET @_password = 'INVALID_EMAIL'
    ELSE
        SET @_password = 'INVALID_USER'
    RETURN @_password
END
GO



CREATE FUNCTION ViewPostedJobs (@_userID int)
    RETURNS TABLE
AS
    RETURN (SELECT jobtitle, jobtype, jobvalue, jobdetail FROM Jobs WHERE clientID = @_userID)
GO








create function Q5 (@userID int)
returns table
as
	return (select cardNum, dbo.Q1(cardNum) as Balance from UserCard where userID = @userID)
go







-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------Views---------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

CREATE VIEW SelfProfiles -- Functionality #4
AS
    SELECT username, usertype, fullname, birthdate, CNIC, phonenumber, gender, emailaddress, workaddress, picture, aboutuser, rating, jobsongoing, jobsdone FROM Users
GO

CREATE VIEW NonSelfProfiles -- AAdditional Functionality (~#4)
AS
    SELECT username, usertype, fullname, gender, picture, aboutuser, rating, jobsdone FROM Users
GO




CREATE VIEW PendingComplaints -- Functionality #20
AS
    SELECT sentby, requestsate, details WHERE requeststatus = 'P'
GO



CREATE VIEW MyJobs
AS
    SELECT jobtitle, jobtype, jobvalue, jobdetail, postdate, duedate, jobstatus, deliverable FROM Jobs
GO


















CREATE PROCEDURE		SearchUser

	@_username			varchar(16),
	@_usertype			int,

	@_fullname			varchar(64)			output,
	@_usergend			char(1)				output,
	@_user_pic			image				output,
	@_aboutusr			text				output,
	@_workaddr			varchar(128)		output,
	@_phonenum			varchar(14)			output,
	@_emailadd			varchar(50)			output,
    @_user_ID_			int     			output,
	@_ret_val_			int					output

AS
	BEGIN

		IF		EXISTS	(SELECT * FROM Users WHERE username=@_username AND usertype=@_usertype)
			BEGIN
				SELECT	@_fullname = fullname FROM Users WHERE username=@_username
				SELECT	@_usergend = gender FROM Users WHERE username=@_username
				SELECT	@_user_pic = picture FROM Users WHERE username=@_username
				SELECT	@_aboutusr = aboutuser FROM Users WHERE username=@_username
				SELECT	@_workaddr = workaddress FROM Users WHERE username=@_username
				SELECT	@_phonenum = phonenumber FROM Users WHERE username=@_username
				SELECT	@_emailadd = emailaddress FROM Users WHERE username=@_username
                SELECT	@_user_ID_ = userID FROM Users WHERE username=@_username
				SET		@_ret_val_ = 0
			END
		ELSE
				SET		@_ret_val_ = -1

	END
GO