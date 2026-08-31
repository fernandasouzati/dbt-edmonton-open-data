# Set Up DBT

To install dbt Core on a Windows computer, the recommended and most stable method is to install it inside a virtual environment using Python and pip.

Follow these steps to set it up:

# 1. Install Python

- Download Python 3.9, 3.10, or 3.11 from the official Python website https://www.python.org/downloads/
- Run the installer.
- **Important:** Check the box that says "Add python.exe to PATH" before clicking install.

# 2. Create a Virtual Environment

- Open **PowerShell** or **Command Prompt** as an Administrator. Or the **Visual Studio Code Terminal**
- Navigate to the folder where you want your project, then create and activate a isolated environment:

```
# Create a folder for dbt
mkdir dbt-project
cd dbt-project

# Create the virtual environment named "dbt-env"
python -m venv dbt-env

# Activate the environment
.\dbt-env\Scripts\activate
```

# 3. Install dbt Core and your Database Adapter

Do not install just dbt-core. You must install the specific adapter for your data warehouse. 
This will automatically install dbt-core as a dependency. 

Run one of the following commands based on your database:

- For Snowflake: `pip install dbt-snowflake`
- For BigQuery: `pip install dbt-bigquery`
- For PostgreSQL: `pip install dbt-postgres`
- For Redshift: `pip install dbt-redshift`
- For Databricks: `pip install dbt-databricks`
- For DuckDB: `pip install dbt-duckdb`

# 4. Verify the Installation

Run this command to make sure it installed correctly:

`dbt --version`
