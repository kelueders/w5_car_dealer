-- STORED FUNCTION TO ADD DATA TO SALESPERSON
CREATE OR REPLACE FUNCTION add_salesperson(
	_salesperson_id INTEGER, 
	_first_name VARCHAR(30), 
	_last_name VARCHAR(30), 
	_email VARCHAR(50), 
	_active BOOLEAN
)
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO salesperson
	VALUES(_salesperson_id, _first_name, _last_name, _email, _active);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_salesperson(1, 'Richard', 'Polaski', 'rpolaski@gmail.com', True);
SELECT add_salesperson(2, 'Paul', 'Jackson', 'pjackson@carsrus.com', True);
SELECT add_salesperson(3, 'Gretchen', 'Hayward', 'ghayward@carsrus.com', True);
SELECT add_salesperson(4, 'Sam', 'Smith', 'ssmith@carsrus.com', False);

SELECT * FROM salesperson;




-- STORED FUNCTION TO ADD DATA TO CUSTOMER
CREATE OR REPLACE FUNCTION add_customer(_customer_id INTEGER, _first_name VARCHAR(30), _last_name VARCHAR(30), _address VARCHAR(50), _phone_num VARCHAR(20))
RETURNS void
AS $MAIN$
BEGIN
	INSERT INTO customer
	VALUES(_customer_id, _first_name, _last_name, _address, _phone_num);
END;
$MAIN$
LANGUAGE plpgsql;

SELECT add_customer(1, 'Kieron', 'Haas', '345 Pencil Rd Minooka IL 60523', '555-234-0289');
SELECT add_customer(2, 'Zoe', 'Anthony', '1948 Lighthouse Ln, Batavia, IL 60512', '555-194-8275');
SELECT add_customer(3, 'Andrea', 'Ray', '4932 Bainbridge Rd, Hinsdale, IL 60432', '555-492-3923');
SELECT add_customer(4, 'Ross', 'McGowan', '592 Stencil Circle, Lisle, IL 60345', '555-243-9201');

SELECT * FROM customer;