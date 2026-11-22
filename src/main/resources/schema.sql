

CREATE TABLE IF NOT EXISTS CUSTOMERS (
    id           SERIAL       PRIMARY KEY,
    name         VARCHAR(50)  NOT NULL,
    surname      VARCHAR(50)  NOT NULL,
    age          INT          CHECK (age >= 0),
    phone_number VARCHAR(20)
);

CREATE TABLE IF NOT EXISTS ORDERS (
    id           SERIAL        PRIMARY KEY,
    date         DATE          NOT NULL DEFAULT CURRENT_DATE,
    customer_id  INT           NOT NULL REFERENCES CUSTOMERS (id),
    product_name VARCHAR(100)  NOT NULL,
    amount       INT           NOT NULL CHECK (amount > 0)
);
