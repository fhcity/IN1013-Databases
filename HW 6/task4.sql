-- 1

SELECT DISTINCT cust_name
FROM restbill rb
JOIN reststaff rs ON rb.waiter_no = rs.staff_no
JOIN reststaff rs2 ON rs.headwaiter = rs2.staff_no
WHERE rb.bill_total > 450.00
    AND rs2.first_name = "Charles";

-- 2

SELECT rs2.first_name, rs2.surname
FROM restbill rb
JOIN reststaff rs ON rb.waiter_no = rs.staff_no
JOIN reststaff rs2 ON rs.headwaiter = rs2.staff_no
WHERE rb.cust_name LIKE "Nerida %"
    AND rb.bill_date = 160111;

-- 3

SELECT DISTINCT cust_name
FROM restbill
WHERE bill_total = (SELECT MIN(bill_total) FROM restbill);

-- 4

SELECT first_name, surname
FROM reststaff
WHERE staff_no NOT IN (SELECT waiter_no FROM restbill);

-- 5

SELECT rb.cust_name, rs.first_name, rs.surname, rm.room_name
FROM restbill rb
JOIN restrest_table rt ON rb.table_no = rt.table_no
JOIN restroom_management rm ON rt.room_name = rm.room_name AND rb.bill_date = rm.room_date
JOIN reststaff rs ON rm.headwaiter = rs.staff_no
WHERE rb.bill_total = (SELECT MAX(bill_total) FROM restbill);