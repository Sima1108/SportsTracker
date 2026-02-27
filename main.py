from database import init_db, get_connection

if __name__ == "__main__":
    init_db()
    con = get_connection()
    cursor = con.cursor()
    cursor.execute("INSERT INTO user (name, password, email, creation_date) VALUES (?, ?, ?, ?)", ("john_doe", "secure_password", "john.doe@example.com", "2024-01-01"))
    con.commit()
    cursor.execute("SELECT * FROM user")
    users = cursor.fetchall()
    print(users)
    con.close()