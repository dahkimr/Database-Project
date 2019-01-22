#!/bin/sh
export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "d98kim/04096715@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

/* POPULATING TABLES */
/* Entries for member */
INSERT INTO member (LibCard,Email,Phone,Name,Street,Province,City,PostalCode)
VALUES (1843174372, 'laura_alex32@gmail.com', '647-285-5511', 'Laura Alexander', '500 Kingston Rd', 'ON', 'Toronto', 'M4L 1V3');
INSERT INTO member (LibCard,Email,Phone,Name,Street,Province,City,PostalCode)
VALUES (5743830293, 'charlesMitch22@gmail.com', '647-093-7281','Charles Mitchell', '288 Placeholder Drive', 'ON', 'Toronto', 'M5M 1W4');
INSERT INTO member (LibCard,Email,Phone,Name,Street,Province,City,PostalCode)
VALUES (4721227627, 'jcampbell@gmail.com', '647-895-2482','Jean Campbell', '234 Willow Ave', 'ON', 'Toronto', 'M4E 3K7');
INSERT INTO member (LibCard,Email,Phone,Name,Street,Province,City,PostalCode)
VALUES (6200927500, 'ant_lee59@gmail.com', '416-699-8071','Anthony Lee', '26 Goodwood Park Cres', 'ON', 'East York', 'M4C 2G5');
INSERT INTO member (LibCard,Email,Phone,Name,Street,Province,City,PostalCode)
VALUES (8325076254, 'alperez@hotmail.com', '416-060-7895','Albert Perez', '1974 Queen St E', 'ON', 'Toronto', 'M4V 272');
INSERT INTO member (LibCard,Email,Phone,Name,Street,Province,City,PostalCode)
VALUES (2689960182, 'martinman@hotmail.com', '416-905-9459','Martin Kelly', '42 Balsam Ave', 'ON', 'Toronto', 'M4L 1H8');
INSERT INTO member (LibCard,Email,Phone,Name,Street,Province,City,PostalCode)
VALUES (2020763382, 'susan_allen94@hotmail.com', '416-590-9890','Susan Allen', '258 Waverley Rd', 'ON', 'Toronto', 'M4E 3B4');
INSERT INTO member (LibCard,Email,Phone,Name,Street,Province,City,PostalCode)
VALUES (3094648686, 'gloriaglory@yahoo.com', '416-184-9400','Gloria Martinez', '101 Hillingdon Ave', 'ON', 'Toronto', 'M4L 3TL');
INSERT INTO member (LibCard,Email,Phone,Name,Street,Province,City,PostalCode)
VALUES (9197832769, 'dennis_stew12@yahoo.com', '905-195-3161','Dennis Stewart', '4205 Shipp Dr', 'ON', 'Mississauga', 'L4Z 2Y9');
INSERT INTO member (LibCard,Email,Phone,Name,Street,Province,City,PostalCode)
VALUES (4315697185, 'jturner03@gmail.com', '905-686-9860','Joseph Turner', '3897 Seebring Cres', 'ON', 'Mississauga', 'L5L 3X8');
INSERT INTO member (LibCard,Email,Phone,Name,Street,Province,City,PostalCode)
VALUES (1843174371, 'john.doe@gmail.com', '647-555-4345', 'John Doe', '12 Fake Street', 'ON', 'London', 'N5V 2S5' );

/* Entries for book */
INSERT INTO book (Isbn, Title, Author, Genre)
VALUES ('978-0345339706', 'The Lord of the Rings: The Fellowship of the Ring', 'J.R.R. Tolkien', 'Fantasy');
INSERT INTO book (Isbn, Title, Author, Genre)
VALUES ('978-0345339713', 'The Lord of the Rings: The Two Towers', 'J.R.R. Tolkien', 'Fantasy');
INSERT INTO book (Isbn, Title, Author, Genre)
VALUES ('978-0345339737', 'The Lord of the Rings: The Return of the King', 'J.R.R. Tolkien', 'Fantasy');
INSERT INTO book (Isbn, Title, Author, Genre)
VALUES ('978-0849945120', 'Thr3e', 'Ted Dekker', 'Thriller');
INSERT INTO book (Isbn, Title, Author, Genre)
VALUES ('978-0060935467', 'To Kill a Mockingbird', 'Harper Lee', 'Southern Gothic');

/* Entries for bcopy */
INSERT INTO bcopy (Isbn, CopyNum)
VALUES ('978-0345339706', 1);
INSERT INTO bcopy (Isbn, CopyNum)
VALUES ('978-0345339706', 2);
INSERT INTO bcopy (Isbn, CopyNum)
VALUES ('978-0345339713', 1);
INSERT INTO bcopy (Isbn, CopyNum)
VALUES ('978-0345339713', 2);
INSERT INTO bcopy (Isbn, CopyNum)
VALUES ('978-0345339713', 3);
INSERT INTO bcopy (Isbn, CopyNum)
VALUES ('978-0345339737', 1);
INSERT INTO bcopy (Isbn, CopyNum)
VALUES ('978-0849945120', 1);
INSERT INTO bcopy (Isbn, CopyNum)
VALUES ('978-0849945120', 2);
INSERT INTO bcopy (Isbn, CopyNum)
VALUES ('978-0849945120', 3);
INSERT INTO bcopy (Isbn, CopyNum)
VALUES ('978-0060935467', 1);
INSERT INTO bcopy (Isbn, CopyNum)
VALUES ('978-0060935467', 2);

/* Entries for bborrow */
INSERT INTO bborrow (LibCard, Isbn, CopyNum, DueDate, ReturnDate)
VALUES (1843174372, '978-0345339706', 1, TO_DATE('3-Jan-2019','yyy/mm/dd hh24:mi:ss'), NULL);
INSERT INTO bborrow (LibCard, Isbn, CopyNum, DueDate, ReturnDate)
VALUES (1843174372, '978-0849945120', 1, TO_DATE('3-Jan-2019','yyy/mm/dd hh24:mi:ss'), NULL);
INSERT INTO bborrow (LibCard, Isbn, CopyNum, DueDate, ReturnDate)
VALUES (1843174372, '978-0060935467', 1, TO_DATE('3-Jan-2019','yyy/mm/dd hh24:mi:ss'), NULL);
INSERT INTO bborrow (LibCard, Isbn, CopyNum, DueDate, ReturnDate)
VALUES (5743830293, '978-0345339706', 2, TO_DATE('1-Jan-2019','yyy/mm/dd hh24:mi:ss'), NULL);
INSERT INTO bborrow (LibCard, Isbn, CopyNum, DueDate, ReturnDate)
VALUES (4721227627, '978-0345339713', 1, TO_DATE('2-Jan-2019','yyy/mm/dd hh24:mi:ss'), NULL);
INSERT INTO bborrow (LibCard, Isbn, CopyNum, DueDate, ReturnDate)
VALUES (6200927500, '978-0345339713', 2, TO_DATE('5-Jan-2019','yyy/mm/dd hh24:mi:ss'), NULL);
INSERT INTO bborrow (LibCard, Isbn, CopyNum, DueDate, ReturnDate)
VALUES (8325076254, '978-0345339713', 3, TO_DATE('19-Jan-2019','yyy/mm/dd hh24:mi:ss'), NULL);

/* Entries for supplier */
/* Book suppliers */
INSERT INTO supplier (SName,Phone)
VALUES ('Henderson Press',18775556269);
INSERT INTO supplier (SName,Phone)
VALUES ('Kingfisher Publications',18775557654);
INSERT INTO supplier (SName,Phone)
VALUES ('Pygmy Press',18775553745);
/* Movie suppliers */
INSERT INTO supplier (SName,Phone)
VALUES ('Bouchard Corporation',18775559289);
INSERT INTO supplier (SName,Phone)
VALUES ('Roux '||chr(38)||' Martin',18775554637);
INSERT INTO supplier (SName,Phone)
VALUES ('Cormorant Group',18775554323);

/* Entries for movie */
INSERT INTO movie(Eidr,Title,Director,Genre)
VALUES ('10.5240/B6D3-D1ED-71C0-3A43-3243-8', 'Angel''s Egg', 'Mamoru Oshii', 'Avant-garde');
INSERT INTO movie(Eidr,Title,Director,Genre)
VALUES ('10.5240/102A-940C-175A-E086-85A5-R', 'Primer', 'Shane Carruth', 'Science Fiction');
INSERT INTO movie(Eidr,Title,Director,Genre)
VALUES ('10.5240/29D8-1A67-BB8F-1109-1353-5', 'Oldboy', 'Park Chan-wook', 'Neo-noir');
INSERT INTO movie(Eidr,Title,Director,Genre)
VALUES ('10.5240/9AA7-751E-97E3-8E0C-3104-8', 'Cube', 'Vincenzo Natali', 'Horror');
INSERT INTO movie(Eidr,Title,Director,Genre)
VALUES ('10.5240/2CD5-A900-F1EA-13D5-BDEE-A', 'Stalker', 'Andrei Tarkovsky', 'Science Fiction');
INSERT INTO movie(Eidr,Title,Director,Genre)
VALUES ('10.5240/D3EF-4473-263B-DBFF-67A0-1', 'The Sky Crawlers', 'Mamoru Oshii', 'Science Fiction');

/* Entries for mcopy */
INSERT INTO mcopy(Eidr,CopyNum)
VALUES ('10.5240/B6D3-D1ED-71C0-3A43-3243-8',1);
INSERT INTO mcopy(Eidr,CopyNum)
VALUES ('10.5240/B6D3-D1ED-71C0-3A43-3243-8',2);

INSERT INTO mcopy(Eidr,CopyNum)
VALUES ('10.5240/102A-940C-175A-E086-85A5-R',1);
INSERT INTO mcopy(Eidr,CopyNum)
VALUES ('10.5240/102A-940C-175A-E086-85A5-R',2);
INSERT INTO mcopy(Eidr,CopyNum)
VALUES ('10.5240/102A-940C-175A-E086-85A5-R',3);

INSERT INTO mcopy(Eidr,CopyNum)
VALUES ('10.5240/29D8-1A67-BB8F-1109-1353-5',1);
INSERT INTO mcopy(Eidr,CopyNum)
VALUES ('10.5240/29D8-1A67-BB8F-1109-1353-5',2);

INSERT INTO mcopy(Eidr,CopyNum)
VALUES ('10.5240/9AA7-751E-97E3-8E0C-3104-8',1);
INSERT INTO mcopy(Eidr,CopyNum)
VALUES ('10.5240/9AA7-751E-97E3-8E0C-3104-8',2);

INSERT INTO mcopy(Eidr,CopyNum)
VALUES ('10.5240/2CD5-A900-F1EA-13D5-BDEE-A',1);

INSERT INTO mcopy(Eidr,CopyNum)
VALUES ('10.5240/D3EF-4473-263B-DBFF-67A0-1',1);
INSERT INTO mcopy(Eidr,CopyNum)
VALUES ('10.5240/D3EF-4473-263B-DBFF-67A0-1',2);
INSERT INTO mcopy(Eidr,CopyNum)
VALUES ('10.5240/D3EF-4473-263B-DBFF-67A0-1',3);

/* Entries for mborrow */
INSERT INTO mborrow (LibCard, Eidr, CopyNum, DueDate, ReturnDate)
VALUES (2020763382, '10.5240/B6D3-D1ED-71C0-3A43-3243-8', 1, TO_DATE('2-Jan-2019','yyy/mm/dd hh24:mi:ss'), NULL);
INSERT INTO mborrow (LibCard, Eidr, CopyNum, DueDate, ReturnDate)
VALUES (2020763382, '10.5240/9AA7-751E-97E3-8E0C-3104-8', 1, TO_DATE('2-Jan-2019','yyy/mm/dd hh24:mi:ss'), NULL);
INSERT INTO mborrow (LibCard, Eidr, CopyNum, DueDate, ReturnDate)
VALUES (2020763382, '10.5240/2CD5-A900-F1EA-13D5-BDEE-A', 1, TO_DATE('2-Jan-2019','yyy/mm/dd hh24:mi:ss'), NULL);
INSERT INTO mborrow (LibCard, Eidr, CopyNum, DueDate, ReturnDate)
VALUES (3094648686, '10.5240/B6D3-D1ED-71C0-3A43-3243-8', 2, TO_DATE('20-Jan-2019','yyy/mm/dd hh24:mi:ss'), NULL);
INSERT INTO mborrow (LibCard, Eidr, CopyNum, DueDate, ReturnDate)
VALUES (9197832769, '10.5240/D3EF-4473-263B-DBFF-67A0-1', 1, TO_DATE('23-Jan-2019','yyy/mm/dd hh24:mi:ss'), NULL);
INSERT INTO mborrow (LibCard, Eidr, CopyNum, DueDate, ReturnDate)
VALUES (4315697185, '10.5240/D3EF-4473-263B-DBFF-67A0-1', 2, TO_DATE('1-Jan-2019','yyy/mm/dd hh24:mi:ss'), NULL);
INSERT INTO mborrow (LibCard, Eidr, CopyNum, DueDate, ReturnDate)
VALUES (1843174371, '10.5240/D3EF-4473-263B-DBFF-67A0-1', 3, TO_DATE('3-Jan-2019','yyy/mm/dd hh24:mi:ss'), NULL);

/* Entries for msupply */

INSERT INTO msupply(SName,Eidr,Quantity,Shipped)
VALUES ('Roux '||chr(38)||' Martin', '10.5240/2CD5-A900-F1EA-13D5-BDEE-A', 2, 0);
INSERT INTO msupply(SName,Eidr,Quantity,Shipped)
VALUES ('Roux '||chr(38)||' Martin', '10.5240/29D8-1A67-BB8F-1109-1353-5', 1, 1);

INSERT INTO msupply(SName,Eidr,Quantity,Shipped)
VALUES ('Cormorant Group', '10.5240/29D8-1A67-BB8F-1109-1353-5', 1, 1);
INSERT INTO msupply(SName,Eidr,Quantity,Shipped)
VALUES ('Cormorant Group', '10.5240/9AA7-751E-97E3-8E0C-3104-8', 2, 0);

INSERT INTO msupply(SName,Eidr,Quantity,Shipped)
VALUES ('Bouchard Corporation', '10.5240/102A-940C-175A-E086-85A5-R', 1, 0);
INSERT INTO msupply(SName,Eidr,Quantity,Shipped)
VALUES ('Bouchard Corporation', '10.5240/B6D3-D1ED-71C0-3A43-3243-8', 2, 0);
INSERT INTO msupply(SName,Eidr,Quantity,Shipped)
VALUES ('Bouchard Corporation', '10.5240/9AA7-751E-97E3-8E0C-3104-8', 1, 0);

/* Entries for bsupply */
INSERT INTO bsupply(SName,Isbn,Quantity,Shipped)
VALUES ('Henderson Press', '978-0345339706', 2, 1);
INSERT INTO bsupply(SName,Isbn,Quantity,Shipped)
VALUES ('Henderson Press', '978-0345339713', 3, 1);
INSERT INTO bsupply(SName,Isbn,Quantity,Shipped)
VALUES ('Henderson Press', '978-0345339737', 1, 1);
INSERT INTO bsupply(SName,Isbn,Quantity,Shipped)
VALUES ('Kingfisher Publications', '978-0849945120', 3, 1);
INSERT INTO bsupply(SName,Isbn,Quantity,Shipped)
VALUES ('Pygmy Press', '978-0060935467', 2, 1);

/* Entries for bhold */
INSERT INTO bhold(LibCard, Isbn, PlaceNum, HoldDate)
VALUES (3094648686, '978-0345339706', 1, TO_DATE('29-Dec-2019','yyy/mm/dd hh24:mi:ss'));
INSERT INTO bhold(LibCard, Isbn, PlaceNum, HoldDate)
VALUES (3094648686, '978-0345339713', 1, TO_DATE('29-Dec-2019','yyy/mm/dd hh24:mi:ss'));
INSERT INTO bhold(LibCard, Isbn, PlaceNum, HoldDate)
VALUES (1843174371, '978-0345339706', 2, TO_DATE('30-Dec-2019','yyy/mm/dd hh24:mi:ss'));

/* Entries for mhold */
INSERT INTO mhold(LibCard, Eidr, PlaceNum, HoldDate)
VALUES (1843174372, '10.5240/D3EF-4473-263B-DBFF-67A0-1', 1, TO_DATE('28-Dec-2019','yyy/mm/dd hh24:mi:ss'));
INSERT INTO mhold(LibCard, Eidr, PlaceNum, HoldDate)
VALUES (1843174372, '10.5240/B6D3-D1ED-71C0-3A43-3243-8', 1, TO_DATE('28-Dec-2019','yyy/mm/dd hh24:mi:ss'));
INSERT INTO mhold(LibCard, Eidr, PlaceNum, HoldDate)
VALUES (5743830293, '10.5240/D3EF-4473-263B-DBFF-67A0-1', 2, TO_DATE('31-Dec-2019','yyy/mm/dd hh24:mi:ss'));
exit;
EOF
