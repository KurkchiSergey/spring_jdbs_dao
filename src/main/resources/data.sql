-- Тестовые данные. Добавляются, только если таблица CUSTOMERS пустая,
-- поэтому повторный запуск приложения не создаёт дубликаты.

INSERT INTO CUSTOMERS (name, surname, age, phone_number)
SELECT * FROM (VALUES
    ('Alexey', 'Ivanov',   30, '+79001112233'),
    ('Ivan',   'Petrov',   25, '+79004445566'),
    ('Anna',   'Sidorova', 40, '+79007778899')
) AS v(name, surname, age, phone_number)
WHERE NOT EXISTS (SELECT 1 FROM CUSTOMERS);

INSERT INTO ORDERS (customer_id, product_name, amount)
SELECT c.id, v.product_name, v.amount
FROM (VALUES
    ('Alexey', 'laptop',     1),
    ('Alexey', 'headphones', 2),
    ('Ivan',   'phone',      1),
    ('Anna',   'book',       3)
) AS v(customer_name, product_name, amount)
JOIN CUSTOMERS c ON c.name = v.customer_name
WHERE NOT EXISTS (SELECT 1 FROM ORDERS);
