
import psycopg2

# Database connection details
hostname = "localhost"
database = "Assignment 2 SOEN 363"
username = "postgres"
pwd = "mac1"
port_id = 5432

# List of tables to drop
tables_to_drop = ["movie", "genre", "movie_genre", "country", "movie_country", "actor", "movie_actor","director","movie_director","language", "movie_language", "keyword", "movie_keyword", "review", "movie_review"]

try:
    # Establish connection to the PostgreSQL database
    conn = psycopg2.connect(
        host=hostname,
        dbname=database,
        user=username,
        password=pwd,
        port=port_id
    )
    cur = conn.cursor()

    # Drop each table in the list
    for table_name in tables_to_drop:
        print(f"Dropping table: {table_name}")  # Optional: Log the table being dropped
        cur.execute(f"DROP TABLE IF EXISTS {table_name} CASCADE;")

    # Commit changes
    conn.commit()
    print("Selected tables dropped successfully.")

except Exception as e:
    print(f"An error occurred: {e}")

finally:
    # Close the database connection
    if cur:
        cur.close()
    if conn:
        conn.close()