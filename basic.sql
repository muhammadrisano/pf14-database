-- untuk masuk ke database postges
psql -U postgres -p 5432 -h localhost
psql -U postgres

-- untuk melihat database yg ada / yg pernah dibuat
/l

-- untuk membuat database dengan query sql
-- syntax: CREATE DATABASE [nama_database]
CREATE DATABASE pf14;

-- untuk masuk/connect /pilih  database 
-- syntax : \c [nama_database]
\c pf14

-- untuk menghapus database menggunakan query sql
-- DROP DATABASE [nama_database]
DROP DATABASE helo;

-- untuk melihat tabel didalam database 
\d
    helo world
-- untuk membuat TABLE dengan query sql:
CREATE TABLE users(
    id INT,
    email VARCHAR(64),
    fullname VARCHAR(64),
    password VARCHAR(64),
    phone VARCHAR(16)
);

-- untuk melihat detail dari table yg sudah dibuat menggunakan
\d users

-- untuk hapus Table menggunakan query sql
DROP TABLE users;


-- UNTUK CRUD
-- create / insert / tambahkan data / masukan data ke TABLE
INSERT INTO users(id, email, fullname, password, phone) VALUES (1, 'risano@gmail.com', 'risano akbar', 'abcd1234','08123213');
INSERT INTO users(id, email, fullname, password, phone) VALUES (2, 'budi@gmail.com', 'budi tanjung', 'bcda4321','08123213');

-- Read (untuk melihat / mengambil data didalam table)
SELECT id, email, fullname, password, phone FROM users;
-- kalau semua
SELECT * FROM users;
SELECT email, fullname FROM users;

-- Update (untuk update record / data /column )
UPDATE users SET fullname = 'risano' WHERE id = 1;
UPDATE users SET phone = '089999', fullname='Budi tanjung putra', email='budiputra@gmail.com' WHERE id = 2;

-- Delete (untuk hapus data /record/ column)
DELETE FROM users WHERE id= 2;


