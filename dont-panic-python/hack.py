from cs50 import SQL


# connection to the database
db = SQL("sqlite:///dont-panic.db")

# prompted for a password.
password = input("Enter a password: ")

#  executed SQL query on the database.
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    password
)
