-- CHECKING contents of each table
SELECT * FROM salesperson;
SELECT * FROM customer;
SELECT * FROM mechanic;
SELECT * FROM sales_invoice;
SELECT * FROM car;
SELECT * FROM service_ticket;
SELECT * FROM part;
SELECT * FROM mechanic_ticket;

-- DELETING and ADDING COLUMNS
ALTER TABLE sales_invoice
DROP COLUMN vehicle_name;    -- deleted because this info is already in the car table

ALTER TABLE mechanic
ADD COLUMN hourly_rate NUMERIC(5,2);

-- Corrected a saleman's email
UPDATE salesperson
SET email = 'rpolaski@carsrus.com'
WHERE salesperson_id = 1;

-- UPDATED hourly_rate column
UPDATE mechanic
SET hourly_rate = 18
WHERE mechanic_id = 1;

UPDATE mechanic
SET hourly_rate = 18
WHERE mechanic_id = 2;

UPDATE mechanic
SET hourly_rate = 17.50
WHERE mechanic_id = 3;

UPDATE mechanic
SET hourly_rate = 20
WHERE mechanic_id = 4;

-- CREATE PROCEDURE to update a purchased vehicle's service boolean 
-- when it had not received service then gets oil change
CREATE OR REPLACE PROCEDURE changeToServiced (
	car_ INTEGER
)
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE car
	SET if_serviced = True
	WHERE car_ = car_id;
	
	COMMIT;
END;
$$

CALL changeToServiced(3);