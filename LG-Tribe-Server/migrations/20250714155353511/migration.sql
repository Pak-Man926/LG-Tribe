BEGIN;


--
-- MIGRATION VERSION FOR lg_tribe
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('lg_tribe', '20250714155353511', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250714155353511', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
