-- Active: 1681339289096@@127.0.0.1@3306

-- Práticas

CREATE TABLE
    users(
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL
    );

SELECT * FROM users;

CREATE TABLE
    phones(
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        phone_number TEXT UNIQUE NOT NULL,
        user_id TEXT NOT NULL,
        Foreign Key (user_id) REFERENCES users(id)
    );

SELECT * FROM phones;

INSERT INTO users
VALUES (
        "U001",
        "fulano",
        "fulano@email",
        "fulano123"
    ), (
        "U002",
        "cilcano",
        "ciclano@email",
        "ciclano123"
    );

INSERT INTO phones
VALUES ("P001", "9987456321", "U001"), ("P002", "1234567895", "U002"), ("P003", "5661789234", "U002");

SELECT * FROM users INNER JOIN phones ON phones.user_id = users.id;

-- ON(onde - partindo da) minha foreignkey = primarykey

SELECT
    users.name,
    phones.phone_number
FROM users
    INNER JOIN phones ON phones.user_id = users.id
    WHERE users.name LIKE "%ci%"    
;

CREATE TABLE
    licenses (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        register_number TEXT UNIQUE NOT NULL,
        category TEXT NOT NULL
    );

SELECT * FROM licenses;

CREATE TABLE
    drives (
        id TEXT PRIMARY KEY UNIQUE NOT NULL,
        name TEXT NOT NULL,
        email TEXT UNIQUE NOT NULL,
        password TEXT NOT NULL,
        license_id TEXT UNIQUE NOT NULL,
        FOREIGN KEY (license_id) REFERENCES licenses(id)
    );

SELECT * from drives;

INSERT INTO licenses
VALUES ("L001", "11111", "B"), ("L002", "22222", "A"), ("L003", "33333", "AB");

INSERT INTO drives
VALUES 
("1", "nome1", "email1", "senha1", "L002"),
("2", "nome2", "email2", "senha2", "L001"), 
("3", "nome3", "email3", "senha3", "L003"); 


SELECT * FROM licenses 
INNER JOIN drives 
ON drives.license_id = licenses.id ;

SELECT * FROM drives
INNER JOIN licenses 
ON licenses.id = license_id;

SELECT drives.name, licenses.register_number, licenses.category
FROM drives
INNER JOIN licenses 
ON drives.license_id = licenses.id;

