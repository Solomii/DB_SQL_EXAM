DROP TABLE IF EXISTS "users_with_roles";
CREATE TABLE "users_with_roles" (
  "user_id" SERIAL PRIMARY KEY,
  "firstName" VARCHAR(64) NOT NULL CHECK("firstName" != ''),
  "lastName" VARCHAR(64) NOT NULL CHECK("lastName" != ''),
  "email" VARCHAR(256) NOT NULL CHECK("email" != '') UNIQUE,
  "roles" VARCHAR(64) NOT NULL
);
INSERT INTO "users_with_roles"("firstName", "lastName", "email", "roles")
VALUES ('Tom', 'Test', 'tom@gamil.com', 'customer'),
  ('Mary', 'Smith', 'test1@gamil.com', 'customer'),
  ('Ava', 'Jonson', 'test2@gamil.com', 'admin'),
  ('Emma', 'Li', 'test3@gamil.com', 'admin'),
  ('Wiliam', 'Jones', 'test4@gamil.com', 'admin'),
  ('Thomas', 'Roy', 'test5@gamil.com', 'admin'),
  (
    'Emily',
    'White',
    'test6@gamil.com',
    'accountant'
  ),
  (
    'James',
    'Wilson',
    'test7@gamil.com',
    'accountant'
  ),
  ('Mary', 'Test', 'test8@gamil.com', 'accountant'),
  ('David', 'Jones', 'test9@gamil.com', 'admin'),
  ('Joe', 'Test', 'test10@gamil.com', 'customer'),
  ('Olivia', 'Test', 'test11@gamil.com', 'admin'),
  ('Mary', 'Test', 'test12@gamil.com', 'admin'),
  ('Tom', 'Test', 'test13@gamil.com', 'customer'),
  ('Lily', 'Test', 'test14@gamil.com', 'customer'),
  (
    'Megan',
    'Brown',
    'test15@gamil.com',
    'customer'
  )

SELECT COUNT("user_id"),
  "roles"
FROM "users_with_roles"
WHERE "roles" IN ('customer', 'admin')
GROUP BY "roles"

 -- DROP TABLE IF EXISTS "role";
  -- CREATE TABLE "role"(
  --   "role_id" SERIAL PRIMARY KEY,
  --   "roleName" VARCHAR(64) NOT NULL
  -- );
  -- INSERT INTO "role"("roleName")
  -- VALUES ('customer'),
  --   ('admin'),
  --   ('accountant')