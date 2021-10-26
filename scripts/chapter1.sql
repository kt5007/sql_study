-- 1.1
CREATE TABLE sample.Jyushoroku
(
    toroku_bango    INTEGER         NOT NULL,
    namae           VARCHAR(128)    NOT NULL,
    jyusho          VARCHAR(256)    NOT NULL,
    tel_no          CHAR(10)        ,
    mail_address    CHAR(20)        ,
    PRIMARY KEY (toroku_bango)
);

-- 1.2
ALTER TABLE sample.Jyushoroku ADD COLUMN yubin_bango CHAR(10) NOT NULL;

-- 1.3
DROP TABLE sample.Jyushoroku;

-- 1.4
-- There doesn't have a way to recover table
CREATE TABLE sample.Jyushoroku
(
    toroku_bango    INTEGER         NOT NULL,
    namae           VARCHAR(128)    NOT NULL,
    jyusho          VARCHAR(256)    NOT NULL,
    tel_no          CHAR(10)        ,
    mail_address    CHAR(20)        ,
    yubin_bango     CHAR(10)        NOT NULL,
    PRIMARY KEY (toroku_bango)
);