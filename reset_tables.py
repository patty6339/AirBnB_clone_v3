#!/usr/bin/env python3

from sqlalchemy import create_engine, inspect
from sqlalchemy.orm import sessionmaker
from models.base_model import Base
from models.city import City
from models.state import State
from models.place import Place

# Replace with your actual database credentials
username = 'hbnb_dev'
password = 'hbnb_dev_pwd'
host = 'localhost'
database = 'hbnb_dev_db'

# Create an engine to connect to the MySQL database
engine = create_engine(
    f'mysql+mysqldb://{username}:{password}@{host}/{database}'
)

# Create an inspector to get database and table information
inspector = inspect(engine)

# Print the names of all databases
print("Databases:")
for db in inspector.get_schema_names():
    print(f" - {db}")

# Print the names of all tables in the specified database
print(f"\nTables in database '{database}':")
for table_name in inspector.get_table_names(schema=database):
    print(f" - {table_name}")


# Drop all tables
Base.metadata.drop_all(engine)
print("\nAll tables dropped.")

# Recreate all tables
Base.metadata.create_all(engine)
print("All tables recreated successfully.")

# Print the names of all tables in the specified database after recreation
print(f"\nTables in database '{database}' after recreation:")
for table_name in inspector.get_table_names(schema=database):
    print(f" - {table_name}")
