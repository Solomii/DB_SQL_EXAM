DROP TABLE IF EXISTS "roles" cascade;
DROP TABLE IF EXISTS "users_with_roles";

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
    "role" INT REFERENCES "roles"("role_id")
  );
  
INSERT INTO "users_with_roles"("firstName", "lastName", "email", "role")
VALUES ('Tom', 'Test', 'tom@gamil.com', 1),
  ('Mary', 'Smith', 'test1@gamil.com', 1),
  ('Ava', 'Jonson', 'test2@gamil.com', 2),
  ('Emma', 'Li', 'test3@gamil.com', 2),
  ('Wiliam', 'Jones', 'test4@gamil.com', 2),
  ('Thomas', 'Roy', 'test5@gamil.com', 2),
  (
    'Emily',
    'White',
    'test6@gamil.com',
    3
  ),
  (
    'James',
    'Wilson',
    'test7@gamil.com',
    3
  ),
  ('Mary', 'Test', 'test8@gamil.com', 3),
  ('David', 'Jones', 'test9@gamil.com', 2),
  ('Joe', 'Test', 'test10@gamil.com', 1),
  ('Olivia', 'Test', 'test11@gamil.com', 2),
  ('Mary', 'Test', 'test12@gamil.com', 2),
  ('Tom', 'Test', 'test13@gamil.com', 1),
  ('Lily', 'Test', 'test14@gamil.com', 1),
  (
    'Megan',
    'Brown',
    'test15@gamil.com',
    1
  )
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