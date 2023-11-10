UPDATE "users_with_roles"
SET "cashback" ="users_with_roles"."cashback" + "subquery"."cashback"
FROM (SELECT "user_id",
"cashback"+10 AS "cashback"
FROM "users_with_roles"
WHERE "users_with_roles"."role" = 3
ORDER BY "users_with_roles"."rating" DESC
LIMIT 3
) AS "subquery"
WHERE "users_with_roles"."user_id" = "subquery"."user_id"
RETURNING *
