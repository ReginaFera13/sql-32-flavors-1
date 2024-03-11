DROP TABLE IF EXISTS cones;

CREATE TABLE cones(
    id SERIAL PRIMARY KEY,
    cone_type VARCHAR(10) NOT NULL,
    gluten_free BOOLEAN NOT NULL,
    quantity INT
);

DROP TABLE IF EXISTS employees;

CREATE TABLE employees(
    id SERIAL PRIMARY KEY,
    employee_name VARCHAR(50) NOT NULL UNIQUE
);

DROP TABLE IF EXISTS hours;

CREATE TABLE hours(
    id SERIAL PRIMARY KEY,
    employee_id INT NOT NULL,
    work_date DATE NOT NULL,
    hours_worked DECIMAL(3,1) NOT NULL,
    store_id INT NOT NULL
);

DROP TABLE IF EXISTS flavors;

CREATE TABLE flavors(
    id SERIAL PRIMARY KEY,
    flavor_name VARCHAR(50) NOT NULL,
    dairy_free BOOLEAN NOT NULL,
    quantity INT 
);

DROP TABLE IF EXISTS inventory;

CREATE TABLE inventory(
    id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    quantity INT
);

DROP TABLE IF EXISTS sales;

CREATE TABLE sales(
    id SERIAL PRIMARY KEY,
    flavor_id INT NOT NULL,
    cone_id INT NOT NULL,
    store_id INT NOT NULL
);

DROP TABLE IF EXISTS stores;

CREATE TABLE stores(
    id SERIAL PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    manager_id INT NOT NULL
);

DROP TABLE IF EXISTS employee_stores;

CREATE TABLE employee_stores(
    employee_id INT NOT NULL,
    store_id INT NOT NULL
);

DROP TABLE IF EXISTS customers;

CREATE TABLE customers(
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    total_spent INT,
    loyalty_points INT
);

DROP TABLE IF EXISTS prizes;

CREATE TABLE prizes(
    id SERIAL PRIMARY KEY,
    prize_name VARCHAR(50) NOT NULL,
    loyalty_points_required INT NOT NULL
);

DROP TABLE IF EXISTS store_managers;

CREATE TABLE store_managers(
    id SERIAL PRIMARY KEY,
    store_id INT NOT NULL,
    employee_id INT NOT NULL
);

-- \COPY cones FROM '/home/reginafera13/codeplatoon/sql-32-flavors-1/data/cones.csv' WITH CSV HEADER;
-- \COPY customers FROM '/home/reginafera13/codeplatoon/sql-32-flavors-1/data/customers.csv' WITH CSV HEADER;
-- \COPY employee_stores FROM '/home/reginafera13/codeplatoon/sql-32-flavors-1/data/employee_stores.csv' WITH CSV HEADER;
-- \COPY employees FROM '/home/reginafera13/codeplatoon/sql-32-flavors-1/data/employees.csv' WITH CSV HEADER;
-- \COPY flavors FROM '/home/reginafera13/codeplatoon/sql-32-flavors-1/data/flavors.csv' WITH CSV HEADER;
-- \COPY hours FROM '/home/reginafera13/codeplatoon/sql-32-flavors-1/data/hours.csv' WITH CSV HEADER;
-- \COPY inventory FROM '/home/reginafera13/codeplatoon/sql-32-flavors-1/data/inventory.csv' WITH CSV HEADER;
-- \COPY prizes FROM '/home/reginafera13/codeplatoon/sql-32-flavors-1/data/prizes.csv' WITH CSV HEADER;
-- \COPY sales FROM '/home/reginafera13/codeplatoon/sql-32-flavors-1/data/sales.csv' WITH CSV HEADER;
-- \COPY store_managers FROM '/home/reginafera13/codeplatoon/sql-32-flavors-1/data/store_managers.csv' WITH CSV HEADER;
-- \COPY stores FROM '/home/reginafera13/codeplatoon/sql-32-flavors-1/data/stores.csv' WITH CSV HEADER;