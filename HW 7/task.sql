-- 1

CREATE VIEW samsBills AS
SELECT rs.first_name, rs.surname, rb.bill_date, rb.cust_name, rb.bill_total
FROM reststaff rs
JOIN restbill rb ON rs.staff_no = rb.waiter_no
WHERE rs.first_name = 'Sam'
    AND rs.surname = 'Pitt';

-- 2

SELECT *
FROM samsBills
WHERE bill_total > 400;

-- 3

CREATE VIEW roomTotals AS
SELECT rt.room_name, SUM(rb.bill_total) AS total_sum
FROM restbill rb
JOIN restrest_table rt ON rb.table_no = rt.table_no
GROUP BY rt.room_name;

-- 4

CREATE VIEW teamTotals AS
SELECT CONCAT(rs2.first_name, ' ', rs2.surname) AS headwaiter_name, SUM(rb.bill_total) AS total_sum
FROM restbill rb
JOIN reststaff rs ON rb.waiter_no = rs.staff_no
JOIN reststaff rs2 ON rs.headwaiter = rs2.staff_no
GROUP BY rs2.staff_no;