-- 1. Inspect the latest measurements.
SELECT d.time, s.type, s.location, d.temperature, d.cpu
FROM sensor_data AS d
JOIN sensors AS s ON s.id = d.sensor_id
ORDER BY d.time DESC
LIMIT 20;

-- 2. Average readings by sensor over the last 24 hours.
SELECT s.id, s.type, s.location, COUNT(*) AS reading_count,
       ROUND(AVG(d.temperature)::numeric, 2) AS avg_temperature,
       ROUND(AVG(d.cpu)::numeric, 3) AS avg_cpu
FROM sensor_data AS d
JOIN sensors AS s ON s.id = d.sensor_id
WHERE d.time >= now() - INTERVAL '24 hours'
GROUP BY s.id, s.type, s.location
ORDER BY s.id;

-- 3. Fifteen-minute buckets (TimescaleDB).
SELECT time_bucket(INTERVAL '15 minutes', time) AS bucket, sensor_id,
       ROUND(AVG(temperature)::numeric, 2) AS avg_temperature,
       ROUND(AVG(cpu)::numeric, 3) AS avg_cpu, COUNT(*) AS samples
FROM sensor_data
WHERE time >= now() - INTERVAL '6 hours'
GROUP BY bucket, sensor_id
ORDER BY bucket DESC, sensor_id;

-- 4. Maximum temperature by sensor.
SELECT s.id, s.type, s.location,
       ROUND(MAX(d.temperature)::numeric, 2) AS max_temperature
FROM sensor_data AS d
JOIN sensors AS s ON s.id = d.sensor_id
GROUP BY s.id, s.type, s.location
ORDER BY max_temperature DESC;
