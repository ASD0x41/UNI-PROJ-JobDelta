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

insert into TestTable1 values (1, 'ABC')

drop database [H:\DBLP\JOBDELTA\APP_DATA\JOBDELTADB.MDF]