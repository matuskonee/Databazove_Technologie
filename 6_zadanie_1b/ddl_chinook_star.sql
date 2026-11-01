CREATE DATABASE IF NOT EXISTS chinook_dw;
USE chinook_dw;

-- ============ DIMENZIE ============

CREATE TABLE dim_date (
    date_key      INT PRIMARY KEY,          -- napr. 20090131
    full_date     DATE NOT NULL,
    year          SMALLINT NOT NULL,
    quarter       TINYINT NOT NULL,
    month         TINYINT NOT NULL,
    month_name    VARCHAR(20) NOT NULL,
    day           TINYINT NOT NULL,
    day_of_week   TINYINT NOT NULL,
    day_name      VARCHAR(20) NOT NULL,
    is_weekend    BOOLEAN NOT NULL
);

CREATE TABLE dim_customer (
    customer_key      INT AUTO_INCREMENT PRIMARY KEY,
    customer_id       INT NOT NULL,          -- business key
    first_name        VARCHAR(40) NOT NULL,
    last_name         VARCHAR(20) NOT NULL,
    company           VARCHAR(80),
    address           VARCHAR(70),
    city              VARCHAR(40),
    state             VARCHAR(40),
    country           VARCHAR(40),
    postal_code       VARCHAR(10),
    phone             VARCHAR(24),
    email             VARCHAR(60),
    support_rep_name  VARCHAR(60)            -- z Employee
);

CREATE TABLE dim_track (
    track_key        INT AUTO_INCREMENT PRIMARY KEY,
    track_id         INT NOT NULL,           -- business key
    track_name       VARCHAR(200) NOT NULL,
    composer         VARCHAR(220),
    milliseconds     INT,
    bytes            INT,
    album_id         INT,
    album_title      VARCHAR(160),
    artist_id        INT,
    artist_name      VARCHAR(120),
    genre_id         INT,
    genre_name       VARCHAR(120),
    media_type_id    INT,
    media_type_name  VARCHAR(120)
);

-- ============ FAKTOVÁ TABUĽKA ============

CREATE TABLE fact_sales (
    sales_key        BIGINT AUTO_INCREMENT PRIMARY KEY,
    date_key         INT NOT NULL,
    customer_key     INT NOT NULL,
    track_key        INT NOT NULL,
    invoice_id       INT NOT NULL,           -- degenerate dimension
    invoice_line_id  INT NOT NULL,
    unit_price       DECIMAL(10,2) NOT NULL,
    quantity         INT NOT NULL,
    line_total       DECIMAL(10,2) NOT NULL, -- unit_price * quantity
    CONSTRAINT fk_fact_date     FOREIGN KEY (date_key)     REFERENCES dim_date(date_key),
    CONSTRAINT fk_fact_customer FOREIGN KEY (customer_key) REFERENCES dim_customer(customer_key),
    CONSTRAINT fk_fact_track    FOREIGN KEY (track_key)    REFERENCES dim_track(track_key)
);

CREATE INDEX idx_fact_date     ON fact_sales(date_key);
CREATE INDEX idx_fact_customer ON fact_sales(customer_key);
CREATE INDEX idx_fact_track    ON fact_sales(track_key);

-- ============ VOLITEĽNÝ BRIDGE ============

CREATE TABLE dim_playlist (
    playlist_key  INT AUTO_INCREMENT PRIMARY KEY,
    playlist_id   INT NOT NULL,
    name          VARCHAR(120)
);

CREATE TABLE bridge_track_playlist (
    track_key     INT NOT NULL,
    playlist_key  INT NOT NULL,
    PRIMARY KEY (track_key, playlist_key),
    CONSTRAINT fk_br_track    FOREIGN KEY (track_key)    REFERENCES dim_track(track_key),
    CONSTRAINT fk_br_playlist FOREIGN KEY (playlist_key) REFERENCES dim_playlist(playlist_key)
);