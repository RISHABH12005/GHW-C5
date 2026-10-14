-- Simulated IoT dataset for Tiger Cloud / TimescaleDB.
-- Run in your Tiger Cloud service SQL editor.
CREATE EXTENSION IF NOT EXISTS timescaledb;

CREATE TABLE IF NOT EXISTS sensors (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    location VARCHAR(50) NOT NULL,
    UNIQUE (type, location)
);

CREATE TABLE IF NOT EXISTS sensor_data (
    time TIMESTAMPTZ NOT NULL,
    sensor_id INTEGER NOT NULL REFERENCES sensors(id),
    temperature DOUBLE PRECISION NOT NULL,
    cpu DOUBLE PRECISION NOT NULL
);

SELECT create_hypertable('sensor_data', 'time', if_not_exists => TRUE);

INSERT INTO sensors (type, location) VALUES
    ('a', 'floor'), ('a', 'ceiling'), ('b', 'floor'), ('b', 'ceiling')
ON CONFLICT (type, location) DO NOTHING;

-- Generate five-minute readings for the prior 24 hours without duplicating
-- identical sensor/timestamp rows on re-run.
INSERT INTO sensor_data (time, sensor_id, cpu, temperature)
SELECT gs.time, s.id, random(), random() * 100
FROM generate_series(
    date_trunc('minute', now()) - INTERVAL '24 hours',
    date_trunc('minute', now()),
    INTERVAL '5 minutes'
) AS gs(time)
CROSS JOIN sensors AS s
WHERE NOT EXISTS (
    SELECT 1 FROM sensor_data existing
    WHERE existing.sensor_id = s.id AND existing.time = gs.time
);

SELECT id, type, location FROM sensors ORDER BY id;
SELECT COUNT(*) AS total_readings,
       MIN(time) AS first_reading, MAX(time) AS last_reading
FROM sensor_data;
