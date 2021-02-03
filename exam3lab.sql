-- 19719431

UPDATE labexam3_dentist SET healthstatus = 'good' 
WHERE patientid IN (SELECT patientid FROM labexam3_dentist  WHERE healthstatus IS NULL );

DELETE FROM labexam3_dentist WHERE patientid IN (
    SELECT patientid FROM labexam3_dentist
    WHERE healthstatus IS NULL 
    OR totalvisits IS NULL
);

UPDATE labexam3_dentist SET nextappointment = '2017-04-01' WHERE patientid IN (
    SELECT patientid FROM labexam3_dentist
    WHERE date_part('day', nextappointment) = 29 AND
    date_part('month', nextappointment) = 3 AND
    date_part('year', nextappointment) = 2017
);

UPDATE labexam3_dentist 
SET totalvisits = totalvisits + 1
WHERE patientid IN (
    SELECT patientid FROM labexam3_dentist
    WHERE date_part('day', nextappointment) = 1 AND
    date_part('month', nextappointment) = 2 AND
    date_part('year', nextappointment) = 2017
);

DELETE FROM labexam3_dentist WHERE patientid IN (
    SELECT patientid FROM labexam3_dentist
    WHERE (date_part('year', nextappointment) - date_part('year', patientdob)) <= 20
);

DELETE FROM labexam3_dentist WHERE patientid IN (
    SELECT patientid FROM labexam3_dentist
    WHERE ppsnumber ~* '.*(1|3|5|7|9){6}.*' 
    OR nextappointment IS NULL
);

DELETE FROM labexam3_visited
WHERE bbid IN (
    SELECT bbid FROM labexam3_people WHERE gender = 'Female' AND status = 'Professional'
) AND statekey IN (
    SELECT statekey FROM labexam3_cities WHERE population > 1000000
);


DELETE FROM labexam3_visited
WHERE bbid IN (
    SELECT bbid FROM labexam3_people WHERE gender = 'Male'
) AND statekey IN (
    SELECT statekey FROM labexam3_cities WHERE state = 'CA'
);

DELETE FROM labexam3_visited
WHERE bbid IN (
    SELECT bbid FROM labexam3_people WHERE status = 'Tourist'
) AND statekey IN (
    SELECT statekey FROM labexam3_cities WHERE name IN ('Spokane', 'El Paso', 'Henderson', 'Wichita')
);

SELECT * FROM labexam3_visited, labexam3_cities, labexam3_people
WHERE gender = 'Female' ORDER BY elev_in_m DESC;


DELETE FROM FROM labexam3_visited WHERE bbid IN (
    SELECT bbid FROM labexam3_people WHERE customer IN ('Paul Hunt', 'Deborah Kelley')
);

DELETE FROM labexam3_visited WHERE statekey IN (
    SELECT statekey FROM labexam3_cities WHERE name = 'San Jose'
);