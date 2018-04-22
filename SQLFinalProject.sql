IF OBJECT_ID('dbo.BookLoans', 'U') IS
NOT NULL
DROP TABLE dbo.BookLoans;

IF OBJECT_ID('dbo.Borrowers', 'U') IS
NOT NULL
DROP TABLE dbo.Borrowers;

IF OBJECT_ID('dbo.BookCopies', 'U') IS
NOT NULL
DROP TABLE dbo.BookCopies;

IF OBJECT_ID('dbo.LibraryBranch', 'U') IS
NOT NULL
DROP TABLE dbo.LibraryBranch;

IF OBJECT_ID('dbo.BookAuthors', 'U') IS
NOT NULL
DROP TABLE dbo.BookAuthors;

IF OBJECT_ID('dbo.Book', 'U') IS
NOT NULL
DROP TABLE dbo.Book;

IF OBJECT_ID('dbo.Publisher', 'U') IS
NOT NULL
DROP TABLE dbo.Publisher;

CREATE TABLE Publisher (
	Name VARCHAR(50) PRIMARY KEY NOT NULL,
	PublisherAddress VARCHAR(100) NOT NULL,
	Phone VARCHAR(100) NOT NULL
);

INSERT INTO Publisher
	(Name, PublisherAddress, Phone)
	VALUES
	('Picador', '175 5th Ave, New York, NY 10010', '800-221-7945'),
	('Doubleday', '1745 Broadway, New York, NY 10019', '212-782-9000'),
	('Little Brown & Company', '1290 6th Ave, New York, NY 10104', '212-3364-1100'),
	('Chapman & Hall', '2&4 Park Square, Milton Park, Abingdon, OX14 4RN', '0-20-7017-6000'),
	('Harvill Secker', '80 Strand, London, WC2R 0RL', '0-20-7139-3000'),
	('Charles Schribners Sons', 'P.O. Box 9187, Farmington Hills, MI 48333', '800-877-4253'),
	('Chatto & Windus', '20 Vauxhall Bridge Road, London SW1V 2SA', '0-20-7840-8563'),
	('Simon & Schuster', '1230 6th Ave, New York, NY 10020', '212-698-7000'),
	('William Heinemann', '61-63 Uxbridge Road, Ealing, London, W5 5SA', '0-20-8579-2652'),
	('Dell Publishing', '1745 Broadway, New York, NY 10019', '212-782-9000'),
	('Vintage Books', '1745 Broadway, New York, NY 10019', '212-572-2882'),
	('W.W. Norton & Company', '500 5th Ave #6, New York, NY 10110', '212-354-5500'),
	('Crown Publishing Group', '1745 Broadway, New York, NY 10019', '212-782-9000'),
	('Random House', '1745 Broadway, New York, NY 10019', '212-782-9000'),
	('Harper & Row', '195 Broadway, New York, NY 10007', '212-207-7000'),
	('Bantam Spectra', '375 Hudson Street, New York, NY 10014', '212-366-2000')
;
SELECT * FROM Publisher;

CREATE TABLE Book (
	Bookid VARCHAR(50) PRIMARY KEY NOT NULL,
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) FOREIGN KEY REFERENCES Publisher(Name)
);

INSERT INTO Book
	(Bookid, Title, PublisherName)
	VALUES
	('1', 'The Lost Tribe', 'Picador'),
	('2', 'Needful Things', 'Doubleday'),
	('3', 'It', 'Doubleday'),
	('4', 'Pet Cemetary', 'Doubleday'),
	('5', 'The Shining', 'Doubleday'),
	('6', 'The Catcher in the Rye', 'Little Brown & Company'),
	('7', 'Great Expectations', 'Chapman & Hall'),
	('8', 'Nineteen Eighty Four', 'Harvill Secker'),
	('9', 'The Great Gatsby', 'Charles Schribners Sons'),
	('10', 'The Adventures of Huckleberry Finn', 'Chatto & Windus'),
	('11', 'Catch-22', 'Simon & Schuster'),
	('12', 'A Clockwork Orange', 'William Heinemann'),
	('13', 'Slaughterhouse-5', 'Dell Publishing'),
	('14', 'American Psycho', 'Vintage Books'),
	('15', 'Fight Club', 'W.W. Norton & Company'),
	('16', 'World War Z', 'Crown Publishing Group'),
	('17', 'Thank You for Smoking', 'Random House'),
	('18', 'Choke', 'W.W. Norton & Company'), 
	('19', 'Where the Wild Things Are', 'Harper & Row'),
	('20', 'A Game of Thrones', 'Bantam Spectra')  
;
SELECT * FROM Book;

CREATE TABLE BookAuthors (
	Bookid VARCHAR(50) FOREIGN KEY REFERENCES Book(Bookid),
	AuthorName VARCHAR(50) NOT NULL
);

INSERT INTO BookAuthors
	(Bookid, AuthorName)
	VALUES
	('1', 'Mark Lee'),
	('2', 'Stephen King'),
	('3', 'Stephen King'),
	('4', 'Stephen King'),
	('5', 'Stephen King'),
	('6', 'J.D. Salinger'),
	('7', 'Charles Dickens'),
	('8', 'George Orwell'),
	('9', 'F.Scott Fitzgerald'),
	('10', 'Mark Twain'),
	('11', 'Anthony Burges'),
	('12', 'Joseph Heller'),
	('13', 'Kurt Vonnegut'),
	('14', 'Bret Easton Ellis'),
	('15', 'Chuck Palahniuk'),
	('16', 'Chuck Palahniuk'),
	('17', 'Max Brooks'),
	('18', 'Christopher Buckley'),
	('19', 'Maurice Sendak'),
	('20', 'George R.R. Martin')
;
SELECT * FROM BookAuthors;

CREATE TABLE LibraryBranch (
	Branchid VARCHAR(50) PRIMARY KEY NOT NULL,
	BranchName VARCHAR(50) NOT NULL,
	BranchAddress VARCHAR(75) NOT NULL
);

INSERT INTO LibraryBranch
	(Branchid, BranchName, BranchAddress)
	VALUES
	('1', 'Sharpstown', '7660 Clarewood Dr, Houston, TX 77036'),
	('2', 'Central', '801 SW 10th Ave, Portland, OR 97205'),
	('3', 'Driftwood', '801 SW Hwy 101 #201, Lincoln City, OR 97367'),
	('4', 'Gold Coast', '50 Railroad Ave, Glen Head, NY 11545')
;
SELECT * FROM LibraryBranch;

CREATE TABLE BookCopies (
	Bookid VARCHAR(50) FOREIGN KEY REFERENCES Book(Bookid),
	Branchid VARCHAR(50) FOREIGN KEY REFERENCES LibraryBranch(Branchid),
	No_of_Copies VARCHAR(100) NOT NULL
);

INSERT INTO BookCopies
	(Bookid, Branchid, No_of_Copies)
	VALUES
	('1', '1', '30'),
	('2', '1', '25'),
	('3', '1', '24'),
	('4', '1', '22'),
	('5', '1', '19'),
	('6', '1', '27'),
	('7', '1', '18'),
	('8', '1', '35'),
	('9', '1', '20'),
	('10', '1', '16'),
	('1', '2', '30'),
	('2', '2', '25'),
	('3', '2', '24'),
	('4', '2', '22'),
	('5', '2', '19'),
	('6', '2', '27'),
	('7', '2', '18'),
	('8', '2', '35'),
	('9', '2', '20'),
	('10', '2', '16'),
	('1', '3', '30'),
	('2', '3', '25'),
	('3', '3', '24'),
	('4', '3', '22'),
	('5', '3', '19'),
	('6', '3', '27'),
	('7', '3', '18'),
	('8', '3', '35'),
	('9', '3', '20'),
	('10', '3', '16'),
	('1', '4', '30'),
	('2', '4', '25'),
	('3', '4', '24'),
	('4', '4', '22'),
	('5', '4', '19'),
	('6', '4', '27'),
	('7', '4', '18'),
	('8', '4', '35'),
	('9', '4', '20'),
	('10', '4', '16')
;
SELECT * FROM BookCopies;


CREATE TABLE Borrowers (
	CardNo VARCHAR(50) PRIMARY KEY NOT NULL,
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(20) NOT NULL
);


INSERT INTO Borrowers
	(CardNo, Name, Address, Phone)
	VALUES
	('1', 'Charles Manson', 'Corcoran State Prison', '817-444-3214'),
	('2', 'Ted Bundy', 'Florida State Prison', '514-883-7298'),
	('3', 'Jeffrey Dahmer', 'Columbia Correctional Institution', '324-666-5719'),
	('4', 'Ed Gein', 'Mendota Mental Health Institute', '216-971-4426'),
	('5', 'John Wayne Gacy', 'Stateville Correctional Center', '555-292-7742'),
	('6', 'Aileen Wuornos', 'Florida State Prison', '366-909-8080'),
	('7', 'Tsutomu Miyazaki', 'Tokyo Detention House', '888-921-4500'),
	('8', 'Andrei Chikatilo', 'Novocherkassk Prison', '505-989-1121')
;
SELECT * FROM Borrowers;


CREATE TABLE BookLoans (
	Bookid VARCHAR(50) FOREIGN KEY REFERENCES Book(Bookid),
	Branchid VARCHAR(50) FOREIGN KEY REFERENCES LibraryBranch(Branchid),
	CardNo VARCHAR(50) FOREIGN KEY REFERENCES Borrowers(CardNo),
	DateOut VARCHAR(20) NOT NULL,
	DueDate VARCHAR(20) NOT NULL
);

INSERT INTO BookLoans
	(Bookid, Branchid, CardNo, DateOut, DueDate)
	VALUES
	('1', '1', '1', '01/12/2018', 'Today'),
	('2', '2', '2', '01/12/2018', '03/21/2018'),
	('3', '3', '3', '01/12/2018', '03/21/2018'),
	('4', '4', '4', '01/12/2018', '03/21/2018'),
	('5', '2', '5', '01/12/2018', '03/21/2018'),
	('6', '4', '5', '01/12/2018', '03/21/2018'),
	('7', '2', '7', '01/12/2018', '03/21/2018'),
	('8', '3', '7', '01/12/2018', '03/21/2018'),
	('8', '3', '7', '01/12/2018', '03/21/2018'),
	('9', '2', '5', '01/12/2018', '03/21/2018'),
	('10', '1', '5', '01/12/2018', 'Today'),
	('11', '1', '1', '01/12/2018', 'Today'),
	('12', '1', '7', '01/12/2018', 'Today'),
	('13', '1', '2', '01/12/2018', 'Today'),
	('14', '2', '4', '01/12/2018', '03/21/2018'),
	('15', '3', '7', '01/12/2018', '03/21/2018'),
	('16', '3', '3', '01/12/2018', '03/21/2018'),
	('17', '2', '2', '01/12/2018', '03/21/2018'),
	('18', '4', '7', '01/12/2018', '03/21/2018'),
	('19', '1', '5', '01/12/2018', '03/21/2018'),
	('20', '2', '5', '01/12/2018', '03/21/2018'),
	('1', '3', '3', 'In Stock', 'Not Due'),
	('2', '4', '2', 'In Stock', 'Not Due'),
	('3', '2', '1', 'In Stock', 'Not Due'),
	('4', '2', '5', 'In Stock', 'Not Due'),
	('5', '1', '4', 'In Stock', 'Not Due'),
	('6', '2', '5', 'In Stock', 'Not Due'),
	('7', '3', '3', 'In Stock', 'Not Due'),
	('8', '2', '7', 'In Stock', 'Not Due'),
	('9', '3', '7', 'In Stock', 'Not Due'),
	('10', '2', '1', 'In Stock', 'Not Due'),
	('11', '2', '2', 'In Stock', 'Not Due'),
	('12', '1', '4', 'In Stock', 'Not Due'),
	('13', '1', '3', 'In Stock', 'Not Due'),
	('14', '2', '7', 'In Stock', 'Not Due'),
	('15', '4', '5', 'In Stock', 'Not Due'),
	('16', '3', '5', 'In Stock', 'Not Due'),
	('17', '2', '7', 'In Stock', 'Not Due'),
	('18', '4', '3', 'In Stock', 'Not Due'),
	('19', '4', '2', 'In Stock', 'Not Due'),
	('20', '3', '1', 'In Stock', 'Not Due'),
	('1', '2', '5', '01/12/2018', '03/21/2018'),
	('2', '2', '5', '01/12/2018', '03/21/2018'),
	('3', '1', '3', '01/12/2018', '03/21/2018'),
	('4', '4', '4', '01/12/2018', '03/21/2018'),
	('5', '4', '5', '01/12/2018', '03/21/2018'),
	('6', '2', '2', '01/12/2018', '03/21/2018'),
	('7', '2', '4', '01/12/2018', '03/21/2018'),
	('8', '1', '7', '01/12/2018', '03/21/2018'),
	('9', '4', '5', '01/12/2018', '03/21/2018')
;
	
SELECT * FROM BookLoans;

/*USE db_books
GO
CREATE PROCEDURE dbo.uspQuery1

AS

SELECT No_of_Copies, Title, BranchName 
FROM BookCopies INNER JOIN Book ON Book.Bookid = BookCopies.Bookid INNER JOIN LibraryBranch ON LibraryBranch.Branchid = BookCopies.Branchid
WHERE Title = 'The Lost Tribe' AND BranchName = 'Sharpstown';
GO

USE db_books
GO
CREATE PROCEDURE dbo.uspQuery2

AS 

SELECT No_of_Copies, TITLE, BranchName
FROM BookCopies INNER JOIN Book ON Book.Bookid = BookCopies.Bookid INNER JOIN LibraryBranch ON LibraryBranch.Branchid = BookCopies.Branchid
WHERE Title = 'The Lost Tribe';
GO
 	
USE db_books
GO
CREATE PROCEDURE dbo.uspQuery3

AS

SELECT Name
FROM Borrowers
WHERE NOT EXISTS (SELECT * FROM BookLoans WHERE CardNo = Borrowers.CardNo); 
 

USE db_books
GO
CREATE PROCEDURE dbo.uspQuery4

AS
   
SELECT Title, Name, Address
FROM Borrowers, BookLoans, Book, LibraryBranch
WHERE BookLoans.DueDate = 'Today' AND BookLoans.CardNo = Borrowers.CardNo AND BookLoans.Bookid = Book.Bookid
AND LibraryBranch.BranchName = 'Sharpstown' AND LibraryBranch.Branchid = BookLoans.Branchid;



USE db_books
GO 
CREATE PROCEDURE dbo.uspQuery5

AS

SELECT BranchName, COUNT(*) 
FROM LibraryBranch, BookLoans
WHERE LibraryBranch.Branchid = BookLoans.Branchid    
GROUP BY BranchName;




USE db_books
GO
CREATE PROCEDURE dbo.uspQuery6

AS

SELECT Name, Address, COUNT(*)
FROM Borrowers, BookLoans
WHERE Borrowers.CardNo = BookLoans.CardNo
GROUP BY Borrowers.CardNo, Name, Address 
HAVING COUNT(*) > 5;



USE db_books
GO
CREATE PROCEDURE dbo.uspQuery7

AS

SELECT Title, No_of_Copies, BranchName
FROM Book 
FULL OUTER JOIN BookCopies ON Book.Bookid = BookCopies.Bookid
FULL OUTER JOIN LibraryBranch ON BookCopies.Branchid = LibraryBranch.Branchid
FULL OUTER JOIN BookAuthors ON Book.Bookid = BookAuthors.Bookid 
WHERE AuthorName = 'Stephen King' AND BranchName = 'Central';
*/
 
              	 