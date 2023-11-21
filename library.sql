  CREATE TABLE `publisher` (
        `publisher_id` serial PRIMARY KEY NOT NULL,
		`publisher_PublisherName` VARCHAR(100)  NOT NULL,
		`publisher_PublisherAddress` VARCHAR(200) NOT NULL,
		`publisher_PublisherPhone` VARCHAR(50) NOT NULL
);
 -- SELECT * FROM publisher

	 CREATE TABLE `book` (
		`book_id` INT PRIMARY KEY NOT NULL,
		`book_Title` VARCHAR(100) NOT NULL,
		`book_PublisherName` VARCHAR(100) NOT NULL,
       `publisher_id` serial NOT NULL,
        CONSTRAINT `publisher_id` FOREIGN KEY (`publisher_id`) REFERENCES publisher(`publisher_id`)
  	);


	CREATE TABLE `library_branch` (
		`library_branch_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		`library_branch_BranchName` VARCHAR(100) NOT NULL,
		`library_branch_BranchAddress` VARCHAR(200) NOT NULL
	);


	CREATE TABLE `borrower` (
        `borrower_id` serial PRIMARY KEY NOT NULL AUTO_INCREMENT,
		`borrower_CardNo` INT NOT NULL,
		`borrower_BorrowerName` VARCHAR(100) NOT NULL,
		`borrower_BorrowerAddress` VARCHAR(200) NOT NULL,
		`borrower_BorrowerPhone` VARCHAR(50) NOT NULL
	);



	CREATE TABLE `book_loans` (
		`book_loans_id` INT PRIMARY KEY NOT NULL,
		`book_loans_BookID` INT NOT NULL,
		`book_loans_BranchID` INT NOT NULL,
		`book_loans_CardNo` INT NOT NULL,
                `book_id` INT NOT NULL,
		`book_loans_DateOut` VARCHAR(50) NOT NULL,
		`book_loans_DueDate` VARCHAR(50) NOT NULL,
		`library_branch_id` INT NOT NULL ,
                `borrower_id` serial NOT NULL,
		CONSTRAINT `fk_book_id1` FOREIGN KEY(`book_id`) REFERENCES book(`book_id`),
		CONSTRAINT `fk_branch_id1` FOREIGN KEY (`library_branch_id`) REFERENCES library_branch(`library_branch_id`),
		CONSTRAINT `cardno` FOREIGN KEY(`borrower_id`) REFERENCES  borrower(`borrower_id`)
	);


	-- SELECT * FROM tbl_book_loans
		/* Use GETDATE() to retrieve the date values for Date out. Use DATEADD for the DueDate*/


	CREATE TABLE `book_copies` (
	        `book_copies_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		`book_copies_BookID` INT NOT NULL,
                `book_copies_No_Of_Copies` INT NOT NULL,
                `book_copies_BranchID` INT NOT NULL,
	        `book_id` INT NOT NULL ,
	        `library_branch_id` INT NOT NULL ,
        CONSTRAINT `fk_book_id2` FOREIGN KEY (`book_id`) REFERENCES book(`book_id`) ON UPDATE CASCADE ON DELETE CASCADE,
        CONSTRAINT `fk_branch_id2` FOREIGN KEY(`library_branch_id`) REFERENCES library_branch(`library_branch_id`) ON UPDATE CASCADE ON DELETE CASCADE
		
	);

	-- SELECT * FROM tbl_book_copies

	-- CREATE TABLE `book_authors` (
		`book_authors_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
		`book_authors_BookID` INT NOT NULL,
        	`book_authors_AuthorName` VARCHAR(50) NOT NULL,
            	`book_id` INT NOT NULL ,
        CONSTRAINT `fk_book_id3` FOREIGN KEY(`book_id`) REFERENCES book(`book_id`) 
        );

-- POPULATING THE TABLE

INSERT INTO publisher (publisher_id, publisher_PublisherName, publisher_PublisherAddress, publisher_PublisherPhone)
		VALUES
		('1', 'DAW Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('2', 'Viking','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('3', 'Signet Books','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('4','Chilton Books','Not Available','Not Available'),
		('5','George Allen & Unwin','83 Alexander Ln, Crows Nest NSW 2065, Australia','+61-2-8425-0100'),
		('6','Alfred A. Knopf','The Knopf Doubleday Group Domestic Rights, 1745 Broadway, New York, NY 10019','212-940-7390'),		
		('7','Bloomsbury','Bloomsbury Publishing Inc., 1385 Broadway, 5th Floor, New York, NY 10018', '212-419-5300'),
		('8','Shinchosa','Oga Bldg. 8, 2-5-4 Sarugaku-cho, Chiyoda-ku, Tokyo 101-0064 Japan','+81-3-5577-6507'),
		('9', 'Harper and Row','HarperCollins Publishers, 195 Broadway, New York, NY 10007','212-207-7000'),
		('10','Pan Books','175 Fifth Avenue, New York, NY 10010','646-307-5745'),
		('11','Chalto & Windus','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('12','Harcourt Brace Jovanovich','3 Park Ave, New York, NY 10016','212-420-5800'),
		('13', 'W.W. Norton',' W. W. Norton & Company, Inc., 500 Fifth Avenue, New York, New York 10110','212-354-5500'),
		('14', 'Scholastic','557 Broadway, New York, NY 10012','800-724-6527'),
		('15', 'Bantam','375 Hudson Street, New York, NY 10014','212-366-2000'),
		('16', 'Picador USA','175 Fifth Avenue, New York, NY 10010','646-307-5745');

-- UPDATING LINE4
-- UPDATE publisher
-- set publisher_publisherAddress = '324, Illinois Chicago Distrit'
-- WHERE publisher_id = 4
	
