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

---