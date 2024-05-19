import mysql.connector as connector

def connect_to_database():
    try:
        # Replace with your actual MySQL connection details
        connection = connector.connect(
            host="127.0.0.1",
            user="root",     # Replace with your MySQL username           
            password="theGis@123",
            database="littlelemondb"
        )

        if connection.is_connected():
            print("Connection successful!")
            return connection

    except connector.Error as e:
        print(f"Error: {e}")
        return None

def show_tables(connection):
    try:
        cursor = connection.cursor()
        show_tables_query = "SHOW TABLES"
        cursor.execute(show_tables_query)

        # Fetch all rows from the executed query
        tables = cursor.fetchall()

        # Print the fetched tables
        print("Tables in the database:")
        for table in tables:
            print(table[0])

    except connector.Error as e:
        print(f"Error: {e}")

    finally:
        if connection.is_connected():
            cursor.close()
            connection.close()
            print("Connection closed.")

if __name__ == "__main__":
    conn = connect_to_database()
    if conn:
        show_tables(conn)
