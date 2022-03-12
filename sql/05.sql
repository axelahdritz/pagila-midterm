-- PART 1:
-- Rewrite the SQL table below to use a maximally efficient column order.
-- You may directly modify this table.

CREATE TABLE project (
    developer_id UUID, 
    created_at TIMESTAMP WITH TIME ZONE,
    updated_at TIMESTAMPTZ,
    author_id BIGINT NOT NULL,
    id SERIAL PRIMARY KEY,
    target_id INTEGER,
    project_id INTEGER NOT NULL UNIQUE,
    action SMALLINT NOT NULL,
    developer_addr INET,
    target_type VARCHAR(2),
    title CHAR(256),
    data TEXT,
);

-- PART 2:
-- Complete the table below describing the number of bytes used by the row created by the following insert statement.
-- Use the original column order defined above,
-- and not your modified order from part 1.

INSERT INTO project VALUES (
    0,
    55,
    NULL,
    NULL,
    NULL,
    'A0EEBC99-9C0B-4EF8-BB6D-6BB9BD380A11',
    NULL,
    NULL,
    88,
    12,
    'now',
    '2022-03-09T18:34:27+00:00'
);

-- Header: 23 (header) + 2 (null_bitmap, more than 8 nullable columns) + 7 (padding) = 32
-- Data: 4 (int) + 4 (padding) + 8 (bigint) + 0 + 0 + 0 + 16 (UUID) + 0 + 0 + 4 (int) + 2 (small int) + 2 (padding) + 8 (timestamp w/ timezone) + 8 (timestamptz) = 56
-- Padding: 0 (header + data already divisible by 8!)
-- Total: 88
