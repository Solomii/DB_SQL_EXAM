DROP TABLE IF EXISTS "products";

CREATE TABLE "products" (
  "id" SERIAL PRIMARY KEY,
  "productName" VARCHAR(64) NOT NULL CHECK("productName"!=''),
  "price" NUMERIC(8,2) CHECK("price" >0 AND "price"<1000000) ,
  "currency" VARCHAR(5) NOT NULL,
  "quantity" INT NOT NULL CHECK("quantity" >0 AND "quantity" <=1000),
  "dateOfManufacture" TIMESTAMP,
  "expirationDate" DATE 
); 


INSERT INTO "products" ("productName", "price", "currency", "quantity", "dateOfManufacture","expirationDate")
VALUES ('bread', 20, 'uah', 10, '2023-12-30','2024-01-06'),
('salt', 19, 'uah', 20, '2022-09-25', '2024-12-02'),
('yogurt', 75, 'uah', 8, '2023-12-25','2024-01-25'),
('cottage cheese', 80, 'uah', 10, '2023-12-25','2024-01-08'),
('milk', 47, 'uah', 13, '2023-11-01','1957-02-01'),
('sour cream', 50, 'uah', 5, '2023-10-05','2024-04-05'),
('butter', 80, 'uah', 8, '2023-12-10','2024-02-10'),
('sausage', 45, 'uah', 15, '2023-01-01','2026-01-01'),
('becon', 90, 'uah', 6, '2023-12-20','2025-03-20'),
('ham', 150, 'uah', 6, '2023-12-12','1957-03-12'),
('fish hake', 260, 'uah', 10, '2023-11-01','2024-11-01'),
('seafood', 250, 'uah', 3, '2023-12-08','2025-06-08'),
('peanut butter', 195, 'uah', 7, '2023-10-01','2024-4-01'),
('honey', 120, 'uah', 5, '2023-10-15','2024-10-15'),
('jam', 60, 'uah', 5, '2023-09-17','2027-09-17'),
('ground coffee', 125, 'uah', 15, '2023-06-01','2024-12-25'),
('black tea', 50, 'uah', 15, '2023-02-23','2025-02-23'),
('herbal tea', 40, 'uah', 10, '2023-09-01','2025-09-01')

SELECT * FROM "products"

DROP TABLE IF EXISTS "orders";
CREATE TABLE "orders" (
 "id" SERIAL PRIMARY KEY,
 "userId" INT REFERENCES "users_with_roles"("user_id"),
 "createdAt" TIMESTAMP NOT NULL,
 "sum" NUMERIC(8,2) CHECK("sum" >=0 AND "sum"<1000000),
 "currency" VARCHAR(5) NOT NULL
);

INSERT INTO "orders"("userId", "createdAt", "sum", "currency")
 VALUES (1,'2023-11-28',652,'uah'),
 (2,'2023-12-28',300,'uah'),
 (12,'2024-01-05',800,'uah'),
 (7,'2023-12-27',346,'uah'),
 (15,'2024-01-10',1234,'uah'),
 (13,'2024-01-10',345,'uah'),
 (14,'2024-01-10',987,'uah'),
 (9,'2023-11-10',2134,'uah'),
 (5,'2023-12-27',765,'uah')

UPDATE "users_with_roles"
SET "cashback" = "subquery"."cashback"
FROM (SELECT "userId",
"sum"*0.1 AS "cashback"
FROM "orders"
WHERE "createdAt" BETWEEN ('2023-12-25') AND ('2024-01-14') ) 
AS "subquery"
WHERE "users_with_roles"."role" = 1 AND  "users_with_roles"."user_id"="subquery"."userId" 
RETURNING "users_with_roles"
