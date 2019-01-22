#!/bin/sh
export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "d98kim/04096715@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

/* Member who live in toronto */
SELECT * 
FROM member
WHERE City = 'Toronto';

/* Books written by J.R.R. Tolkien */
SELECT Title As Book_Title, Author
FROM book
WHERE Author = 'J.R.R. Tolkien';

/* Book copies with isbn 978-0849945120 (Thr3e) */
SELECT * 
FROM bcopy
WHERE ISBN = '978-0849945120';

/* Books borrowed by LibCard 1843174372 (Laura) */
SELECT LibCard, Title, CopyNum, DueDate 
FROM book, bborrow
WHERE LibCard = 1843174372
AND bborrow.Isbn = book.Isbn;

/* Movies by Shane Carruth */
SELECT Title As Movie_Title, Director
FROM movie
WHERE Director = 'Shane Carruth';

/* Get suppliers who are still shipping the movie Cube and their phone number(s)*/
SELECT msupply.SName, Eidr, Phone, Shipped
FROM msupply, supplier
WHERE msupply.SName = supplier.SName
AND Eidr = '10.5240/9AA7-751E-97E3-8E0C-3104-8'
AND Shipped = 0;

/* Get all copies of science fiction movies */
SELECT Title As Movie_Title, CopyNum, Genre
FROM movie, mcopy
WHERE Genre = 'Science Fiction'
  AND movie.Eidr = mcopy.Eidr;

/* Get all suppliers who have shipped their movies */
SELECT SName As Supplier_Name, Shipped
FROM msupply
WHERE Shipped = 1;

/* Movies borrowed by Library Card 2020763382 (Susan) */
SELECT LibCard, Title, CopyNum, DueDate 
FROM movie, mborrow
WHERE LibCard = 2020763382
AND movie.Eidr = mborrow.Eidr;

/* What did Henderson Press supply? */
SELECT Sname, Title, Author, Quantity 
FROM bsupply, book
WHERE Sname = 'Henderson Press'
  AND Shipped = 1
  AND bsupply.Isbn = book.Isbn;

/* What does the person with LibCard 3094648686 have holds on? */
SELECT Name, Title, PlaceNum, HoldDate
FROM bhold, book, member
WHERE bhold.LibCard = 3094648686
  AND bhold.Isbn = book.Isbn
  AND bhold.LibCard = member.LibCard;

/* Who has holds on The Sky Crawlers 10.5240/D3EF-4473-263B-DBFF-67A0-1 */
SELECT mhold.LibCard, Name
FROM mhold, member
WHERE mhold.LibCard = member.LibCard
  AND Eidr = '10.5240/D3EF-4473-263B-DBFF-67A0-1';

/* Group - Get all the members borrowing To Kill a Mockingbird grouped by city */
SELECT City, Name
FROM member, bborrow
WHERE member.LibCard = bborrow.LibCard
	AND Isbn = '978-0345339706'
	GROUP BY City,Name;

/* Set - List the suppliers who have more than two books in supply */
SELECT SName
FROM supplier
WHERE EXISTS
(SELECT Isbn
	FROM bsupply
	WHERE bsupply.SName = supplier.SName
	AND Quantity > 2); 

/* Join - Get the names and phone numbers of all members who are borrowing Lord of the Rings: The Fellowship of the Ring */
SELECT Phone, Name
FROM member m, bborrow b
WHERE m.LibCard = b.LibCard 
AND Isbn = '978-0345339706';


/* Like - list all authors starting with J */
SELECT Author, Title
FROM book
WHERE Author LIKE 'J%'

/* Aggregate - List number of members */
SELECT 'Number of members is ', Count(LibCard)
FROM member;
exit;
EOF
