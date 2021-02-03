SELECT COUNT(*) FROM "public"."cs130lab4" where date_part('year', downloadts) = 2017 and date_part('month', downloadts) = 01  and date_part('day', downloadts) = 21;
SELECT COUNT(*) FROM "public"."cs130lab4" where date_part('year', downloadts) = 2016 and date_part('month', downloadts) = 12  and date_part('day', downloadts) = 13;
SELECT COUNT(*) FROM "public"."cs130lab4" WHERE user_agent ~* '.*ubuntu.*linux.*firefox';
SELECT COUNT(*) FROM "public"."cs130lab4" WHERE user_agent ~* '.*AppleWebKit/\d*\.\d*\.\d*';
SELECT COUNT(*) FROM "public"."cs130lab4" WHERE date_part('year', downloadts) = 2016 AND EXTRACT(DOW FROM downloadts) = 0 AND user_agent LIKE '%Googlebot/2.1%';
SELECT DISTINCT * FROM "public"."cs130lab4" WHERE filename ~* '^(a|e|i|o|u).*(a|e|i|o|u)\.mpeg';
SELECT COUNT(*) AS name FROM "public"."cs130lab4" WHERE NOT filename ~* '.*(a|e|i|o|u).*';
SELECT COUNT(*) AS name FROM "public"."cs130lab4" WHERE char_length(appname) % 2 = 0 AND char_length(filename) % 2 = 0 AND filename ~* '.*\.mp3';
SELECT COUNT(*) FROM "public"."cs130lab4" WHERE appname ~* '^(a|e|i|o|u)+$';
SELECT COUNT(*) FROM "public"."cs130lab4" 
WHERE date_part('year', downloadts) != 2016
AND ( 
    date_part('month', downloadts) + 
    date_part('day', downloadts) +
    date_part('hour', downloadts) +
    date_part('minute', downloadts) +
    date_part('second', downloadts) 
) = 42;
SELECT COUNT(*) FROM "public"."cs130lab4" 
WHERE filesize >= 400
AND date_part('hour', downloadts)  IN (2, 3, 5, 7, 11, 13, 17, 19, 23)
AND date_part('day', downloadts)   IN (2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31)
AND date_part('month', downloadts) IN (2, 3, 5, 7, 11);
SELECT COUNT(*) FROM "public"."cs130lab4" 
WHERE filesize >= 100
AND LOG(char_length(appname)) = LOG(char_length(ip_address));

-- Querry Results
-- 1 (5)
-- 2 (9)
-- 3 (87)
-- 4 (784)
-- 5 (4)
-- 6 (36)
-- 7 (7)
-- 8 (612)
-- 9 (9)
-- 10 (10)
-- 11 (55)
-- 12 (18)