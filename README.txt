The Task Tracker app relies on a many-to-one relationship between two
entities: A task and a user.

A task consists of: A Title, a Description, the time spent
	            (in intervals of 15 minutes), whether or not the 
                    task is complete, and to whom it is assigned.

A user consists of: A name and an email.

The user ID is a foreign key in the task table to reference to whom
the task is assigned.

All user names and emails must be unique.
All task titles must be unique and all assigned users must exist
(property of a foreign key constraint)

The app starts in the index page. The user can either log in if they
have already made an account, or they can make an account using the 
drop down menu in the navbar.

Once the user has been made/has logged in, they can logout with the 
logout link in the navbar. Furthermore, they can view their tasks
in the Task Menu option located in the drop down of the navbar. The
user can also always go to the index page by clicking home.

In the task menu, the user can view their tasks or add a new task. 
The task menu is meant to serve as a starting point for the user's
interaction with the tasks. 

In the view my tasks page, the user can track their complete tasks,
incomplete tasks, and all tasks across all users.

Under the incomplete tasks table, the user can view the task with
the "More" link under task options, they can edit the task (aka 
reassign) the task under the "Edit" link, or they can delete the 
task under the "Delete" link. Once a task is complete, the task 
moves to the corresponding user's complete tasks table with the 
option to delete the task. 

The handling of the time spent in a task was done via the 
changeset function in the schema file. A proper error message
is displayed when the user types in a non-multiple of 15 for the 
time spent. 

Also, the user option is a drop down menu. This is done to ensure 
that any person the user picks is in fact a valid user. If this 
were a textbox or numberbox, the chance of error for the user 
putting in the wrong name or ID increases.
