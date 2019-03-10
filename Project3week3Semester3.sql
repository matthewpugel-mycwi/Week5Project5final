-----------------------------------------------------------------------------------------------------------------------------------
		--Name					Date					Log


--		Matthew Pugel			3/8/2019			`Adding Inserts and updates to disk_inventory database
-----------------------------------------------------------------------------------------------------------------------------------
USE master
GO
IF DB_ID('disk_inventory') IS NOT NULL
	DROP DATABASE AP
GO
create database disk_inventory
go
use disk_inventory
go
create table genre
	(
	genre_id int not null primary key identity,
	description nvarchar(100) not null
	)
go
create table status
	(
	status_id int not null primary key identity,
	description nvarchar(100) not null
	)
go
create table disk_type
	(
	disk_type_id int not null primary key identity,
	description nvarchar(100) not null
	)
go
create table artist_type
	(
	artist_type_id int not null primary key identity,
	description nvarchar(100) not null
	)
go
create table borrower
	(
	borrower_id int not null primary key identity,
	fname nvarchar(100) not null,
	lname nvarchar(100) not null,
	phone_numb varchar(50) not null
	)
go
create table Artist
	(
	artist_id int not null primary key identity,
	fname nvarchar(100) not null,
	lname nvarchar(100) null,
	artist_type_id int not null references artist_type(artist_type_id)
	)
go
create table disk
	(
	disk_id int not null primary key identity,
	disk_name nvarchar(100) not null,
	releaseDate datetime not null,
	genre_id int not null references genre(genre_id),
	status_id int not null references status(status_id),
	disk_type_id int not null references disk_type(disk_type_id)
	)
go
create table diskHasBorrower
	(
	disk_id int not null references disk(disk_id),
	borrower_id int not null references borrower(borrower_id),
	borrowed_date datetime not null,
	returned_date datetime null,
	primary key (disk_id, borrower_id, borrowed_date)
	)
go
create table diskHasArtist
	(
	disk_id int not null references disk(disk_id),
	artist_id int not null references Artist(artist_id),
	primary key (disk_id, artist_id)
	)
go


use master
go
if SUSER_ID('diskUsermm') is not null
	drop login diskUsermm
go
create login diskUsermm with password = 'Pa$$w0rd',
	default_database = disk_inventory
go
use disk_inventory
go
if USER_ID('diskUsermm') is not null
	drop user diskUsermm
go
create user diskUsermm
go
alter role db_datareader add member diskUsermm
go

use disk_inventory
go

INSERT INTO [dbo].[artist_type]
           ([description])
     VALUES
           ('Solo') --1
		   ,('Group') --2
GO

INSERT INTO [dbo].[disk_type]
           ([description])
     VALUES
           ('CD') --1
		   ,('Vinyl') --2
		   , ('STrack') --3
		   ,('Cassette')--4
		   ,('DVD')--5
GO

INSERT INTO [dbo].[genre]
           ([description])
     VALUES
           ('Classic Rock') --1
		   ,('Country') --2
		   ,('Jazz') --3
		   ,('AltRock')--4
		   ,('Metal' ) --5
GO

INSERT INTO [dbo].[status]
           ([description])
     VALUES
           ('Available')--1
		   ,('On Loan')--2
		   ,('Damaged')--3
		   ,('Missing') --4
GO

INSERT INTO borrower
	VALUES
		('Mickey', 'Mouse', '1111111111'),
		( 'Nolan', 'Duck', '2222222222'),
		('Henny', 'Hen', '33333333333'),
		('Jenny', 'Jen', '4444444444'),
		('Benny', 'Boar', '5555555555'),
		('Senny', 'Seal', '6666666666'),
		('Winny', 'Win', '7777777777'),
		('Kenny', 'Ken', '8888888888'),
		('Lumpy', 'Lump', '9999999999'),
		('Flumpy', 'Flump', '1010101010'),
		('Skree', 'Mcgee', '111011101110'),
		('Harry', 'Barry', '1212121212'),
		('Scary', 'Terry', '1313131313'),
		('Greg', 'Dreg', '1414141414'),
		('Randal', 'Vandal', '1515151515'),
		('Sana', 'Hana', '1616161616'),
		('Jonny', 'He', '1717171717'),
		('Whisped', 'Cream', '1818181818'),
		('Jug', 'Head', '1919191919'),
		('Slug', 'Ma', '2020202020')
GO
delete borrower
where borrower_id = 20
go

INSERT INTO Artist
	VALUES
		('Ozzy', 'Osbourne', 1),
		('Willie', 'Nelson', 1),
		('Taylor', 'Swift', 1),
		('Garth', 'Brooks', 1),
		('Tom', 'Jones', 1),
		('Dragonforce', NULL, 2),
		('Men at Work', NULL, 2),
		('Smash Mouth', NULL, 2),
		('Micheal', 'Jackson', 1),
		('Maroon 5', NULL, 2),
		('Green Day', NULL, 2),
		('Foo Fighters', NULL, 2),
		('GunsNRoses', NULL, 2),
		('KISS', NULL, 2),
		('Queen', NULL, 2),
		('Frank', 'Sinatra', 1),
		('Brad', 'Paisley', 1),
		('Elvis', 'Presley', 1),
		('Johnny', 'Cash', 1),
		('David', 'Bowie', 1)
GO

INSERT INTO disk
	VALUES
	('Crazy Train', '9-1-1980', 1, 1, 1, 1), -- disk name, release date,  genre id(CR1, CTY2,Jazz3,AltRock4,Metal5), status id(Avail1,Loan2,Dmgd3,Miss4), disk type id(CD1, Vinyl2, Strack3,Cass4,DVD5), art type (solo1, group2)
	('Good Times', '10-14-1968', 2, 2, 2, 1),
	('Fearless', '11-11-2008', 4, 1, 1, 1),
	('No Fences', '7-27-1990', 2, 4, 3, 1),
	('Its Not Unusual', '7-27-1965', 1, 1, 1, 1),
	('Sonic Firestorm', '5-11-2004', 5, 1, 1, 2),
	('Cargo', '5-2-1983', 1, 1, 1, 2),
	('Astro Lounge', '6-8-1999', 4, 1, 1, 2),
	('Music & Me', '4-13-1973', 1, 1, 1, 1),
	('Songs About Jane', '6-25-2002', 4, 1, 1, 2),
	('Kerplunk', '12-17-1991', 4, 1, 1, 2),
	('The Colour and the Shape', '5-20-1997', 4, 1, 1, 2),
	('Appetite for Destruction', '7-21-1987', 1, 1, 1, 2),
	('Dressed to Kill', '3-19-1975', 1, 1, 3, 2),
	('Hot Space', '5-21-1982', 1, 1, 1, 2),
	('Come Fly with Me', '1-1-1958', 3, 1, 1, 2),
	('Who Needs Pictures', '6-1-1999', 1, 1, 2, 1),
	('Pot Luck', '6-5-1962', 1, 1, 1, 1),
	('Greatest', '1-12-1959', 1, 1, 1, 1),
	('Pin Ups', '10-19-1973', 1, 1, 1, 1)
GO
update disk 
set releaseDate = '5/1/1995'
where disk_name = 'Home'
go

INSERT INTO diskHasBorrower
	VALUES
		(2, 4, '1-2-2012', '2-20-2012'),
		(3, 5, '1-20-2012', '2-20-2012'),
		(3, 6, '1-29-2012', '2-20-2012'),
		(2, 7, '1-22-2012', '2-20-2012'),
		(5, 2, '1-1-2012', '2-20-2012'),
		(5, 7, '1-11-2012', '2-20-2012'),
		 (5, 8, '1-12-2012', '2-20-2012'),
		 (6, 3, '1-21-2012', '2-20-2012'),
		 (11, 14, '1-22-2012', NULL ), 
		 (12, 15, '1-25-2012', '2-20-2012'),
		 (13, 15, '1-24-2012', '2-20-2012'),
		 (14, 11, '1-23-2012', '2-20-2012'),
		 (15, 11, '1-22-2012', '2-20-2012'),
		 (15, 12, '1-12-2012', NULL),
		 (8, 8, '1-20-2012', '2-20-2012'),
		 (9, 4, '1-9-2012', '2-20-2012'),
		 (10, 9, '1-3-2012', '2-20-2012'),
		 (4, 3, '1-4-2012', '2-20-2012'),
		 (5, 7, '1-9-2012', '2-20-2012'),
		 (7, 4, '1-4-2012', NULL)
GO

INSERT INTO diskHasArtist
	VALUES
		( 1, 1),
		( 2, 10),
		( 3, 10),
		( 4, 10),
		( 5, 10),
		( 6, 10),
		( 7, 10),
		( 8, 12),
		( 9, 12),
		( 10, 12),
		( 11, 20),
		( 12, 20),
		( 13, 20),
		( 14, 20),
		( 15, 20),
		( 16, 20),
		( 17, 10),
		( 18, 10),
		( 19, 10),
		( 20, 10)
GO
select * from diskHasBorrower
where returned_date is null
go