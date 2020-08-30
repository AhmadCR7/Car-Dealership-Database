# Final Course Project 

In this project, you will create a real user application by using the database model you created in homework 1 and 2. Please 
refer to the following guidelines to complete your project. Students can implement this project using their favorite 
programming language. Just make sure that the language of your choice supports database implementations. All the 
programming languages have (somehow) libraries that will help students to interact with their databases. 

## Project Guidelines 

Using your database model, and your favorite programming language, create a functional application (console, terminal or GUI) 
to represent the functionality of your database model with real users. Your program must meet the following high level requirements: 

### IMPORTANT: When your program runs for the first time, it must automatically create your database, run the databasemodel.sql script to create the tables for your database, and run the inserts.sql script to insert some sample in those tables. All of this must be done before your program starts to interact with the user.
 
 * Make sure that your app creates a periodically back up of the database. As explained in class, use the transactions.sql to backup your database
 
 * When a table with FKs is queried by the user it must show all the joined data. You must do this in at least three of your tables. For example, if we
   have two tables, employee and company where company id is a FK in the employee table. Instead of showing the id of the company to the user when
   the employee table is queried, you must show the company's name and other important data (at your discretion) from the company table. You will 
   need to use JOINS in order to accomplish this in your program. 

 * The first thing your program needs to do after it is executed is to create your database, tables and insert some sample data using your database model from HW2. Note that this database model should have all the errors encountered in HW2 fixed already. Then, read your transactions.sql file (which is empty at this point). Then, your program must show the following menu to the user. All the credentials needed to create the database must be read from a configuration file or user input. This config file should have at least the following values (host, database_name, username and password). The following will be the initial menu that the program needs to show to the user in screen. 
        
        > User Menu 
        > 1. Create Account 
        > 2. Login 
        > 3. Search
        > 4. Insert 
        > 5. Update
        > 6. Delete 
        > 7. Exit
        
        > Select an option: 1

  * Create user account: the user should be able to create an account in your system. The info provided here depends on the attributes you are required to enter in your account or user table. The following is an example that takes the name, email and password from user input. 
        
        > Name: Jose
        > Email: jortizco@sfsu.com
        > Password: 12345
        
        > Account sucessfully created!
        
        > User Menu 
        > 1. Create Account 
        > 2. Login 
        > 3. Search
        > 4. Insert 
        > 5. Update
        > 6. Delete 
        > 7. Exit
        
        > Select an option: 2
 
 * Login: the user can log into the system using the data provided at registration time. 
 
        > 1. email: jortizco@sfsu.edu
        > 2. password: 12345
        
        >  You are logged as Jose!
        
        > User Menu 
        > 1. Create Account 
        > 2. Login 
        > 3. Search
        > 4. Insert 
        > 5. Update
        > 6. Delete 
        > 7. Exit
        
        > Select an option: 3
        
  * Search: when user selects this option, the user must be able to search for data based on the main entities implemented in your database model.  Take into consideration that a good search functionality should be able to search data from different tables, and show the data organized in the console or terminal. For example, if your database model was modeled for a library system, a good example of a search service in your system would be the following: 
 
       
         > Tables with write/read permissions for Jose. 
         > 1. Book
         > 2. Videos
         > 3. Music
         
         > Select a table to search: 1
         > Enter field: title
         > Enter value: Database System Concepts
         
         > Results: 
         > ISBN:      87736778838
         > Title:     Database System Concepts
         > Author:    Avi Silberschatz
         > Publisher: Parson
           
         > User Menu 
         > 1. Create Account 
         > 2. Login 
         > 3. Search
         > 4. Insert 
         > 5. Update
         > 6. Delete 
         > 7. Exit
        
         > Select an option: 4
         
         
   * Insert: the user of your program must be able to insert data from your database model like in the following example: 
   
         > Tables with write/read permissions for Jose. 
         > 1. Book
         > 2. Videos
         > 3. Music 
           
         > Select a table to insert data: 2
         > Enter fields: ISBM, title, author, length
         > Enter values: 87736773456, my video, jose ortiz, 34
         
         Data succesfully inserted in Video!. 
         
         > User Menu 
         > 1. Create Account 
         > 2. Login 
         > 3. Search
         > 4. Insert 
         > 5. Update
         > 6. Delete 
         > 7. Exit
        
         > Select an option: 5
         
   * Update: the user must be able to update data from your database model. Take into consideration that for update and delete options, you must update or delete all the weak entities that referenced the primary keys of the updated or deleted records. 
         
         > Tables with write/read permissions for Jose. 
         > 1. Book
         > 2. Videos
         > 3. Music 
           
         > Select a table to update data: 2
         > Enter fields: length
         > Enter values: 37
         
         Data succesfully updated in Video!. 
         
         > User Menu 
         > 1. Create Account 
         > 2. Login 
         > 3. Search
         > 4. Insert 
         > 5. Update
         > 6. Delete 
         > 7. Exit
        
         > Select an option: 6
         
         
   * Delete: the user must be able to delete data from your database model
   
         > Tables with write/read permissions for Jose. 
         > 1. Book
         > 2. Videos
         > 3. Music 
         
         > Select a table to delete data: 1
         > Enter field: ISBM
         > Enter value: 87736778838
         
         Data succesfully deleted from Book!. 
         
         > User Menu 
         > 1. Create Account 
         > 2. Login 
         > 3. Search
         > 4. Insert 
         > 5. Update
         > 6. Delete 
         > 7. Exit
        
         > Select an option: 7 
         
## Testing your program

   * This is one of the use cases (among many others) that I will use to test your program. 
       
       1. I will run your program for the first time, and then I will do some inserts, deletes......
       2. I will exit from your program
       3. I will go manually to your database and delete it 
       4. I will run your program again
       5. Your program should detect that the database is not there, and therefore recreate it to its original consistent   
          status before failure. So, it needs to restore the backup database, and any transactions saved in the 
          transactions.sql file until the failure point. The transaction file must only contain write operations.  
           
## Grading Rubrics
  
   1. This project is worth 20% of your final grade, and will be graded using a point scale where the maximum possible 
      grade is 100 points. For example, a grade of 80/100 in this project will be converted to 0.80 * 20% = 16% of 20%
   2. If your program runs without errors, automatically creates a database, tables, insert sample data, and you provided
      the expected docs, then +50 points
   3. If any of the requirements from step 3 is missing, I will stop there, and I will apply a grade (at my discretion) 
      depending on how much work the student has done in the project. However, this grade will be way below the 50 points threshold. 
      Please make sure to test your project properly before submission to avoid this situation
   4. For each option of the menu that is implemented (after step 2 is successfully executed), then +5 points
   5. If the transactions.sql file is correctly implemented +5 points
   6. If your program pass my 10 quality assurance tests (at my discretion) then, + 1O points
   7. Class policies on cheating and plagiarism stated on the class syllabus are applied to this project. 
   8. If a student decides to create a GUI program, take into account that I won't grade the GUI part or the 
      usability of the program. I will grade only the code that interacts with the database. However, since
      creating a GUI program is a lot of work, I will reward this student's work with some extra-credit points. 
    
## Submission Guidelines 
   
   1. By the project's deadline, set the table of assignments (found on main README file) to complete or done for this project. Take into consideration that
   the due date for this project will be the last day of the semester for databases, and if I see a "not completed" set
   in the table of assignments for this project, I will assume that this student did not submit the
   project. Thus, the project won't be graded. 
        
