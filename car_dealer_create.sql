CREATE TABLE salesperson (
  salesperson_id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  email VARCHAR(50),
  active BOOLEAN
);

CREATE TABLE customer (
  customer_id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  address VARCHAR(50),
  phone_num VARCHAR(20)
);

CREATE TABLE mechanic (
  mechanic_id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30)
);

CREATE TABLE sales_invoice (
  sales_invoice_id SERIAL PRIMARY KEY,
  date_sold DATE,
  vehicle_name VARCHAR(30),
  price NUMERIC(9,2),
  customer_id INTEGER,
  salesperson_id INTEGER,
  	FOREIGN KEY (customer_id)
		REFERENCES customer(customer_id),
  	FOREIGN KEY (salesperson_id)
		REFERENCES salesperson(salesperson_id)
);

CREATE TABLE car (
  car_id SERIAL PRIMARY KEY,
  make VARCHAR(20),
  model VARCHAR(20),
  year_ VARCHAR(20),
  if_new BOOLEAN,
  if_sold BOOLEAN,
  if_serviced BOOLEAN,
  sales_invoice_id INTEGER,
	FOREIGN KEY (sales_invoice_id)
    	REFERENCES sales_invoice(sales_invoice_id)
);

CREATE TABLE service_ticket (
  service_ticket_id SERIAL PRIMARY KEY,
  service_date DATE,
  repairs_performed VARCHAR(150),
  used_parts BOOLEAN,
  total_cost NUMERIC(7,2),
  customer_id INTEGER,
  car_id INTEGER,
	FOREIGN KEY (customer_id)
		REFERENCES customer(customer_id),
    FOREIGN KEY (car_id)
    	REFERENCES car(car_id)
);

CREATE TABLE mechanic_ticket (
  mechanic_ticket_id SERIAL PRIMARY KEY,
  mechanic_id INTEGER,
  service_ticket_id INTEGER,
	FOREIGN KEY (mechanic_id)
    	REFERENCES mechanic(mechanic_id),
	FOREIGN KEY (service_ticket_id)
    	REFERENCES service_ticket(service_ticket_id)
);

CREATE TABLE part (
  part_id SERIAL PRIMARY KEY,
  part_name VARCHAR(30),
  part_price NUMERIC(7,2),
  service_ticket_id INTEGER,
    FOREIGN KEY (service_ticket_id)
      REFERENCES service_ticket(service_ticket_id)
);