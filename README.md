# Edmonton Open Data - DBT project

This Project was created to build a mock data warehouse off Edmonton's Open Data portal to practice DBT concepts. 

This project was designed using a Medallion Architecture:

- Bronze (raw_*): Raw landed tables (SQL below creates these).
- Silver (stg_* ): Cleaned, renamed, transformed dbt models.
- Gold (fct_* / dim_*): Star schema with facts and dimensions ready for reporting.

## 💻 1. Setting up the Environment

If you need help setting up DBT, please, refer to the file `README_SETUP_DBT.md` in this repository. 

I used DuckDB to build the Data Warehouse for this project. If need help installing DuckDB and setting up a connection, refer to the `README_SETUP_DUCKDB.md` file in this repository. 


## 🧱 2. Setting up the Data Warehouse

To build the raw tables in the Data Warehouse, run this SQL directly in DuckDB (you can use CLI, Python, or DBeaver): 

```
-------------------------------------------------------
-- CREATE BRONZE LAYER (RAW DATA)
-------------------------------------------------------

CREATE SCHEMA IF NOT EXISTS bronze;

CREATE OR REPLACE TABLE bronze.raw_311_requests (
    row_id BIGINT PRIMARY KEY,
    date_closed VARCHAR,
    date_created VARCHAR,
    year INTEGER,
    month_number INTEGER,
    MONTH VARCHAR,
    request_status VARCHAR,
    status_detail VARCHAR,
    service_category VARCHAR,
    service_description VARCHAR,
    interaction_channel VARCHAR,
    service_area VARCHAR,
    referral_type VARCHAR,
    neighbourhood_id BIGINT,
    neighbourhood VARCHAR,
    ward VARCHAR,
    service_category_service_area VARCHAR,
    service_area_service_category VARCHAR,
    service_area_service_description VARCHAR,
    nbhd_latitude VARCHAR,
    nbhd_longitude VARCHAR,
    nbhd_location VARCHAR,
    ward_latitude VARCHAR,
    ward_longitude VARCHAR,
    ward_location VARCHAR,
    count INTEGER
);


-------------------------------------------------------
-- VERIFY TABLE CREATED
-------------------------------------------------------

DESC TABLE bronze.raw_311_requests ;


-------------------------------------------------------
-- INSERT AND VERIFY RAW DATA
-------------------------------------------------------

-- INSERT RAW data from CSV --- Using DuckDB!!!

INSERT INTO bronze.raw_311_requests 
SELECT * 
FROM '311_Requests_20260914.csv';


-- Inspect the data:

SELECT * 
FROM bronze.raw_311_requests
LIMIT 10; 


-- Check row Count:

SELECT count(0) AS ct 
FROM bronze.raw_311_requests

```


## ▶️ Running the DBT project

Remember to activate the environment:

`.\dbt-env\Scripts\activate`

### Usefull DBT commands:

- `dbt --version` check the dbt version installed
- `dbt -h` help 
- `dbt init` create a new DBT project
- `dbt debug` scan project for issues

### DBT run commands:

- `dbt run` to materialize the models
- `dbt run --exclude tag:never_refresh` to materialize the models, excluding static models that should not be refreshed every run. (i.e.: stg_dim_date)
- `dbt run  --select stg_dim_date` to materialize only the stg_dim_date. 


### DBT test commands:

- `dbt test` to run all tests
- `dbt test --select test_name` to run a specific test


### For Documentation:

- `dbt docs` generate documentation
- `dbt docs -h` help
- `dbt docs generate` creates a documentation website based on project
- `dbt docs serve` starts a webserver on local system and provides access to the documentation.



## 📌 DBT Resources:

- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices

