

-- your
SELECT count(*) FROM venus
WHERE custname ~* '^Peter .*';

-- your
SELECT count(*) FROM venus
WHERE custname ~* '.*C.*S.*';

-- your
SELECT count(*) FROM venus
WHERE loyaltycard ~* '.*\-(2|3|5|7){3}\-.*'; -- 171

-- mine
SELECT count(*) FROM venus
WHERE custname ~* '^(a|e|i|o|u)+.*\s(a|e|i|o|u).*$'; -- 51


-- mine
SELECT * FROM venus
WHERE tillid ~* '^(1|3|5|7|9){2}.*(0|2|4|6|8){2}$'; -- 16

-- query
SELECT * FROM venus
WHERE items BETWEEN 9 AND 13
AND useddebit = 'no'; -- 260

-- mine

SELECT entrytime FROM venus 
WHERE EXTRACT(DOW FROM entrytime) IN (6,0)
AND useddebit = 'yes'; -- 433
-- mine
SELECT count(*) FROM venus
WHERE char_length(custname) BETWEEN 10 AND 14; -- 1767


SELECT count(*) FROM venus
WHERE custname ~* '^Peter .*'; -- 9

SELECT * FROM venus
WHERE date_part('year', entrytime) = 2017 AND
date_part('year', exittime) = 2017 AND 
date_part('month', entrytime) = 01 AND
date_part('month', exittime) = 01 AND
date_part('day', entrytime) = 27 AND
date_part('day', exittime) = 27;

SELECT custname FROM venus
WHERE custname ~* '.*C.*S.*'; -- 282

SELECT loyaltycard FROM venus
WHERE loyaltycard ~* '.*(a|e|i|o|u){2}.*'; --367


SELECT (EXTRACT(EPOCH FROM exittime) - EXTRACT(EPOCH FROM entrytime))/3600 > 0 FROM venus;

SELECT entrytime, exittime FROM venus
date_part('year', entrytime) = date_part('year', exittime) AND 
date_part('month', entrytime) = date_part('month', exittime) AND
date_part('hour', exittime) = date_part('hour', exittime) AND
WHERE (EXTRACT(EPOCH FROM exittime) - EXTRACT(EPOCH FROM entrytime)) > 3600; -- 2957


SELECT * FROM venus
WHERE date_part('year', entrytime) = date_part('year', exittime) AND 
date_part('month', entrytime) = date_part('month', exittime) = 01 AND
date_part('day', exittime)date_part('day', exittime) AND 
date_part('minutes', exittime) date_part('minutes', exittime)
