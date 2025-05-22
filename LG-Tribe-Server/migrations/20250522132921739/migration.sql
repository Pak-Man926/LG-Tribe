BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "users" (
    "id" bigserial PRIMARY KEY,
    "firstName" text NOT NULL,
    "lastName" text NOT NULL,
    "contacts" bigint NOT NULL,
    "email" text NOT NULL,
    "password" text NOT NULL
);


--
-- MIGRATION VERSION FOR lg_tribe
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('lg_tribe', '20250522132921739', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250522132921739', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
