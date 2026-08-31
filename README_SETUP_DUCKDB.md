# Set Up DuckDB

## DuckDB CLI (Command Line Interface)

As our Data Warehouse, we'll use DuckDB, follow instructions below to install DuckDB CLI: 

- Download the installer from DuckDB official website: https://duckdb.org/install/?platform=windows&environment=cli
- Extract the zip file, you should find a file "duckdb.exe"
- Move this file to the folder "Scripts" inside your virtual environment folder (i.e.: your_env/Scripts)
- Now, you can use duckdb in the VS Code terminal. Type in your terminal: `duckdb my_database.duckdb`
- It'll open a command line, type `desc;` and hit enter. It'll create a phisical database file in your system. 
- type `.exit` to close DUCKDB terminal.

## DBeaver

DBeaver Community is a free, open-source database management tool recommended for personal projects. 

1. Install DBeaver from the official website:  https://dbeaver.io/download/

2. Create a connection to the DuckDB: 

	- Go to Database > **New Database Connection**.
	- Search for **DuckDB** in the list, select it, and click Next.
	- Locate the Path field in the connection settings, click Browse and select your local DuckDB database file (e.g., my_data.db or my_data.duckdb).
	- Click the **Test Connection** button at the bottom.
	- A prompt will appear asking to download the official DuckDB JDBC driver from Maven. Click **Download**.
	- Once the test succeeds with a green checkmark, click **Finish**.

