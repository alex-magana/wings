--
-- File generated with SQLiteStudio v3.1.0 on Tue Oct 11 09:55:54 2016
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: roles
DROP TABLE IF EXISTS roles;

CREATE TABLE roles (
    id         INTEGER  PRIMARY KEY AUTOINCREMENT
                        NOT NULL,
    role_name  VARCHAR,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL
);

INSERT INTO roles (
                      id,
                      role_name,
                      created_at,
                      updated_at
                  )
                  VALUES (
                      1,
                      'ADMIN',
                      '2016-02-15 01:34:09',
                      '2016-02-15 01:34:09'
                  );

INSERT INTO roles (
                      id,
                      role_name,
                      created_at,
                      updated_at
                  )
                  VALUES (
                      2,
                      'N_USER',
                      '2016-02-15 01:34:09',
                      '2016-02-15 01:34:09'
                  );

INSERT INTO roles (
                      id,
                      role_name,
                      created_at,
                      updated_at
                  )
                  VALUES (
                      3,
                      'WALK_IN',
                      '2016-02-15 01:34:09',
                      '2016-02-15 01:34:09'
                  );


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
