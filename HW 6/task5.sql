-- 1

SELECT rs.first_name, rs.surname, rb.bill_date, COUNT(rb.bill_no)
FROM restbill rb
JOIN reststaff rs ON rb.waiter_no = rs.staff_no
GROUP BY rs.first_name, rs.surname, rb.bill_date
HAVING COUNT(rb.bill_no) >= 2;

-- 2

SELECT room_name, COUNT(table_no)
FROM restrest_table
WHERE no_of_seats > 6
GROUP BY room_name;

-- 3

SELECT room_name, COUNT(bill_no)
FROM restbill rb
JOIN restrest_table rt ON rb.table_no = rt.table_no
GROUP BY rt.room_name;

-- 4

SELECT rs.first_name, rs.surname, SUM(rb.bill_total)
FROM reststaff rs
JOIN reststaff rs2 ON rs.staff_no = rs2.headwaiter
JOIN restbill rb ON rs2.staff_no = rb.waiter_no
GROUP BY rs.staff_no, rs.first_name, rs.surname
ORDER BY SUM(bill_total) DESC;

-- 5

SELECT cust_name
FROM restbill
GROUP BY cust_name
HAVING AVG(bill_total) > 400;

-- 6

SELECT rs.first_name, rs.surname, COUNT(rb.bill_no)
FROM restbill rb
JOIN reststaff rs ON rb.waiter_no = rs.staff_no
GROUP BY rs.first_name, rs.surname, rb.bill_date
HAVING COUNT(rb.bill_no) >=3;