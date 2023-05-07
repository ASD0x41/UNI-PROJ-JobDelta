
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
drop table Requests

create table feedback		-- complaints/feedback/requests for admins by clients/freelancers
(
	feedbackID		int				primary key		identity(1,1),
	sentby			int				foreign key		references Users (userID),
	UName		varchar(25),
	email		varchar(50),
	feedback	varchar(250)
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