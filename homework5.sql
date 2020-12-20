//1. Реализовать практические задания на примере других таблиц и запросов.
START TRANSACTION;

SAVEPOINT sp0;

DELETE FROM warehouse WHERE prod_num = '123';

SAVEPOINT sp1;

UPDATE prod_amount SET prod_amount = prod_amount - 100 where prod_num = '450';

COMMIT;

//2. Подумать, какие операции являются транзакционными, и написать несколько примеров с транзакционными запросами.

DROP TRIGGER addprod;

ALTER TABLE products change prod_num prod_num int(11) auto_increment;

START TRANSACTION;

SAVEPOINT sp0;

INSERT INTO products (size, prod_name, warehouse_num, cell_name) VALUES ('1', 'flashlight', '3', '4a');

savepoint stage1;

INSERT INTO prod_amount (amount, expected_supply, month_sale)
    VALUES (500, 300, 800);

COMMIT;

SELECT * FROM products ORDER BY prod_num DESC;

SELECT * FROM prod_amount ORDER BY month_sale DESC;

//3. Проанализировать несколько запросов с помощью EXPLAIN.

EXPLAIN SELECT warehouse, prod_amount, products FROM StorageBase;

EXPLAIN SELECT product, max_amount FROM MaxAmountSize;

EXPLAIN SELECT * FROM StorageSize;