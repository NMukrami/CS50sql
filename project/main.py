import sqlite3
import os
import subprocess
import time
from art import *
from pwinput import pwinput


def main():
    clear()
    intro_text("welcome")
    username = input("username: ").strip()
    password = pwinput("password: ", "*").strip()

    # for admin to enter sqlite
    if admin_authenticate(username, password):
        print("SQLite3 opened")

    # for user
    elif user_authenticate(username, password):
        clear()
        print("Authentication successful!")
        # get user id in db but in list
        user_id = get_login_usernames(username)
        # convert list to int
        sender_id = user_id[0]

        while True:
            choice = input("Do you want to send a message (S) or check the message inbox (I) or exit (E)?").upper().strip()
            clear()
            if choice == "S":
                try:
                    usernames_idx = get_usernames_list()
                    print("Contacts list:")
                    # display list of contact start with 1 instead of 0
                    for idx, user in enumerate(usernames_idx, start=1):
                        print(f"{idx}. {user}")
                    print()

                    receiver_index = int(input("Enter the number of username: ")) - 1
                    receiver_id = receiver_index + 1
                    # check whether the user selects the user number in the list or not
                    if 0 <= receiver_index < len(usernames_idx):
                        # check whether user pick himself or not
                        if user_id[0] != receiver_id:
                            print()
                            content = input("Enter your message: ")
                            update_conversation()
                            conversation_id = update_participant(sender_id, receiver_id)
                            send_message(conversation_id, sender_id, receiver_id, content)
                            clear()
                            print("Message sent successfully!")

                        else:
                            print("can't choose yourself to send a message. please try again")
                            print()

                    else:
                        print("Invalid username selection.")
                        print()

                except ValueError:
                    print("Please enter a number.")

            elif choice == "I":
                inbox = my_inbox(username)
                # Print column
                print("Time\t\t\tFrom\t\tMessage")
                # Print each item in row
                for sender, message, sent in inbox:
                    print(f"{sent}\t{sender}\t{message}")
                print()

            elif choice == "E":
                print("Exiting...")
                break
            else:
                print("Invalid choice. Please enter 'S' to send a message or 'I' to check inbox or 'E' to exit.")
    else:
        clear()
        print("Restarting...")
        time.sleep(2)
        main()


def admin_authenticate(username, password):
    """
    authenticate for admin to access db & return true if match else return false
    """
    if username == "admin" and password == "admin":
        clear()
        print("Authentication successful!. opening sqlite...")
        time.sleep(1.5)
        clear()
        open_sqlite3()

def user_authenticate(username, password):
    """
    make sure login information match in users database & return true if match else return false
    """
    connection = sqlite3.connect('project.db')
    db = connection.cursor()
    db.execute("SELECT COUNT(*) FROM users WHERE username = ? AND password = ?", (username, password))
    count = db.fetchone()[0]
    connection.close()
    return count > 0

def get_login_usernames(login_username):
    """
    fetch data from id column from users table in database & return id that match login information (username)
    """
    connection = sqlite3.connect('project.db')
    db = connection.cursor()
    db.execute(f"SELECT id, username FROM users WHERE username = ? ORDER BY id", (login_username,))
    rows = db.fetchall()
    usernames = [row[0] for row in rows]
    connection.close()
    return usernames

def get_usernames_list():
    """
    fetch data from username column from users table in database & return all the list of username
    """
    connection = sqlite3.connect('project.db')
    db = connection.cursor()
    db.execute("SELECT username FROM users ORDER BY id")
    usernames = [row[0] for row in db.fetchall()]
    connection.close()
    return usernames

def update_conversation():
    """
    update conversation table in database
    """
    connection = sqlite3.connect('project.db')
    db = connection.cursor()
    db.execute("INSERT INTO conversation DEFAULT VALUES")
    connection.commit()
    connection.close()

def update_participant(user_id_sender, user_id_reciver):
    """
    update participant table in database
    """
    connection = sqlite3.connect('project.db')
    db = connection.cursor()
    id = db.execute("SELECT id FROM conversation ORDER BY id DESC LIMIT 1")
    rows = id.fetchall()
    conversation_id = str(rows[0][0])
    db.execute("INSERT INTO participant (user_id, conversation_id) VALUES(?, ?)", (user_id_sender, conversation_id))
    db.execute("INSERT INTO participant (user_id, conversation_id) VALUES(?, ?)", (user_id_reciver, conversation_id))
    connection.commit()
    connection.close()
    return conversation_id

def send_message(conversation_id, sender_id, receiver_id, content):
    """
    update message table in database
    """
    connection = sqlite3.connect('project.db')
    db = connection.cursor()
    db.execute("INSERT INTO message (conversation_id, sender_id, receiver_id, content) VALUES (?, ?, ?, ?)", (conversation_id, sender_id, receiver_id, content))
    connection.commit()
    connection.close()

def my_inbox(receiver):
    """
    return inbox masseage for user that login
    """
    connection = sqlite3.connect('project.db')
    db = connection.cursor()
    db.execute("SELECT `from`, `message`, `sent` FROM my_inbox WHERE `to` = ?", (receiver,))
    inbox = db.fetchall()
    connection.close()
    return inbox

def clear():
    """
    clear the terminal
    """
    os.system('cls' if os.name == 'nt' else 'clear')

def open_sqlite3():
    """
    open sqlite terminal & connect to database
    """
    subprocess.call(["sqlite3", "project.db"])

def intro_text(text):
    """
    display text when run the program
    """
    Art=text2art(text,font='block',chr_ignore=True)
    print(Art)

if __name__ == "__main__":
    main()
