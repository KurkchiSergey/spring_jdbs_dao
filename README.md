# spring-jdbc-dao

Spring Boot приложение на Spring JDBC: по имени покупателя возвращает названия заказанных им товаров.

## Запуск

1. Запустите PostgreSQL в Docker: `docker start my-postgres`.
2. Запустите класс `SpringJdbcDaoApplication`.
3. При старте Spring Boot выполнит `schema.sql` (создаст таблицы, если их нет) и `data.sql` (добавит тестовые данные, если таблицы пустые).

## Запрос

```
GET http://localhost:8080/products/fetch-product?name=alexey
```

Ответ — список товаров покупателя 

```json
["laptop", "headphones"]
```

## Файлы

- `resources/schema.sql` — создание таблиц `CUSTOMERS` и `ORDERS`
- `resources/data.sql` — тестовые данные
- `resources/fetch_product.sql` — запрос с именованным параметром `:name`
- `repository/ProductRepository.java` — читает скрипт и выполняет его через `NamedParameterJdbcTemplate`
- `controller/ProductController.java` — endpoint `/products/fetch-product`
