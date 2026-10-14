# Simulate an IoT Sensor Dataset with Tiger Cloud

This repository implements the Global Hack Week challenge to simulate an IoT sensor dataset in Tiger Cloud and run basic time-series queries.

## What it creates
- A relational `sensors` table containing sensor type and location metadata.
- A time-series `sensor_data` table with timestamps, sensor IDs, temperature, and CPU measurements.
- Four sample sensors and five-minute readings over the previous 24 hours.
- Queries for recent readings, per-sensor averages, and time-bucket summaries.

## Run the challenge
1. Create or select a service in [Tiger Cloud](https://console.cloud.timescale.com/).
2. Open the service's SQL editor.
3. Run [sql/setup.sql](sql/setup.sql).
4. Run [sql/queries.sql](sql/queries.sql) and review the results.
5. Capture a screenshot of your SQL results or share the Tiger Cloud service link. Never share a connection URI containing credentials.

## Notes
The hypertable and `time_bucket` statements require the TimescaleDB extension, available in Tiger Cloud. Vanilla PostgreSQL users can create the tables and generate rows, but must skip TimescaleDB-specific statements.

The default data generator creates one measurement every five minutes per sensor for the past 24 hours. CPU values range from 0 to 1 and temperatures from 0 to 100. The setup script avoids duplicating matching readings when rerun.

## Files
- `sql/setup.sql` — creates tables, inserts four sensors, and generates sample measurements.
- `sql/queries.sql` — validation and analytics queries.

## References
- [Official Tiger Data tutorial](https://www.tigerdata.com/docs/learn/tutorials/simulate-iot-sensor-data)
- [MLH challenge](https://www.mlh.com/events/global-hack-week-open-source-90/challenges/01a11b5c-844d-86ce-9146-6afa2915c842)

## Security
Never commit database passwords, API keys, or connection strings to this repository.
