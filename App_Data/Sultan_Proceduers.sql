

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

----------------------------------------------------------------------------------------------

CREATE PROCEDURE GetPhoneNumber 
 @userID INT
AS
BEGIN
	SELECT phonenumber
	FROM Users
	WHERE userID = @userID;
END;
GO


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


-----------------------------------------TotalEarning------------------------------------------

alter PROCEDURE GetTotalEarnings
    @userId INT
AS
BEGIN
    SELECT  COALESCE(SUM(amount), 0) AS TotalAmountReceived
    FROM MoneyTransfers
    WHERE dstuser = @userId AND srcuser IS NOT NULL AND srcuser != @userId
END
GO


-----------------------------------------TotalSpendings------------------------------------------

CREATE PROCEDURE GetTotalSpendings
    @userId INT
AS
BEGIN
    SELECT COALESCE(SUM(amount), 0) AS TotalAmountReceived
    FROM MoneyTransfers
    WHERE srcuser = @userId AND dstuser IS NOT NULL AND dstuser != @userId
END
GO

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

----------------------------------------------------------------------------------------------

CREATE PROCEDURE UpdateUserNameById
	@userID int,
	@Uname varchar(64)
AS
BEGIN
	UPDATE Users
	SET username = @Uname
	WHERE userID = @userID
END
GO

----------------------------------------------------------------------------------------------

CREATE PROCEDURE UpdateCNICById
	@userID int,
	@CNIC varchar(15)
AS
BEGIN
	UPDATE Users
	SET CNIC = @CNIC
	WHERE userID = @userID
END
GO

----------------------------------------------------------------------------------------------

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

----------------------------------------------------------------------------------------------

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

----------------------------------------------------------------------------------------------

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


----------------------------------------------------------------------------------------------

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

----------------------------------------------------------------------------------------------

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

----------------------------------------------------------------------------------------------

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

----------------------------------------------------------------------------------------------


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

----------------------------------------------------------------------------------------------

CREATE PROCEDURE GetTotalWithdraws
    @userId INT
AS
BEGIN
    SELECT COALESCE(SUM(amount), 0) AS TotalAmountReceived
    FROM MoneyTransfers
    WHERE srcuser = @userId AND dstuser IS NULL
END
GO

----------------------------------------------------------------------------------------------

CREATE PROCEDURE GetTotalDeposites
    @userId INT
AS
BEGIN
    SELECT  COALESCE(SUM(amount), 0) AS TotalAmountReceived
    FROM MoneyTransfers
    WHERE dstuser = @userId AND srcuser IS NULL
END
GO

----------------------------------------------------------------------------------------------

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

----------------------------------------------------------------------------------------------

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

----------------------------------------------------------------------------------------------

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

----------------------------------------------------------------------------------------------

CREATE PROCEDURE GetImageData
    @UserId INT
AS
BEGIN
    SELECT picture FROM Users WHERE userID = @UserId
END
GO

----------------------------------------------------------------------------------------------


CREATE PROCEDURE GetPhoneNumber 
 @userID INT
AS
BEGIN
	SELECT phonenumber
	FROM Users
	WHERE userID = @userID;
END;
GO

----------------------------------------------------------------------------------------------


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

----------------------------------------------------------------------------------------------


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

----------------------------------------------------------------------------------------------


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

----------------------------------------------------------------------------------------------

CREATE PROCEDURE DisplayMoneyTransfersInfo
AS
BEGIN
    SELECT 
        transfertime,
        amount,
        CASE 
            WHEN srcuser = 1 THEN 'Portal' 
            WHEN srcuser IS NOT NULL THEN dbo.GetUsernameById(srcuser)
            ELSE 'BankTransfer'
        END AS srcusername,
        CASE
            WHEN dstuser = 1 THEN 'Portal' 
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

----------------------------------------------------------------------------------------------


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

----------------------------------------------------------------------------------------------

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

----------------------------------------------------------------------------------------------

CREATE PROCEDURE DisplayComplains
AS
BEGIN

    SELECT 
    dbo.GetUsernameById(sentby) AS UserName,
	dbo.GetUsernameById(sentfor) AS [Posted Against],
    dbo.GetJobTitle(onJob) AS [Job Title],
    posteddate AS [Date],
    details,
    complaintID,
	status 
    FROM 
        Complaints
END
GO

----------------------------------------------------------------------------------------------

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
GO

----------------------------------------------------------------------------------------------

Create PROCEDURE HandleComplaint_Accept
    @complaintid int
AS
BEGIN
    DECLARE @By INT,@Against INT,@JobID INT,@jobvalue INT;
    select @By = sentby,@Against = sentfor  from complaints where complaintID = @complaintid
    
    UPDATE Complaints SET status = 'H' WHERE complaintid = @complaintid;
    
    SELECT @JobID = onJob FROM complaints WHERE complaintID = @complaintid
    SELECT @jobvalue = jobvalue FROM Jobs WHERE jobID = @JobID
    
    DECLARE @DeductionAmount INT
    SET @DeductionAmount = ((@jobvalue*15)/100)
    
    UPDATE Users SET walletmoney = walletmoney + @DeductionAmount  WHERE userID = @By
    UPDATE Users SET walletmoney = walletmoney - @DeductionAmount WHERE userID = @Against
    insert into MoneyTransfers (transfertime,amount,forjob,srcuser,dstuser) values
    (getdate(),@DeductionAmount,@JobID,@Against,@By)


END
GO

----------------------------------------------------------------------------------------------


CREATE PROCEDURE HandleComplaint_Reject
    @complaintid int
AS
BEGIN
    UPDATE Complaints
    SET status = 'R'
    WHERE complaintid = @complaintid;
END
GO


------------------------------------------------------------------------------------------------

Alter PROCEDURE ChangePassword
	@userID int,
	@newPassword VARCHAR(16)
AS
BEGIN
		UPDATE Users SET userpass = @newPassword WHERE userID = @userID
END
GO

------------------------------------------------------------------------------------------------
CREATE PROCEDURE getPassword
	@userID int
    AS
BEGIN
    SELECT userpass 
    FROM Users 
    WHERE userID = @userID 
END
GO
------------------------------------------------------------------------------------------------

CREATE PROCEDURE CheckUserIDExists
    @userID INT,
    @exists BIT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (SELECT 1 FROM Users WHERE userID = @userID)
        SET @exists = 1;
    ELSE
        SET @exists = 0;
END
GO

--------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------

alter PROCEDURE UploadDeliverable
    @jobID INT,
    @deliverable VARBINARY(MAX)
AS
BEGIN
    DECLARE @LancerID INT, @ClientID INT,@jobvalue INT ,@newAmount INT;
    select @ClientID = clientID,@LancerID = lancerID,@jobvalue = jobvalue from Jobs where jobID = @jobID  

    UPDATE Jobs SET deliverable = @deliverable, jobstatus = 'D' WHERE jobID = @jobID
    UPDATE Users SET jobsdone = jobsdone + 1,jobsongoing = jobsongoing - 1  WHERE userID =@LancerID
    UPDATE Users SET jobsdone = jobsdone + 1,jobsongoing = jobsongoing - 1  WHERE userID =@ClientID
    
    SET @newAmount = ((@jobvalue * 90)/100);

	INSERT INTO MoneyTransfers (transfertime,amount,forjob,srcuser,dstuser) values (getdate(),@newAmount,@jobID,1,@LancerID)
    UPDATE Users SET walletmoney = walletmoney + @newAmount  WHERE userID = @LancerID
    UPDATE Users SET walletmoney = walletmoney - @newAmount WHERE userID = 1
    
END
GO

alter procedure markproposal
@jobID INT,
@proposalID INT
AS
BEGIN
    DECLARE @ClientID INT,@LancerID INT;

    select @ClientID = clientID,@LancerID = lancerID from Jobs where jobID = @jobID  

	if exists(select * from Proposals where jobID = @jobID and proposalID = @proposalID)
	begin
		update Proposals set approvalstatus = 'A' where jobID = @jobID and proposalID = @proposalID
        update Jobs set jobstatus = 'O' where jobID = @jobID
        update Jobs set lancerID = (select lancerID from Proposals where jobID = @jobID and proposalID = @proposalID) where jobID = @jobID
        update Users SET jobsnotdone = jobsnotdone - 1 WHERE userID = @ClientID
        update Users SET jobsongoing = jobsongoing + 1 WHERE userID = @ClientID
        update Users SET jobsongoing = jobsongoing + 1 WHERE userID = @LancerID
	end
end
GO

alter PROCEDURE PostJob
    @clientID INT,
    @jobtitle VARCHAR(32),
    @jobtype VARCHAR(32),
    @jobvalue MONEY,
    @jobdetail TEXT,
    @duedate DATE,

    @_ret_val_			int					output
AS
BEGIN
    

      DECLARE @JobID int
  --  DECLARE @walletBalance MONEY;
  --  SELECT @walletBalance = amount FROM moneytransfers WHERE srcuser = @clientID;
  --  IF @jobvalue > @walletBalance
  --  BEGIN
  --      RAISERROR ('Insufficient balance in wallet. Please deposit sufficient funds to post the job.', 16, 1);
  --      RETURN;
  --  END

   

  --  DECLARE @commission MONEY;
  --  SET @commission = @jobvalue * 0.1;
  --  UPDATE MoneyTransfers SET amount = amount - @jobvalue - @commission WHERE srcuser = @clientID;

    
    INSERT INTO Jobs (clientID, jobtitle, jobtype, jobvalue, jobdetail, postdate, duedate, jobstatus)
    VALUES (@clientID, @jobtitle, @jobtype, @jobvalue, @jobdetail, GETDATE(), @duedate, 'T');

	SELECT TOP 1  @JobID = jobID FROM Jobs ORDER BY jobID DESC;

	INSERT INTO MoneyTransfers (transfertime,amount,forjob,srcuser,dstuser) values (getdate(),@jobvalue,@jobID,@clientID,1)
    UPDATE Users SET walletmoney = walletmoney - @jobvalue WHERE userID = @clientID
    UPDATE Users SET walletmoney = walletmoney + @jobvalue WHERE userID = 1
    UPDATE Users SET jobsnotdone = jobsnotdone + 1 WHERE userID = @clientID
    
END
GO