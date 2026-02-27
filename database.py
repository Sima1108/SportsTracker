import sqlite3

def get_connection():
    # This function would normally establish a connection to the database
    con_to_db = sqlite3.connect('sportstrackers.db')
    con_to_db.execute("PRAGMA foreign_keys = ON")
    return con_to_db

def init_db():
    # This function would normally initialize the database schema
    con = get_connection()
    cursor = con.cursor()
    with open('schema.sql', 'r') as f:
        cursor.executescript(f.read())
    con.commit()
    con.close()
    return "Database initialized with tables and schema."