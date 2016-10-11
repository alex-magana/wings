--
-- File generated with SQLiteStudio v3.1.0 on Tue Oct 11 09:57:10 2016
--
-- Text encoding used: UTF-8
--
PRAGMA foreign_keys = off;
BEGIN TRANSACTION;

-- Table: users
DROP TABLE IF EXISTS users;

CREATE TABLE users (
    id          INTEGER  PRIMARY KEY AUTOINCREMENT
                         NOT NULL,
    first_name  VARCHAR,
    middle_name VARCHAR,
    last_name   VARCHAR,
    email       VARCHAR,
    password    VARCHAR,
    role_id     INTEGER,
    created_at  DATETIME NOT NULL,
    updated_at  DATETIME NOT NULL
);

INSERT INTO users (
                      id,
                      first_name,
                      middle_name,
                      last_name,
                      email,
                      password,
                      role_id,
                      created_at,
                      updated_at
                  )
                  VALUES (
                      1,
                      'ADMIN',
                      'ADMIN2',
                      'ADMIN3',
                      'admin@flightset.com',
                      NULL,
                      1,
                      '2016-02-15 01:34:09',
                      '2016-02-15 01:34:09'
                  );

INSERT INTO users (
                      id,
                      first_name,
                      middle_name,
                      last_name,
                      email,
                      password,
                      role_id,
                      created_at,
                      updated_at
                  )
                  VALUES (
                      2,
                      'WALKIN',
                      'WALKIN2',
                      'WALKIN3',
                      'walkin@filghtset.com',
                      NULL,
                      3,
                      '2016-02-15 01:34:09',
                      '2016-02-15 01:34:09'
                  );

INSERT INTO users (
                      id,
                      first_name,
                      middle_name,
                      last_name,
                      email,
                      password,
                      role_id,
                      created_at,
                      updated_at
                  )
                  VALUES (
                      3,
                      'ALEX',
                      'MAGANA',
                      'GATOBU',
                      'rsma@gmail.com',
                      '1234567890',
                      2,
                      '2016-10-08 18:42:19.485708',
                      '2016-10-08 18:42:19.485708'
                  );

INSERT INTO users (
                      id,
                      first_name,
                      middle_name,
                      last_name,
                      email,
                      password,
                      role_id,
                      created_at,
                      updated_at
                  )
                  VALUES (
                      4,
                      'R',
                      'S',
                      'M',
                      'rsm@gmail.com',
                      '1234567890',
                      2,
                      '2016-10-08 18:53:03.218505',
                      '2016-10-08 18:53:03.218505'
                  );

INSERT INTO users (
                      id,
                      first_name,
                      middle_name,
                      last_name,
                      email,
                      password,
                      role_id,
                      created_at,
                      updated_at
                  )
                  VALUES (
                      5,
                      'JANE',
                      'OLUWAFELI',
                      'KIMANI',
                      'joki@gmail.com',
                      '1234567890',
                      2,
                      '2016-10-08 18:58:10.707691',
                      '2016-10-08 18:58:10.707691'
                  );

INSERT INTO users (
                      id,
                      first_name,
                      middle_name,
                      last_name,
                      email,
                      password,
                      role_id,
                      created_at,
                      updated_at
                  )
                  VALUES (
                      6,
                      'A',
                      'B',
                      'C',
                      'abc@gmail.com',
                      '1234567890',
                      2,
                      '2016-10-09 01:39:24.440209',
                      '2016-10-09 01:39:24.440209'
                  );

INSERT INTO users (
                      id,
                      first_name,
                      middle_name,
                      last_name,
                      email,
                      password,
                      role_id,
                      created_at,
                      updated_at
                  )
                  VALUES (
                      7,
                      'D',
                      'S',
                      'E',
                      'dse@gmail.com',
                      '1234567890',
                      2,
                      '2016-10-09 01:42:33.104781',
                      '2016-10-09 01:42:33.104781'
                  );

INSERT INTO users (
                      id,
                      first_name,
                      middle_name,
                      last_name,
                      email,
                      password,
                      role_id,
                      created_at,
                      updated_at
                  )
                  VALUES (
                      8,
                      'Q',
                      'W',
                      'E',
                      'qwe@yahoo.com',
                      '1234567890',
                      2,
                      '2016-10-09 01:46:31.107932',
                      '2016-10-09 01:46:31.107932'
                  );

INSERT INTO users (
                      id,
                      first_name,
                      middle_name,
                      last_name,
                      email,
                      password,
                      role_id,
                      created_at,
                      updated_at
                  )
                  VALUES (
                      9,
                      'ALEX',
                      'MAGANA',
                      'GATOBU',
                      'rsmb@gmail.com',
                      '1234567890',
                      2,
                      '2016-10-10 13:01:45.845033',
                      '2016-10-10 13:01:45.845033'
                  );

INSERT INTO users (
                      id,
                      first_name,
                      middle_name,
                      last_name,
                      email,
                      password,
                      role_id,
                      created_at,
                      updated_at
                  )
                  VALUES (
                      10,
                      'ALEX',
                      'MAGANA',
                      'GATOBU',
                      'gatobumalex@gmail.com',
                      '1234567890',
                      2,
                      '2016-10-10 13:43:17.637877',
                      '2016-10-10 13:43:17.637877'
                  );

INSERT INTO users (
                      id,
                      first_name,
                      middle_name,
                      last_name,
                      email,
                      password,
                      role_id,
                      created_at,
                      updated_at
                  )
                  VALUES (
                      11,
                      'ALEX',
                      'MAGANA',
                      'GATOBU',
                      'alexepicmagana@yahoo.com',
                      '1234567890',
                      2,
                      '2016-10-10 13:48:20.528971',
                      '2016-10-10 13:48:20.528971'
                  );


-- Index: index_users_on_role_id
DROP INDEX IF EXISTS index_users_on_role_id;

CREATE INDEX index_users_on_role_id ON users (
    "role_id"
);


COMMIT TRANSACTION;
PRAGMA foreign_keys = on;
