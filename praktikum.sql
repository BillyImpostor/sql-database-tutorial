/* PERTEMUAN 1 */
---
mysql -u root -p
EXIT;
---

---
DROP TABLE nama_tabel;
---


/* PERTEMUAN 2 */
---
CREATE DATABASE akademik;
SHOW DATABASES;
USE akademik;
---

---
CREATE TABLE IF NOT EXISTS mahasiswa (
NIM INT NOT NULL AUTO_INCREMENT,
nama VARCHAR(255) NOT NULL,
jenis_kelamin VARCHAR(1) NOT NULL,
tempat_lahir VARCHAR(255) NOT NULL,
tanggal_lahir DATE NOT NULL,
telepon INT,
DPA VARCHAR(255),
PRIMARY KEY (NIM)
);

CREATE TABLE IF NOT EXISTS lecturers (
NIP INT NOT NULL AUTO_INCREMENT,
nama VARCHAR(255) NOT NULL,
jenis_kelamin VARCHAR(1) NOT NULL,
jabatan VARCHAR(255),
minat VARCHAR(255),
telepon INT,
PRIMARY KEY (NIP)
);

CREATE TABLE IF NOT EXISTS mata_kuliah (
kode_mata_kuliah INT NOT NULL AUTO_INCREMENT,
nama_mata_kuliah VARCHAR(255) NOT NULL,
SKS INT NOT NULL,
dosen_pengampu VARCHAR(255) NOT NULL,
hari VARCHAR(255),
jam VARCHAR(5),
ruang_kelas INT,
PRIMARY KEY (kode_mata_kuliah)
);

CREATE TABLE IF NOT EXISTS KRS (
ID_KRS INT NOT NULL AUTO_INCREMENT,
kode_mata_kuliah INT NOT NULL,
NIM INT NOT NULL,
tahun VARCHAR(4) NOT NULL,
semester INT NOT NULL,
nilai VARCHAR(3),
PRIMARY KEY (ID_KRS)
);
---

---
ALTER TABLE lecturers
DROP NIP;

ALTER TABLE lecturers
MODIFY NIP INT NOT NULL;

ALTER TABLE lecturers
DROP PRIMARY KEY;
---

---
ALTER TABLE lecturers
ADD COLUMN NIP INT;

ALTER TABLE lecturers
MODIFY NIP INT NOT NULL AUTO_INCREMENT,
ADD PRIMARY KEY (NIP);
---

---
RENAME TABLE lecturers TO profesor;

ALTER TABLE profesor
CHANGE nama nama_prof VARCHAR(255);

ALTER TABLE mahasiswa
CHANGE telepon telepon INT;

ALTER TABLE profesor
CHANGE telepon telepon INT;

DESCRIBE akademik;
---

/* PERTEMUAN 3 */
---
CREATE DATABASE IF NOT EXISTS PVFC;
USE PVFC;
---

---
CREATE TABLE IF NOT EXISTS Customer (
customerID VARCHAR(5) NOT NULL,
customerName VARCHAR(255) NOT NULL,
city VARCHAR(100),
PRIMARY KEY (customerID)
);

CREATE TABLE IF NOT EXISTS Product (
productID VARCHAR(5) NOT NULL,
productName VARCHAR(255) NOT NULL,
unitPrice DECIMAL(10,2) DEFAULT 100.00,
PRIMARY KEY (productID)
);

CREATE TABLE IF NOT EXISTS Orders (
orderID VARCHAR(5) NOT NULL,
orderDate DATE,
customerID VARCHAR(5),
PRIMARY KEY (orderID)
);
---

---
INSERT INTO Customer (customerID, customerName, city)
VALUES
('C-003', 'Arc Hardware', 'Yogyakarta'),
('C-008', 'Wowie Carpenter', 'Solo'),
('C-009', 'Ikeout', 'Jakarta'),
('C-011', 'Sawit Furniture', 'Aceh');

INSERT INTO Product (productID, productName, unitPrice)
VALUES
('P-100', 'Dining Table', 800.00),
('P-120', 'Coffee Table', 250.00),
('P-123', 'Writers Desk', 325.00),
('P-125', 'Bookshelf', 650.00);

INSERT INTO Orders (orderID, orderDate, customerID)
VALUES
('O-001', '2007-04-20', 'C-011'),
('O-002', '2020-01-10', 'C-003'),
('O-003', '2020-08-07', 'C-009'),
('O-004', '2020-09-09', 'C-007');
---

---
SELECT DISTINCT city FROM Customer;
SELECT * FROM Customer;
SELECT productName, unitPrice FROM Product;
SELECT customerName FROM Customer WHERE city = 'Solo';
SELECT orderDate FROM Orders WHERE customerID = 'C-007';

UPDATE Customer
SET
customerName = 'Wowok Carpenter',
city = 'Jakarta'
WHERE customerID = 'C-008';

INSERT INTO Product (productID, productName)
VALUES ('P-130', 'Stool');

INSERT INTO Orders (orderID, orderDate, customerID)
VALUES
('O-005', CURRENT_DATE(), 'C-003'),
('O-006', CURRENT_DATE(), 'C-011');

DELETE FROM Orders ORDER BY orderID LIMIT 2;
---

/* PERTEMUAN 4 */
---
CREATE DATABASE asprak;
SHOW DATABASES;
USE asprak;
---

---
CREATE TABLE mahasiswa (
NIU INT NOT NULL AUTO_INCREMENT,
Name VARCHAR(255),
City VARCHAR(255),
Age INT,
GPA DECIMAL(2,1),
Department VARCHAR(255),
PRIMARY KEY (NIU)
);

ALTER TABLE mahasiswa AUTO_INCREMENT = 12345;
DESCRIBE mahasiswa;
---

---
INSERT INTO mahasiswa (Name, City, Age, GPA, Department)
VALUES
('Adi', 'Jakarta', 17, 2.5, 'Math'),
('Ani', 'Yogyakarta', 20, 2.1, 'Math'),
('Ari', 'Surabaya', 18, 2.5, 'Computer'),
('Ali', 'Banjarmasin', 20, 3.5, 'Computer'),
('Abi', 'Medan', 17, 3.7, 'Computer'),
('Budi', 'Jakarta', 19, 3.8, 'Computer'),
('Boni', 'Yogyakarta', 20, 3.2, 'Computer'),
('Bobi', 'Surabaya', 17, 2.7, 'Computer'),
('Beni', 'Banjarmasin', 18, 2.3, 'Computer'),
('Cepi', 'Jakarta', 20, 2.2, NULL),
('Coni', 'Yogyakarta', 22, 2.6, NULL),
('Ceki', 'Surabaya', 21, 2.5, 'Math'),
('Dodi', 'Jakarta', 20, 3.1, 'Math'),
('Didi', 'Yogyakarta', 19, 3.2, 'Physics'),
('Deri', 'Surabaya', 19, 3.3, 'Physics'),
('Eli', 'Jakarta', 20, 2.9, 'Physics'),
('Endah', 'Yogyakarta', 18, 2.8, 'Physics'),
('Feni', 'Jakarta', 17, 2.7, NULL),
('Farah', 'Yogyakarta', 18, 3.5, NULL),
('Fendi', 'Surabaya', 19, 3.4, NULL);

SELECT * FROM mahasiswa;
---

---
SELECT DISTINCT City
FROM mahasiswa;

SELECT Name
FROM mahasiswa
WHERE Department = 'Computer';

SELECT NIU, Name, Age, City
FROM mahasiswa
ORDER BY Age DESC;

SELECT Name, Age
FROM mahasiswa
WHERE City = 'Jakarta'
ORDER BY Age LIMIT 3;

SELECT Name, GPA
FROM mahasiswa
WHERE City = 'Jakarta' AND GPA < 2.5;

SELECT Name, Age, City
FROM mahasiswa
WHERE City = 'Yogyakarta' OR Age > 20;

SELECT Name, City
FROM mahasiswa
WHERE City NOT IN ('Jakarta', 'Surabaya');

SELECT Name, Age, GPA
FROM mahasiswa
WHERE GPA BETWEEN 2.5 AND 3.5;

SELECT Name
FROM mahasiswa
WHERE Name LIKE '%a%';

SELECT NIU
FROM mahasiswa
WHERE Department IS NULL;
---

/* PERTEMUAN 5 */
---
USE asprak;
DESCRIBE mahasiswa;
---

---
SELECT MAX(GPA), City
FROM mahasiswa
WHERE City = 'Jakarta';

SELECT MIN(GPA), Department
FROM mahasiswa
WHERE Department = 'Computer';

SELECT COUNT(Department)
FROM mahasiswa
WHERE Department = 'Computer';

SELECT AVG(GPA), Department
FROM mahasiswa
WHERE Department = 'Math';

SELECT Department, COUNT(*)
FROM mahasiswa
GROUP BY Department;

SELECT City, COUNT(*)
FROM mahasiswa
GROUP BY City;

SELECT City, COUNT(City)
FROM mahasiswa
WHERE Age < 20
GROUP BY City;
---

/* PERTEMUAN 6 */
---
CREATE DATABASE office;
USE office;
---

---
CREATE TABLE IF NOT EXISTS jobs (
     jobID INT AUTO_INCREMENT,
     jobTitle VARCHAR(50) NOT NULL,
     basicSalary DECIMAL(15, 2) NOT NULL,
     PRIMARY KEY (jobID)
);

INSERT INTO jobs (jobTitle, basicSalary) VALUES
    ('Producer', 20000.00),
    ('Director', 15000.00),
    ('Writer', 10000.00),
    ('Actor', 9000.00),
    ('Fans', 0.00),
    ('Executive Producer', 22500.00),
    ('Stunt Organizer', 7500.00),
    ('VFX Artist', 7500.00),
    ('Stuntman', 6000.00);
---

---
CREATE TABLE IF NOT EXISTS employees (
     employeeID INT AUTO_INCREMENT,
     lastName VARCHAR(50) NOT NULL,
     firstName VARCHAR(50) NOT NULL,
     email VARCHAR(100) NOT NULL, 
     reportsTo INT,
     jobID INT, 
     salary DECIMAL(15, 2),
     PRIMARY KEY (employeeID),
     FOREIGN KEY (jobID) REFERENCES jobs(jobID),
     FOREIGN KEY (reportsTo) REFERENCES employees(employeeID)
);

INSERT INTO employees (lastName, firstName, email, reportsTo, jobID, salary) VALUES
    ('Carter', 'John', 'carterj@mail.co', NULL, 1, 21500.00),
    ('Travolta', 'John', 'travj@mail.co', NULL, 2, 19000.00),
    ('Carter', 'Peggy', 'carterp@mail.co', NULL, 3, 10000.00),
    ('Connor', 'John', 'connj@mail.co', NULL, 2, 16000.00),
    ('Johnson', 'Rian', 'jrian@mail.co', NULL, 4, 15000.00),
    ('Rogers', 'Steve', 'cap@mail.co', 3, 2, 17500.00),
    ('Evans', 'Chris', 'evanc@mail.co', 3, 1, 25000.00),
    ('Pratt', 'Chris', 'prc@mail.co', 1, 5, 100.00),
    ('Hemsworth', 'Chris', 'lebowski@mail.co', 2, 3, 12000.00),
    ('Hemsworth', 'Liam', 'hliam@mail.co', NULL, 4, 9500.00),
    ('Feige', 'Kevin', 'kfeige@mail.co', NULL, 6, 27000.00),
    ('Miller', 'George', 'travj@mail.co', NULL, NULL, NULL);
---

---
CREATE DATABASE library;
USE library;
---

---
CREATE TABLE IF NOT EXISTS Books (
     bookID INT AUTO_INCREMENT,
     bookTitle VARCHAR(100) NOT NULL,
     authorName VARCHAR(100) NOT NULL,
     borrowedStatus VARCHAR(100) NOT NULL,
     PRIMARY KEY (bookID)
);

INSERT INTO Books (bookTitle, authorName, borrowedStatus) VALUES
    ('The Great Gatsby', 'F. Scott Fitzgerald', 'Available'),
    ('To Kill a Mockingbird', 'Harper Lee', 'Borrowed'),
    ('1984', 'George Orwell', 'Available'),
    ('Pride and Prejudice', 'Jane Austen', 'Borrowed'),
    ('The Catcher in the Rye', 'J.D. Salinger', 'Available'),
    ('The Lord of the Rings', 'J.R.R. Tolkien', 'Available'),
    ('The Hobbit', 'J.R.R. Tolkien', 'Borrowed'),
    ('Moby Duck', 'Herman Melville', 'Available'),
    ('War and Peace', 'Leo Tolstoy', 'Available'),
    ('The Odyssey', 'Homer', 'Borrowed');
---

---
CREATE TABLE IF NOT EXISTS User (
     userID INT AUTO_INCREMENT,
     userName VARCHAR(100) NOT NULL,
     numberOfBorrowing INT NOT NULL,
     numberOfReturning INT NOT NULL,
     PRIMARY KEY (userID)
);

INSERT INTO User (userName, numberOfBorrowing, numberOfReturning) VALUES
    ('Alice', 3, 2),
    ('Bob', 5, 5),
    ('Charlie', 2, 1),
    ('David', 4, 3),
    ('Eve', 1, 0),
    ('Frank', 6, 6),
    ('Grace', 0, 0),
    ('Heidi', 3, 3),
    ('Ivan', 2, 2),
    ('Judy', 4, 4);
---

---
CREATE TABLE IF NOT EXISTS Flow (
     flowID INT AUTO_INCREMENT, 
     userIDBorrowing INT NOT NULL,
     bookIDBorrowed INT NOT NULL, 
     borrowDate DATE NOT NULL,
     returnDate DATE NOT NULL,
     PRIMARY KEY (flowID),
     FOREIGN KEY (userIDBorrowing) REFERENCES User(userID),
     FOREIGN KEY (bookIDBorrowed) REFERENCES Books(bookID)
);

INSERT INTO Flow (userIDBorrowing, bookIDBorrowed, borrowDate, returnDate) VALUES
    (1, 2, '2026-03-01', '2026-03-15'),
    (2, 4, '2026-03-05', '2026-03-20'),
    (3, 7, '2026-03-10', '2026-03-25'),
    (4, 10, '2026-03-15', '2026-03-30'),
    (5, 4, '2026-03-20', '2026-04-04'),
    (6, 2, '2026-03-25', '2026-04-09'),
    (7, 7, '2026-03-30', '2026-04-14'),
    (8, 4, '2026-04-04', '2026-04-19'),
    (9, 10, '2026-04-09', '2026-04-24'),
    (10, 10, '2026-04-14', '2026-04-29');
---

---
SELECT Books.bookTitle
FROM Books
JOIN Flow ON Books.bookID = Flow.bookIDBorrowed
WHERE Books.borrowedStatus = 'Borrowed'
AND Flow.borrowDate = DATE_SUB(CURDATE(), INTERVAL 1 DAY);

SELECT Books.bookTitle, Flow.userIDBorrowing
FROM Books
LEFT JOIN Flow ON Books.bookID = Flow.bookIDBorrowed
AND Books.borrowedStatus = 'Borrowed';

SELECT Books.bookTitle, User.userName 
FROM Books
LEFT JOIN Flow ON Books.bookID = Flow.userIDBorrowing
LEFT JOIN User ON Flow.userIDBorrowing = User.userID
UNION
SELECT Books.bookTitle, User.userName 
FROM Books
RIGHT JOIN Flow ON Books.bookID = Flow.userIDBorrowing
RIGHT JOIN User ON Flow.userIDBorrowing = User.userID;

SELECT Books.bookTitle, User.userName
FROM Books
JOIN Flow ON Books.bookID = Flow.bookIDBorrowed
JOIN User ON Flow.userIDBorrowing = User.userID
WHERE Books.borrowedStatus = 'Borrowed'
AND User.numberOfBorrowing > 3;
---

/* PERTEMUAN 7 */
---
SELECT bookTitle
FROM Books
WHERE borrowedStatus = 'Borrowed' AND bookID IN (
    SELECT bookIDBorrowed
    FROM Flow
    WHERE borrowDate = DATE_SUB(CURDATE(), INTERVAL 8 DAY)
  );
---

---
SELECT Books.bookTitle, Flow.userIDBorrowing
FROM Books
JOIN Flow ON Books.bookID = Flow.bookIDBorrowed
AND Books.borrowedStatus = 'Borrowed';

SELECT B.bookTitle, F.userIDBorrowing
FROM Books B, (SELECT userIDBorrowing, bookIDBorrowed FROM Flow) AS F
WHERE B.bookID = F.bookIDBorrowed AND B.borrowedStatus = 'Borrowed';
---

---
SELECT Flow.userIDBorrowing, Books.bookTitle
FROM Books
JOIN Flow ON Flow.bookIDBorrowed = Books.bookID
AND Books.borrowedStatus = 'Borrowed';

SELECT  F.userIDBorrowing, B.bookTitle
FROM Books B, (SELECT userIDBorrowing, bookIDBorrowed FROM Flow) AS F
WHERE F.bookIDBorrowed = B.bookID AND B.borrowedStatus = 'Borrowed';
---

---
SELECT B.bookTitle, U.userName
FROM Books B, (SELECT userIDBorrowing, bookIDBorrowed FROM Flow) AS F, User U
WHERE F.bookIDBorrowed = B.bookID AND F.userIDBorrowing = U.userID
AND B.borrowedStatus = 'Borrowed'
AND U.numberOfBorrowing > 3;
---

/* PERTEMUAN 8 */
---

---