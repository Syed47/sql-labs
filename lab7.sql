UPDATE cs130_lab7_property
SET listingdate = '2017-10-15'
WHERE date_part('year', listingdate) = 2017
AND date_part('month', listingdate) = 10
AND date_part('day', listingdate) IN (13,14); -- 191

UPDATE cs130_lab7_property 
SET askingprice = 100000
WHERE askingprice < 100000
AND askingprice > 95000; -- 58

DELETE FROM cs130_lab7_property
WHERE agent = 'Property Kings' 
AND housetype = 'Semi-detached'
AND energyrating IN ('C', 'D'); -- 45

DELETE FROM cs130_lab7_property
WHERE agent IS NULL
OR numbeds IS NULL; -- 128

UPDATE cs130_lab7_property
SET askingprice = askingprice - (askingprice * 8/100) 
WHERE agent = 'CS130 Estates'; -- 661

DELETE FROM cs130_lab7_property
WHERE char_length(address) > 20
AND address ~ '.*\d{4}.*Road$'; -- 8


-- PART 2 --
SELECT studentfirstname, studentgender, studentemail, studentcourse
FROM lab7_students
JOIN lab7_enrolledon 
ON lab7_students.studentid = lab7_enrolledon.studentid
WHERE moduleid = 'CS130'; -- 40

SELECT *
FROM lab7_students
JOIN lab7_enrolledon 
ON lab7_students.studentid = lab7_enrolledon.studentid
JOIN lab7_modules 
ON lab7_modules.moduleid = lab7_enrolledon.moduleid
WHERE studentgender = 'Female'; -- 348

SELECT * FROM lab7_students
JOIN lab7_enrolledon
ON lab7_students.studentid = lab7_enrolledon.studentid
WHERE lab7_students.studentemail SIMILAR TO '%2017@%'; -- 374

SELECT * FROM lab7_modules
JOIN lab7_enrolledon
ON lab7_modules.moduleid = lab7_enrolledon.moduleid
JOIN lab7_students
ON lab7_students.studentid = lab7_enrolledon.studentid
WHERE modulecredits >= 10 AND modulecredits <= 15
AND studentcourse ~ '.*(BSC|BA).*'; -- 217

DELETE FROM lab7_modules
WHERE moduleid = 'CS2800'; -- 34 + 1 so 35

UPDATE lab7_students SET studentid = 'SN0981775'
WHERE studentid = 'SN09817';
SELECT * FROM lab7_enrolledon WHERE studentid = 'SN0981775';
SELECT * FROM lab7_students WHERE studentid = 'SN0981775'; -- 14 + 1 so 15


-- NOT TESTED YET BUT CORRECT
SELECT studentfirstname, studentgender, studentemail, studentcourse
FROM lab7_students
JOIN lab7_enrolledon 
ON lab7_students.studentid = lab7_enrolledon.studentid
WHERE moduleid = 'CS123'; -- 41

-- SELECT * FROM lab7_students
-- JOIN lab7_enrolledon 
-- ON lab7_students.studentid = lab7_enrolledon.studentid
-- WHERE

SELECT * FROM lab7_enrolledon
WHERE moduleid IN (
    SELECT moduleid FROM lab7_modules
    WHERE modulesemester = 'Semester 1'
) AND studentid IN (
    SELECT studentid FROM lab7_students
    WHERE studentgender = 'Female'
); -- 158

SELECT * FROM lab7_enrolledon
WHERE moduleid IN (
    SELECT moduleid FROM lab7_modules
    WHERE modulecredits BETWEEN 10 AND 15
) AND studentid NOT IN (
    SELECT studentid FROM lab7_students
    WHERE studentcourse ~ '.*(BA|BSc).*'
); -- 254

