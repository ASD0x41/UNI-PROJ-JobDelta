create table Reviews
(
	reviewID		int				primary key		identity(1,1),
	sentby			int				foreign key		references Users (userID),
	job				int				foreign key		references Jobs (jobID),
	UName			varchar(25),
	email			varchar(50),
	expectation		varchar(250),
	rating			int,
	satisfactory	varchar(250),
	communication	varchar(250),
	workease		varchar(250),
	recommend		varchar(250),
	additional		varchar(250)
);
go
drop table Reviews

-------------------------------------------
drop procedure Reviews_store

go
CREATE PROCEDURE Reviews_store

    @sentID int,
	@job	int,
    @Username varchar(20),
    @usemail  varchar(50),
    @urating   varchar(5),
    @expec varchar(250),
    @satisfac varchar(250),
    @communi varchar(250),
    @work varchar(250),
	@recom		varchar(250),
	@add		varchar(250),


    @_ret_val_			int					output
AS
BEGIN
        INSERT INTO Reviews (sentby, job, UName, email, expectation, rating, satisfactory, communication, workease, recommend, additional)
			
        VALUES  (@sentID,@job, @Username, @usemail, @expec, @urating, @satisfac, @communi, @work, @recom, @add)


        SET		@_ret_val_ = 0
END