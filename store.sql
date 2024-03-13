DROP TABLE IF EXISTS cones CASCADE;

CREATE TABLE cones(
    cone_id SERIAL PRIMARY KEY,
    cone_type VARCHAR(10) NOT NULL,
    gluten_free BOOLEAN NOT NULL,
    quantity INT
); --no foreign

\COPY cones FROM './data/cones.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS employees CASCADE;

CREATE TABLE employees(
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL UNIQUE
); --no foreign

\COPY employees FROM './data/employees.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS flavors CASCADE;

CREATE TABLE flavors(
    flavor_id SERIAL PRIMARY KEY,
    flavor_name VARCHAR(50) NOT NULL,
    dairy_free BOOLEAN NOT NULL,
    quantity INT 
); --no foreign

\COPY flavors FROM './data/flavors.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS customers CASCADE;

CREATE TABLE customers(
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    total_spent INT,
    loyalty_points INT
); --no foreign

\COPY customers FROM './data/customers.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS prizes;

CREATE TABLE prizes(
    prize_id SERIAL PRIMARY KEY,
    prize_name VARCHAR(50) NOT NULL,
    loyalty_points_required INT NOT NULL
); --no foreign

\COPY prizes FROM './data/prizes.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS stores CASCADE;

CREATE TABLE stores(
    store_id SERIAL PRIMARY KEY,
    location VARCHAR(255) NOT NULL
); -- no foreign

\COPY stores FROM './data/stores.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS timesheet;

CREATE TABLE timesheet(
    timesheet_id SERIAL PRIMARY KEY,
    employee_id INT NOT NULL,
    store_id INT NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
    FOREIGN KEY (store_id) REFERENCES stores (store_id)
); --requ employee and store

\COPY timesheet FROM './data/timesheet.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS employee_stores;

CREATE TABLE employee_stores(
    employee_stores_id SERIAL PRIMARY KEY,
    store_id INT NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
    FOREIGN KEY (store_id) REFERENCES stores (store_id)
); --requ store and employee

\COPY employee_stores FROM './data/employee_stores.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS store_managers;

CREATE TABLE store_managers(
    store_manager_id SERIAL PRIMARY KEY,
    store_id INT NOT NULL,
    employee_id INT NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees (employee_id),
    FOREIGN KEY (store_id) REFERENCES stores (store_id)
); --requ store and employee

\COPY store_managers FROM './data/store_managers.csv' WITH CSV HEADER;

DROP TABLE IF EXISTS sales;

CREATE TABLE sales(
    sales_id SERIAL PRIMARY KEY,
    flavor_id INT NOT NULL,
    cone_id INT NOT NULL,
    store_id INT NOT NULL,
    customer_id INT NOT NULL,
    sales_price DECIMAL(3,2) NOT NULL,
    FOREIGN KEY (store_id) REFERENCES stores (store_id),
    FOREIGN KEY (flavor_id) REFERENCES flavors (flavor_id),
    FOREIGN KEY (cone_id) REFERENCES cones (cone_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
); --requ flavor, cone, store, and customer

\COPY sales FROM './data/sales.csv' WITH CSV HEADER;