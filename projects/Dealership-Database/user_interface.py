"""C
   SC 675-SFSU
   Fall 2020
   Final Project
"""

LOGGED_IN = []

def write_in_transaction(query, file):
    with open(file, 'a') as f:
        f.write(query)


def show_menu():
    """
    Prints in console the main menu
    :return: VOID
    """
    print("******************************** WELCOME TO DEALERSHIP DATABASE ********************************")
    print("\nNote: Make sure to log-in before interacting database!!! ")

    print("User Menu \n"
          "1. Create Account \n"
          "2. Login \n"
          "3. Search \n"
          "4. Insert \n"
          "5. Update \n"
          "6. Delete \n"
          "7. Exit \n")


def show_table_names(tables):
    """
    Show all the tables names
    :param tables: a list with the tables names.
                   You can get it by calling the method
                   get_table_names() from DB object
    :return: VOID
    """
    index = 1
    print("\nTables:")
    for table in tables:
        print(table[0])  # print tables names
        index += 1

# option 1 Create Account
def CreateAccount():
    try:
        # get user input
        username = input("\nusername: ")
        password = input("\npassword: ")
        account_type = input("\nAccount Type: ")
        query = """INSERT INTO Account ( username, password, account_type) VALUES ( %s, %s, %s)"""
        transaction_query = """INSERT INTO Account (username, password, account_type) VALUES ({}, {}, {});""".format(
            username, password, account_type)
        # insert values
        values = (username, password, account_type)
        print(query)
        if db.insert(query=query, values=values):
          write_in_transaction(transaction_query, "transactions.sql")
          print("Account successfully created ")

    except:
        print(" Account Creation Failed: ")

# Option 2 LogIn
def LogIn():
    username = input("\nUsername: ")
    password = input("\nPassword: ")
    query = """SELECT username, password, account_type from Account where username = %s AND password = %s"""
    values = (username, password)
    results = db.select(query, values)
    if len(results) == 0:
        print("Username and Password Incorect: ")
    else:
        for result in results:
            username = result[0]
            password = result[1]
            account_type_table = result[2]
            user_data = {'username': username, 'password': password, 'account_type': account_type_table}
            print("you are logged in:")
            return user_data

def option3(db_object, tables):
    """
    Search option
    :param db_object: database object
    :param tables: the name of the tables in the database
    :return: VOID
    """
    try:
        # shows that tables names in menu
        show_table_names(tables)

        # get user input
        table_selected = input("\nSelect a table to search: ")
        attribute_selected = input("Search by (i.e name)? ")

        value_selected = input("Enter the value: ")

        columns = db_object.get_column_names(
            table_selected)  # get columns names for the table selected

        # build queries with the user input
        query = """SELECT * FROM {} WHERE {} = %s""".format(
            table_selected, attribute_selected)
        print(query)

        value = value_selected

        # get the results from the above query
        results = db_object.select(query=query, values=value)
        column_index = 0

        # print results
        print("\n")
        print("Results from: " + table_selected)
        for column in columns:
            values = []
            for result in results:
                values.append(result[column_index])
            print("{}: {}".format(column[0], values))  # print attribute: value
            column_index += 1
        print("\n")

    except Exception as err:  # handle error
        print("The data requested couldn't be found\n")


# option 4 when user selects insert
def option4(db_object, tables):
    try:
        # show tables names
        show_table_names(tables)

        # get user input for insert
        table = input("\nEnter a table to insert data: ")
        attributes_str = input(
            "Enter the name attribute/s separated by comma? ")
        values_str = input("Enter the values separated by comma: ")

        # from string to list of attributes and values
        if "," in attributes_str:  # multiple attributes
            attributes = attributes_str.split(",")
            values = values_str.split(",")
        else:  # one attribute
            attributes = [attributes_str]
            values = [values_str]
        transaction_query = """INSERT INTO (table, attributes_str, values_str) VALUES ({}, {}, {});""".format(table,
                                                                                                              attributes_str,
                                                                                                              values_str)
        if db_object.insert(table=table, attributes=attributes, values=values):
            write_in_transaction(transaction_query, "transactions.sql")
            print("Data successfully inserted into {} \n".format(table))

    except:  # data was not inserted, then handle error
        print("Error:", values_str, "failed to be inserted in ", table, "\n")


# option 5 when user selects update
def option5(db_object, tables):
    try:
        # show tables names
        show_table_names(tables)

        # get user input
        table_selected = input("\nSelect a table: ")
        attribute_selected = input("SET new value (i.e password='cool'): ")
        value_selected = input("specify a attribute (i.e account_id='1') ")
        values = value_selected
        attribute = attribute_selected
        # The account id needed to be casted to int since it is data type integer in the database
        # I fixed the update, now is your job to figure out how to update more values in the same table at once.
        query = """UPDATE {} SET {} WHERE {} """.format(table_selected, attribute_selected, value_selected)
        print(query)
        transaction_query = """UPDATE {} SET {} WHERE {} ;""".format(table_selected, attribute_selected, value_selected)

        if db_object.update(query=query):
            write_in_transaction(transaction_query, "transactions.sql")
            print("Data successfully updated into {} \n".format(table_selected))

    except:
        print("Error: update failed.", table_selected)

        # option 6 when user selects Delete


def option6(db_object, tables):
    """
    Search option
    :param db_object: database object
    :param tables: the name of the tables in the database
    :return: VOID
    """
    try:
        # shows that tables names in menu
        show_table_names(tables)

        # get user input
        table_selected = input("\nSelect a table: ")
        attribute_selected = input("Selet by (i.e name)? ")
        value_selected = input("Enter the value: ")

        # build queries with the user input
        query = """DELETE FROM {} WHERE {} = '{}'""".format(
            table_selected, attribute_selected, value_selected)
        print(query)
        transaction_query = """DELETE FROM {} WHERE {} = '{}';""".format(table_selected, attribute_selected,
                                                                         value_selected)
        values = value_selected
        if db_object.update(query=query):
            write_in_transaction(transaction_query, "transactions.sql")
            print("Data successfully Deleted from table  {} \n".format(table_selected))

    except:
        print("Error: DELETE failed.", table_selected)


##### Driver execution.....
from database import DB

print("Setting up the database......\n")

# DB API object
db = DB(config_file="sqlconfig.conf")

# create a database (must be the same as the one is in your config file)
database = "my_dealership_database"
if db.create_database(database=database, drop_database_first=True):
    print("Created database {}".format(database))
else:
    print("An error occurred while creating database {} ".format(database))

# create all the tables from databasemodel.sql
db.run_sql_file("databasemodel.sql")

# insert sample data from insert.sql
db.run_sql_file("insert.sql")



print("\nSet up process finished\n")

show_menu()
option = int(input("Select one option from the menu: "))

while option != 7:
    if not LOGGED_IN:
        tables = None
        print("login first")
    else:
        tables = db.get_table_names()
    if option == 1:
        CreateAccount()  # create your account
    elif option == 2:
        LOGGED_IN = LogIn() # login
    elif option == 3:
        option3(db, tables)
    elif option == 4:
        option4(db, tables)
    elif option == 5:
        option5(db, tables)
    elif option == 6:
        option6(db, tables)
    show_menu()
    option = int(input("Select one option from the menu: "))

