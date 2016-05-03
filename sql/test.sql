-- Types mostly lifted from 
-- http://www.postgresql.org/docs/9.4/static/datatype.html

CREATE TABLE test_types (
    bigint_t     BIGINT,
    boolean_t    BOOLEAN,
    double_t     DOUBLE PRECISION,
    integer_t    INTEGER,
    text_t       TEXT,
    timestamp_t  TIMESTAMP,
    timestampz_t TIMESTAMP WITH TIME ZONE
);

CREATE SCHEMA schema;

CREATE TABLE schema.test (
    id BIGINT
);

CREATE TABLE test_nullible (
    always_string    TEXT NOT NULL,
    sometimes_string TEXT
);

CREATE TABLE test_pk (
    id BIGINT PRIMARY KEY
);

CREATE TABLE test_skip_bigserial (
    id1 BIGSERIAL PRIMARY KEY,
    id2 BIGINT NOT NULL
);

CREATE TABLE test_fk_1 (
  id BIGSERIAL PRIMARY KEY
);

CREATE TABLE test_fk_2 (
  id BIGSERIAL PRIMARY KEY,
  fk BIGINT NOT NULL REFERENCES test_fk_1(id)
);

CREATE TABLE test_Table_With_Caps (
  id BIGSERIAL PRIMARY KEY,
  someValue TEXT
);

CREATE SCHEMA s1;

CREATE SCHEMA IF NOT EXISTS s2;

CREATE TABLE s1.test (
  id BIGSERIAL PRIMARY KEY
);

CREATE TABLE s2.test2 (
  id BIGSERIAL PRIMARY KEY,
  partner BIGINT NOT NULL REFERENCES s1.test(id)
);

CREATE TABLE test_drop_1 (
  id BIGSERIAL PRIMARY KEY,
  thing INT NOT NULL
);

ALTER TABLE test_drop_1 DROP COLUMN id;