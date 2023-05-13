

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