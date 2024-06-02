import mysql.connector as connector

def connect_to_database():
    try:
        # Replace with your actual MySQL connection details
        connection = connector.connect(
            host="127.0.0.1",
            user="root",     # Replace with your MySQL username           
            password="xxxxxx",
            database="littlelemondb"
        )

        if connection.is_connected():
            print("Connection successful!")
            return connection

    except connector.Error as e:
        print(f"Error: {e}")
        return None

def query_database(connection):
    try:
        cursor = connection.cursor()
        query = "SELECT * FROM customers;"
        cursor.execute(query)

        # Fetch all rows from the executed query
        rows = cursor.fetchall()

        # Print the fetched rows
        for row in rows:
            print(row)

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
        query_database(conn)
