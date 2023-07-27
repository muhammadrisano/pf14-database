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


-- table product
CREATE TABLE products(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(64) NOT NULL,
    description TEXT,
    price INT DEFAULT 0,
    category_id INT,
    PRIMARY KEY (id) 
);


CREATE TABLE products(
    id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(64) NOT NULL,
    description TEXT,
    price INT DEFAULT 0,
    category_id INT,
    PRIMARY KEY (id),
    FOREIGN KEY(category_id) REFERENCES categories(id)
);

INSERT INTO products(name, description, price, category_id)VALUES('indomie ayam bawang', 'indemie ayam bawang bla bla', 3000, 1);
INSERT INTO products(name, description, price, category_id)VALUES('sabun detol cair', 'sabun detol cair bla bla', 8000, 3),('sabun bayi my boby', 'sabun bayi my boby bla bla', 18000, 3),('fanta', 'fanta botol bla bla', 4000, 2),('nutri sary', 'nutri sary bla bla', 1500, 2),('jasjus', 'jusjus bla bla', 1000, 2);


-- table category

CREATE TABLE categories(
     id INT GENERATED ALWAYS AS IDENTITY,
    name VARCHAR(64) NOT NULL,
    description TEXT,
    PRIMARY KEY (id)
);


INSERT INTO categories(name, description)VALUES('makanan', 'makanan bla bla'), ('minuman','minuman bla bla'),('kosmetik', 'kosmetik bla bla');

INSERT INTO categories(name, description)VALUES('makanan', 'makanan bla bla'), ('minuman','minuman bla bla'),('kosmetik', 'kosmetik bla bla');

-- JOIN TABLE
SELECT products.id, products.name, products.description, products.category_id, categories.name AS category_name, categories.description AS category_description FROM products JOIN categories ON products.category_id = categories.id;


-- latihan
-- menampilakn products yang harganya 4000
SELECT * FROM products WHERE price = 4000
-- menampilakn products yang categorinya minuman
SELECT * FROM products WHERE category_id = 2;

-- menampilakn products yang categorinya minuman dan harganya 4000
SELECT * FROM products WHERE category_id = 2 AND price = 4000;

-- menampilakn products yang categorinya minuman dan harganya kurang dari 4000
SELECT * FROM products WHERE category_id = 2 AND price < 4000;

-- untuk searching tulisan fanta
-- kurang tepat
SELECT * FROM products WHERE name = 'fan';

-- benar
SELECT * FROM products WHERE name like 'fan%';


-- untuk searcihng tanpa menhiraukan tuliasn hurug capital atau huruf kecil (ilike)
SELECT * FROM products WHERE name ilike '%TOL%';


-- sorting (ORDER BY -> asc / desc)

SELECT * FROM products ORDER BY price asc;
SELECT * FROM products ORDER BY price DESC;


-- Pagination -> limit dan offset

-- penggunaan limit -> untuk melimit data yg kita ambil
SELECT * FROM products LIMIT 5 
-- maka yg tampil hanya 5 products


-- offset
SELECT * FROM products offset 3;

-- rumus pagination
-- limit = 4
-- page 1

-- offsite = (page - 1) * limit

-- ketrangan
-- page 1 offset = 0

SELECT * FROM products LIMIT 4 OFFSET 0;
-- page 2 offset = 4
SELECT * FROM products LIMIT 4 OFFSET 4;
-- page 3 offset = 8
SELECT * FROM products LIMIT 4 OFFSET 8;
