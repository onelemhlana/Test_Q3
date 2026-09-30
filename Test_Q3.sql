-- ============================================================
-- Q.3.1.1  Fix the original statements and create the schema
-- ============================================================
-- Fixed: "CREATE SCHEMES" → "CREATE SCHEMA" (or DATABASE)
-- Fixed: schema name must not contain spaces; removed "and"
-- Fixed: USE statement must match the schema name exactly

CREATE SCHEMA vesselsandvoyages;
USE vesselsandvoyages;

CREATE TABLE ship (
    shipid      INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    imonumber   CHAR(11),
    name        VARCHAR(255)
);

-- ============================================================
-- Q.3.1.2  Make imonumber required (cannot alter the previous script)
-- ============================================================
ALTER TABLE ship
    MODIFY COLUMN imonumber CHAR(11) NOT NULL;

-- ============================================================
-- Q.3.2  Create Voyage table with foreign-key constraint
-- ============================================================
CREATE TABLE voyage (
    voyageid        INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    shipid          INT NOT NULL,
    departuredate   DATE NOT NULL,
    arrivaldate     DATE NOT NULL,
    CONSTRAINT fk_voyage_ship
        FOREIGN KEY (shipid) REFERENCES ship(shipid)
);

-- ============================================================
-- Q.3.3  Insert the required data
-- ============================================================
INSERT INTO ship (shipid, imonumber, name)
VALUES (1, 'IMO 1234567', 'Queen of the Seven Seas');

INSERT INTO voyage (voyageid, shipid, departuredate, arrivaldate)
VALUES (1, 1, '2023-01-01', '2023-02-25');

-- ============================================================
-- Q.3.4  Change arrival date of voyage 1
-- ============================================================
UPDATE voyage
SET arrivaldate = '2023-02-28'
WHERE voyageid = 1;