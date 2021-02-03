-- TASK 2
DROP TABLE IF EXISTS speedrecords;

-- TASK 1
CREATE TABLE speedrecords(
    id        SERIAL UNIQUE, 
    car_reg   VARCHAR(30) NOT NULL, 
    direction VARCHAR(30) NOT NULL, 
    occupants SMALLINT NOT NULL, 
    entrance  TIMESTAMP NOT NULL, 
    exit      TIMESTAMP NOT NULL
);

INSERT INTO speedrecords(car_reg, direction, occupants, entrance, exit) 
VALUES ('171-KE-2098','Eastbound',3,'2017-01-01 15:15:30','2017-01-01 15:17:50');

INSERT INTO speedrecords(car_reg, direction, occupants, entrance, exit) 
VALUES ('161-CD-987','Westbound',1,'2017-02-13 04:30:20','2017-02-13 04:31:40');

INSERT INTO speedrecords(car_reg, direction, occupants, entrance, exit) 
VALUES ('J19-CS130','Eastbound',4,'2017-05-31 18:00:00','2017-05-31 18:02:40');

INSERT INTO speedrecords(car_reg, direction, occupants, entrance, exit) 
VALUES ('12-WD-1767','Westbound',2,'2017-06-07 07:40:10','2017-06-07 07:41:50');

-- TASK 3
INSERT INTO speedrecords(car_reg, direction, occupants, entrance, exit) 
VALUES ('12-WD-1767','Eastbound',2,'2017-06-07 14:59:00','2017-06-07 15:00:50');

-- TASK 4
TRUNCATE speedrecords;

-- TASK 5
DELETE FROM speedrecords;

-- TASK 6
DELETE FROM speedrecords WHERE car_reg = '171-KE-2098';
INSERT INTO speedrecords(car_reg, direction, occupants, entrance, exit) 
VALUES ('171-KE-2980','Eastbound',3,'2017-01-01 15:15:30','2017-01-01 15:17:50');

-- TASK 7
ALTER TABLE speedrecords add COLUMN Speeding VARCHAR(30);
UPDATE speedrecords SET Speeding = NULL;

-- TASK 8
INSERT INTO speedrecords(car_reg, direction, occupants, entrance, exit) 
VALUES ('161-KE-1234','Eastbound',2,'2020-11-09 15:25:50','2020-11-09 15:28:50');
INSERT INTO speedrecords(car_reg, direction, occupants, entrance, exit) 
VALUES ('171-D-9988','Eastbound',2,'2020-11-09 15:26:50','2020-11-09 15:29:50');
INSERT INTO speedrecords(car_reg, direction, occupants, entrance, exit) 
VALUES ('161-KE-1234','Westbound',2,'2020-11-09 17:25:50','2020-11-09 17:28:20');
INSERT INTO speedrecords(car_reg, direction, occupants, entrance, exit) 
VALUES ('171-D-9988','Westbound',2,'2020-11-09 17:26:50','2020-11-09 17:29:20');

-- TASK 9
INSERT INTO speedrecords(car_reg, direction, occupants, entrance, exit, Speeding) 
VALUES ('XXX-XX-0000','Westbound',1,'2020-11-09 17:26:50','2020-11-09 17:29:20', '60Km/h');

UPDATE speedrecords SET speeding = CONCAT(CAST(FLOOR((2/(
    (date_part('hour', exit)) +
    (date_part('minute', exit)/60) + 
    (date_part('second', exit)/(60 * 60)) - (
    (date_part('hour', entrance)) + 
    (date_part('minute', entrance)/60) + 
    (date_part('second', entrance)/(60 * 60)) 
)))) AS text), 'Km/hr');

SELECT * FROM speedrecords WHERE (2/(
    (date_part('hour', exit)) +
    (date_part('minute', exit)/60) + 
    (date_part('second', exit)/(60 * 60)) - (
    (date_part('hour', entrance)) + 
    (date_part('minute', entrance)/60) + 
    (date_part('second', entrance)/(60 * 60)) 
))) <= 60;


