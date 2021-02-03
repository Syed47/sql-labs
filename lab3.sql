SELECT COUNT(*) FROM public.cs130lab3 WHERE custname SIMILAR TO '% M______';
SELECT COUNT(booktitle) FROM public.cs130lab3 WHERE bookpages % 2 = 0 AND bookpages >= 100 AND bookpages <= 200;
SELECT COUNT(bookisbn) FROM public.cs130lab3 WHERE bookisbn SIMILAR TO '(0|7)%' AND bookisbn SIMILAR TO '%-(0|7)';
SELECT COUNT(booktitle) FROM public.cs130lab3 WHERE booktitle ~ '.*\d+.*';
SELECT COUNT(booktitle) FROM public.cs130lab3 WHERE booktitle LIKE '%Operative web-enabled%';
SELECT COUNT(custiban) FROM public.cs130lab3 WHERE custiban ~ '^(IE|CH|ES)' AND char_length(custiban) >= 26;
SELECT COUNT(custiban) FROM public.cs130lab3 WHERE custiban ~ '.*\s\d{3}$';
SELECT COUNT(custiban) FROM public.cs130lab3 WHERE custiban ~ '.*(\s\d{4}){3}.*';
SELECT COUNT(custiban) FROM public.cs130lab3 WHERE custiban ~ '.*(\s\d{4}){6}.*';
SELECT COUNT(*) FROM public.cs130lab3 WHERE custregion ~ '^(IE|UK).*' AND (bookprice * 1.12) > 60.00 AND bookpages >= 100;
SELECT booktitle, booktext FROM public.cs130lab3 WHERE booktext ~ '.*CS130\s.*CS130+.*';
SELECT COUNT(*) FROM (
    SELECT booktitle, bookpages, LOG(bookpages) AS output FROM public.cs130lab3
) AS ModifiedTable WHERE output >= 2.2227 AND output <= 2.285555;