#!/bin/sh

export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib
sqlplus64 "d98kim/04096715@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(Host=oracle.scs.ryerson.ca)(Port=1521))(CONNECT_DATA=(SID=orcl)))" <<EOF

CREATE TABLE member(
	LibCard NUMBER(10) CHECK (LENGTH(LibCard) = 10),
	Email VARCHAR2(50) NOT NULL,
	Phone VARCHAR2(12) CHECK (LENGTH(Phone) = 12) NOT NULL,
	Name VARCHAR2(50) NOT NULL,
	Street VARCHAR2(50) NOT NULL,
	Province CHAR(2) NOT NULL,
	City VARCHAR2(28) NOT NULL,
	PostalCode VARCHAR2(7) CHECK (LENGTH(PostalCode) = 7) NOT NULL,
	PRIMARY KEY(LibCard)
);

CREATE TABLE supplier(
	SName VARCHAR2(50),
	Phone VARCHAR2(12) NOT NULL,
	PRIMARY KEY(SName)
);

CREATE TABLE book(
	Isbn VARCHAR2(14) CHECK (LENGTH(Isbn) = 14),
	Title VARCHAR2(50) NOT NULL,
	Author VARCHAR2(50) NOT NULL,
	Genre VARCHAR(25) NOT NULL,
	PRIMARY KEY(Isbn)
);

CREATE TABLE movie(
	Eidr VARCHAR2(34),
	Title VARCHAR2(50) NOT NULL,
	Director VARCHAR2(50) NOT NULL,
	Genre VARCHAR(25) NOT NULL,
	PRIMARY KEY(Eidr)
);

CREATE TABLE bcopy(
	Isbn VARCHAR2(14),
	CopyNum VARCHAR2(3),
	PRIMARY KEY(Isbn, CopyNum),
	FOREIGN KEY(Isbn) REFERENCES book(Isbn)
);

CREATE TABLE mcopy(
	Eidr VARCHAR2(34),
	CopyNum VARCHAR2(3),
	PRIMARY KEY(Eidr, CopyNum),
	FOREIGN KEY(Eidr) REFERENCES movie(Eidr)
);

CREATE TABLE bborrow(
	LibCard NUMBER(10),
	Isbn VARCHAR2(14),
	CopyNum VARCHAR2(3),
	DueDate DATE NOT NULL,
	ReturnDate DATE,
	PRIMARY KEY(LibCard, Isbn, CopyNum),
	FOREIGN KEY(LibCard) REFERENCES member(LibCard),
	FOREIGN KEY(Isbn, CopyNum) REFERENCES bcopy(Isbn, CopyNum)
);

CREATE TABLE mborrow(
	LibCard NUMBER(10),
	Eidr VARCHAR2(34),
	CopyNum VARCHAR2(3),
	DueDate DATE NOT NULL,
	ReturnDate DATE,
	PRIMARY KEY(LibCard, Eidr, CopyNum),
	FOREIGN KEY(LibCard) REFERENCES member(LibCard),
	FOREIGN KEY(Eidr, CopyNum) REFERENCES mcopy(Eidr, CopyNum)
);

CREATE TABLE bhold(
	LibCard NUMBER(10),
	Isbn VARCHAR2(14),
	PlaceNum VARCHAR2(3) NOT NULL,
	HoldDate Date NOT NULL,
	PRIMARY KEY(LibCard, Isbn),
	FOREIGN KEY(LibCard) REFERENCES member(LibCard),
	FOREIGN KEY(Isbn) REFERENCES book(Isbn)
);

CREATE TABLE mhold(
	LibCard NUMBER(10),
	Eidr VARCHAR2(34),
	PlaceNum VARCHAR2(3) NOT NULL,
	HoldDate DATE NOT NULL,
	PRIMARY KEY(LibCard, Eidr),
	FOREIGN KEY(LibCard) REFERENCES member(LibCard),
	FOREIGN KEY(Eidr) REFERENCES movie(Eidr)
);

CREATE TABLE bsupply(
	SName VARCHAR2(50),
	Isbn VARCHAR2(14),
	Quantity NUMBER(3) CHECK (Quantity BETWEEN 1 AND 100) NOT NULL,
	Shipped NUMBER(1) NOT NULL,
	PRIMARY KEY(SName, Isbn),
	FOREIGN KEY(SName) REFERENCES supplier(SName),
	FOREIGN KEY(Isbn) REFERENCES book(Isbn)
);

CREATE TABLE msupply(
	SName VARCHAR2(50),
	Eidr VARCHAR2(34),
	Quantity NUMBER(3) CHECK (Quantity BETWEEN 1 AND 100) NOT NULL,
	Shipped NUMBER(1) NOT NULL,
	PRIMARY KEY(SName, Eidr),
	FOREIGN KEY(SName) REFERENCES supplier(SName),
	FOREIGN KEY(Eidr) REFERENCES movie(Eidr)
);
exit;
EOF
