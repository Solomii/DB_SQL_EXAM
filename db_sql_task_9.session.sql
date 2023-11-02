DROP TABLE IF EXISTS "roles" cascade;
DROP TABLE IF EXISTS "users_with_roles" cascade;

CREATE TABLE "roles"(
  "role_id" SERIAL PRIMARY KEY,
  "roleName" VARCHAR(64) NOT NULL
);

INSERT INTO "roles"("roleName")
VALUES ('customer'),
  ('admin'),
  ('accountant') 
  
CREATE TABLE "users_with_roles" (
    "user_id" SERIAL PRIMARY KEY,
    "firstName" VARCHAR(64) NOT NULL CHECK("firstName" != ''),
    "lastName" VARCHAR(64) NOT NULL CHECK("lastName" != ''),
    "email" VARCHAR(256) NOT NULL CHECK("email" != '') UNIQUE,
    "role" INT REFERENCES "roles"("role_id"),
    "cashback" NUMERIC(8,2) CHECK("cashback" >=0 AND "cashback"<1000000),
    "currency" VARCHAR(5) NOT NULL
  );
  
INSERT INTO "users_with_roles"("firstName", "lastName", "email", "role", "cashback", "currency" )
VALUES ('Tom', 'Test', 'tom@gamil.com', 1, 0, 'uah'),
  ('Mary', 'Smith', 'test1@gamil.com', 1, 0, 'uah'),
  ('Ava', 'Jonson', 'test2@gamil.com', 2, 0, 'uah'),
  ('Emma', 'Li', 'test3@gamil.com', 2, 0, 'uah'),
  ('Wiliam', 'Jones', 'test4@gamil.com', 2, 0,'uah'),
  ('Thomas', 'Roy', 'test5@gamil.com', 2, 0,'uah'),
  (
    'Emily',
    'White',
    'test6@gamil.com',
    3, 0, 'uah'
  ),
  (
    'James',
    'Wilson',
    'test7@gamil.com',
    3, 0,'uah'
  ),
  ('Mary', 'Test', 'test8@gamil.com', 3, 0, 'uah'),
  ('David', 'Jones', 'test9@gamil.com', 2, 0, 'uah'),
  ('Joe', 'Test', 'test10@gamil.com', 1, 0, 'uah'),
  ('Olivia', 'Test', 'test11@gamil.com', 2, 0,'uah'),
  ('Mary', 'Test', 'test12@gamil.com', 2, 0, 'uah'),
  ('Tom', 'Test', 'test13@gamil.com', 1, 0, 'uah'),
  ('Lily', 'Test', 'test14@gamil.com', 1, 0, 'uah'),
  (
    'Megan',
    'Brown',
    'test15@gamil.com',
    1, 0, 'uah'
  )

  SELECT * FROM "users_with_roles"
  -- SELECT COUNT("user_id"),
  --   "role"
  -- FROM "users_with_roles"
  -- WHERE "role" IN (1, 2)
  -- GROUP BY "role" 
SELECT "roles"."roleName",
  COUNT("role_id") AS "role_count"
FROM "roles"
  JOIN "users_with_roles" on "users_with_roles"."role" = "roles"."role_id"
GROUP BY "roles"."roleName"