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
SET "cashback" = "users_with_roles"."cashback" + "subquery"."cashback"
FROM (SELECT "userId",
"sum"*0.1 AS "cashback"
FROM "orders"
WHERE "createdAt" BETWEEN ('2023-12-25') AND ('2024-01-14') ) 
AS "subquery"
WHERE "users_with_roles"."role" = 1 AND  "users_with_roles"."user_id"="subquery"."userId" 
RETURNING "users_with_roles"
