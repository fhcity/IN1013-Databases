-- 1

SELECT rs.first_name, rs.surname
FROM reststaff rs
JOIN restbill rb ON rs.staff_no = rb.waiter_no
WHERE rb.cust_name = "Tanya Singh";

-- 2

SELECT DISTINCT rm.room_date
FROM restroom_management rm
JOIN reststaff rs ON rm.headwaiter = rs.staff_no
WHERE rs.first_name = "Charles" 
    AND rm.room_name = "Green" 
    AND rm.room_date > 160200 AND rm.room_date < 160300;

-- 3

SELECT DISTINCT a.first_name, a.surname
FROM reststaff a
JOIN reststaff b ON a.headwaiter = b.headwaiter
WHERE b.first_name = "Zoe"
    AND b.surname = "Ball"
    AND a.staff_no != b.staff_no;

-- 4

SELECT rb.cust_name, rb.bill_total, rs.first_name, rs.surname
FROM restbill rb
JOIN reststaff rs ON rb.waiter_no = rs.staff_no
ORDER BY rb.bill_total DESC;

-- 5

SELECT rs2.first_name, rs2.surname
FROM reststaff rs
JOIN restbill rb ON rs.staff_no = rb.waiter_no
JOIN reststaff rs2 ON rs.headwaiter = rs2.headwaiter
WHERE rb.bill_no = 14 OR rb.bill_no = 17;

-- 6

SELECT rs.first_name, rs.surname
FROM reststaff rs
JOIN restroom_management rm ON rs.staff_no = rm.headwaiter
WHERE rm.room_name = "Blue"
    AND rm.room_date = 160312
UNION
SELECT rs.first_name, rs.surname
FROM reststaff rs
JOIN restroom_management rm ON rs.headwaiter = rm.headwaiter
WHERE rm.room_name = "Blue"
    AND rm.room_date = 160312;