BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "users" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    "contacts" bigint NOT NULL,
    "email" text NOT NULL,
    "password" text NOT NULL,
    "authlevel" bigint NOT NULL,
    "country" bigint NOT NULL
);


--
-- MIGRATION VERSION FOR lg_tribe
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('lg_tribe', '20250612231334265', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250612231334265', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
