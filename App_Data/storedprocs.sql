

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








EXECUTE UpdateUserAboutById
@UserId = 6,
@aboutuser = "Hi there! My name is First_Freelancer and I am a freelance graphic designer with over 5 years of experience."
GO









CREATE VIEW MyJobs
AS
    SELECT jobtitle, jobtype, jobvalue, jobdetail, postdate, duedate, jobstatus, deliverable FROM Jobs
GO





































----no change here so didnt copy

alter PROCEDURE PostJob
    @clientID INT,
    @jobtitle VARCHAR(32),
    @jobtype VARCHAR(32),
    @jobvalue MONEY,
    @jobdetail TEXT,
    @duedate DATE,

    
AS
BEGIN
    

    
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
    
    
END
go

select* from Jobs
select* from Users

DECLARE @retVal INT
EXEC PostJob 
    @clientID = 3,
    @jobtitle = 'Job Title',
    @jobtype = 'Data',
    @jobvalue = 100.00,
    @jobdetail = 'Example Job Details',
    @_ret_val_ = @retVal OUTPUT

SELECT @retVal
go



DECLARE @jobID INT = 16
DECLARE @UserID INT = 6
DECLARE @return_val INT

EXEC CheckIfUserHasApplied @jobID, @UserID, @return_val OUTPUT

SELECT @return_val



DECLARE @proposalID INT
DECLARE @proposaldetail VARCHAR(1000)
DECLARE @approvalstatus VARCHAR(32)
DECLARE @applydate DATE

EXEC getProposal
    @jobID = 16,
    @lancerID = 6,
    @proposalID = @proposalID OUTPUT,
    @proposaldetail = @proposaldetail OUTPUT,
    @approvalstatus = @approvalstatus OUTPUT,
    @applydate = @applydate OUTPUT

SELECT @proposalID AS ProposalID, @proposaldetail AS ProposalDetail, @approvalstatus AS ApprovalStatus, @applydate AS ApplyDate




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

go
------------already got it from previous file
alter PROCEDURE ViewPostedJobs
	@clientId INT
AS
BEGIN
	SELECT jobID, jobtitle, jobtype, jobvalue, jobdetail, postdate, duedate, jobstatus
	FROM Jobs
	WHERE clientID = @clientId;
END
go








EXEC UploadDeliverable @jobID = 14, @deliverable = 0x54686973206973206120746573742064656c6976657261626c652e





select* from jobs

GO


create procedure ViewOngoingJobs
@lancerID INT
as
begin
	select jobID, jobtitle, jobdetail, jobtype, jobvalue,jobstatus ,duedate from Jobs where lancerID = @lancerID
end
GO



create procedure getProposals
@jobID INT
as
begin
	select proposalID,lancerID,proposaldetail,approvalstatus,applydate from Proposals where jobID = @jobID
end
GO

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
GO









DECLARE @jobTitle VARCHAR(32),
        @jobType VARCHAR(32),
        @jobValue MONEY,
        @jobDetail NVARCHAR(1000),
        @postDate DATE,
        @dueDate DATE,
        @jobID INT = 17-- Replace with the desired jobID value

EXEC ViewPostedJobs_F 
    @jobID = @jobID,
    @jobTitle = @jobTitle OUTPUT,
    @jobType = @jobType OUTPUT,
    @jobValue = @jobValue OUTPUT,
    @jobDetail = @jobDetail OUTPUT,
    @postDate = @postDate OUTPUT,
    @dueDate = @dueDate OUTPUT

SELECT @jobTitle AS JobTitle,
       @jobType AS JobType,
       @jobValue AS JobValue,
       @jobDetail AS JobDetail,
       @postDate AS PostDate,
       @dueDate AS DueDate
select* from Jobs








Declare @lancerID int = 3
Declare @jobID int = 17
Declare @proposalDetail nvarchar(1000) = 'I am a good fit for this job2'
EXEC submitProposal @lancerID, @jobID,@proposalDetail;

select* from Proposals
go





----------/////////////////////////////////////////////////
-----there are some issues here--------------------------(there should be deliverydate as well but for now i am using duedate)




------------------incomplete (rating column's confusing me)-------------- 


--incomplete

--CREATE PROCEDURE logout_user (IN user_id INT)
--BEGIN
--   UPDATE users SET is_logged_in = 0 WHERE id = user_id;
--END


--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
drop procedure Feedback_store

go

-----already exists 
create table feedback		-- complaints/feedback/requests for admins by clients/freelancers
(
	feedbackID		int				primary key		identity(1,1),
	sentby			int				foreign key		references Users (userID),
	UName		varchar(25),
	email		varchar(50),
	feedback	varchar(250),
    rating      varchar(50)
);
go

create table Complain		-- complaints/feedback/requests for admins by clients/freelancers
(
	ComplainID		int				primary key		identity(1,1),
	sentby			int				foreign key		references Users (userID),
	improve		varchar(250),
	complain	varchar(250),
	suggestion	varchar(250)
);
go

drop table feedback
drop table Complain



select* from Jobs
select* from Users