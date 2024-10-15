# PostgreSQL Data Archiving Script

This Python script is designed for archiving data from multiple PostgreSQL databases. It establishes connections to source and archive databases and performs archiving operations based on specified configurations for each table.

## Prerequisites

Ensure the following prerequisites are met before using the script:

- Python installed (version 3.6 or later)
- PostgreSQL installed
- Required Python packages installed: `psycopg2`

```bash
pip install psycopg2


## Configuration
The script uses a configuration file (db.properties) or environment variables for database connection details. Ensure either the configuration file is present or the required environment variables are set.


Configuration File (db.properties)
If using a configuration file, create a db.properties file in the script's directory with the following format:

[ARCHIVE]
ARCHIVE_DB_HOST = your_archive_db_host
ARCHIVE_DB_PORT = your_archive_db_port
ARCHIVE_DB_NAME = your_archive_db_name
ARCHIVE_SCHEMA_NAME = your_archive_schema_name
ARCHIVE_DB_UNAME = your_archive_db_username
ARCHIVE_DB_PASS = your_archive_db_password
BATCH_SIZE=1000
[Databases]
DB_NAMES = db_name1, db_name2

[db_name1]
SOURCE_DB_HOST = source_db_host1
SOURCE_DB_PORT = source_db_port1
SOURCE_DB_NAME = source_db_name1
SOURCE_SCHEMA_NAME = source_schema_name1
SOURCE_DB_UNAME = source_db_username1
SOURCE_DB_PASS = source_db_password1

[db_name2]
SOURCE_DB_HOST = source_db_host2
SOURCE_DB_PORT = source_db_port2
SOURCE_DB_NAME = source_db_name2
SOURCE_SCHEMA_NAME = source_schema_name2
SOURCE_DB_UNAME = source_db_username2
SOURCE_DB_PASS = source_db_password2

Environment Variables
Alternatively, set the following environment variables:
export ARCHIVE_DB_HOST=your_archive_db_host
export ARCHIVE_DB_PORT=your_archive_db_port
export ARCHIVE_DB_NAME=your_archive_db_name
export ARCHIVE_SCHEMA_NAME=your_archive_schema_name
export ARCHIVE_DB_UNAME=your_archive_db_username
export ARCHIVE_DB_PASS=your_archive_db_password
export BATCH_SIZE=1000

export DB_NAMES=db_name1,db_name2

export DB_NAME1_SOURCE_DB_HOST=source_db_host1
export DB_NAME1_SOURCE_DB_PORT=source_db_port1
export DB_NAME1_SOURCE_DB_NAME=source_db_name1
export DB_NAME1_SOURCE_SCHEMA_NAME=source_schema_name1
export DB_NAME1_SOURCE_DB_UNAME=source_db_username1
export DB_NAME1_SOURCE_DB_PASS=source_db_password1

export DB_NAME2_SOURCE_DB_HOST=source_db_host2
export DB_NAME2_SOURCE_DB_PORT=source_db_port2
export DB_NAME2_SOURCE_DB_NAME=source_db_name2
export DB_NAME2_SOURCE_SCHEMA_NAME=source_schema_name2
export DB_NAME2_SOURCE_DB_UNAME=source_db_username2
export DB_NAME2_SOURCE_DB_PASS=source_db_password2

Running the Script
Execute the script by running the following command:
python script_name.py

Replace script_name.py with the actual name of the Python script

## Archiving Operations
The script supports the following archiving operations for each table:
*operation_type in table_info.json:

- Delete: Delete records from the source table.
- Archive_Delete: Archive records to an archive table and then delete them from the source table.
- None: Skip archival for the specified table.
Ensure to review and customize the tables_info in the script to match your database structure and archiving requirements.

Retrieving Table Information from JSON File or Container Volume
The script attempts to load table information from a JSON file ({db_name.lower()}_archive_table_info.json). If the file is not found, it tries to retrieve the information from a container volume specified by the CONTAINER_VOLUME_PATH environment variable.

Set the CONTAINER_VOLUME_PATH environment variable to the path of the container volume containing the JSON file.
