# IoT Sensor Data Simulator

This project creates a sample dataset from imaginary IoT sensors, like devices that might measure temperature or computer usage. It stores the readings in Tiger Cloud so you can practise exploring data over time.

Created for the **Global Hack Week Open Source challenge**.

## What does it do?

- Creates four sample sensors and gives each one a type and location.
- Generates a reading from each sensor every five minutes for the past 24 hours.
- Includes sample temperature and CPU usage measurements.
- Provides ready-to-run queries to view recent readings, compare sensors, and summarize changes over time.

The data is generated for practice. It does not come from real physical sensors.

## Try it in Tiger Cloud

1. Open [Tiger Cloud](https://console.cloud.timescale.com/) and create or select a database service.
2. Open the service's SQL editor.
3. Run the setup script: [sql/setup.sql](sql/setup.sql).
4. Run the example queries: [sql/queries.sql](sql/queries.sql).
5. Review the results in the SQL editor.

The setup script creates the sample sensors and their readings. You can run the queries afterward to see the data in different ways.

## Project files

- `sql/setup.sql` — creates the sample sensors and generates their readings.
- `sql/queries.sql` — contains examples for exploring and summarizing the readings.

## Learn more

- [Tiger Data tutorial: Simulate IoT sensor data](https://www.tigerdata.com/docs/learn/tutorials/simulate-iot-sensor-data)
- [Tiger Cloud](https://console.cloud.timescale.com/)
- [Global Hack Week challenge](https://www.mlh.com/events/global-hack-week-open-source-90/challenges/01a11b5c-844d-86ce-9146-6afa2915c842)

**Note:** You can use this project to learn about sensor data and how it changes over time. Never share database passwords or private connection details.
