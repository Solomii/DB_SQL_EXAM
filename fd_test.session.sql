DROP TABLE IF EXISTS "users_with_admin";
CREATE TABLE "users_with_admin" (
  "id" SERIAL PRIMARY KEY,
  "firstName" VARCHAR(64) NOT NULL CHECK("firstName" != ''),
  "lastName" VARCHAR(64) NOT NULL CHECK("lastName" != ''),
  "email" VARCHAR(256) NOT NULL CHECK("email" != '') UNIQUE,
  "admin" NUMERIC(8) NOT NULL,
  "castomer" NUMERIC(8) NOT NULL
);

INSERT INTO "users_with_admin"(
    "lastName",
    "firstName",
    "email",
    "admin",
    "castomer"
  )
VALUES ('Tom', 'Test', 'tom@gamil.com', 1, 1),
  ('Mary', 'Smith', 'test1@gamil.com', 2, 2),
  ('Ava', 'Jonson', 'test2@gamil.com', 22, 22),
  ('Emma', 'Li', 'test3@gamil.com', 3, 3),
  ('Wiliam', 'Jones', 'test4@gamil.com', 21, 21),
  ('Thomas', 'Roy', 'test5@gamil.com', 40, 50),
  ('Emily', 'White', 'test6@gamil.com', 30, 32),
  ('James', 'Wilson', 'test7@gamil.com', 52, 25),
  ('Mary', 'Test', 'test8@gamil.com', 24, 42),
  ('David', 'Jones', 'test9@gamil.com', 44, 36),
  ('Joe', 'Test', 'test10@gamil.com', 95, 252),
  ('Olivia', 'Test', 'test11@gamil.com', 34, 48),
  ('Mary', 'Test', 'test12@gamil.com', 216, 72),
  ('Tom', 'Test', 'test13@gamil.com', 67, 67),
  ('Lily', 'Test', 'test14@gamil.com', 45, 222),
  ('Megan', 'Brown', 'test15@gamil.com', 40, 22)

SELECT "id",
  "firstName",
  "lastName",
  "admin",
  "castomer"
FROM "users_with_admin"
WHERE "admin" = 40
  AND "castomer" = 22