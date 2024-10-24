# ABL Essentials 
## Retrieving and displaying data
What is an ABL Block?
- A set of ABL statements executed as a unit

What is an ABL Statement?
- A complete instruction to the AVM at run time. 

What is a Record buffer?
- A memory area for storing database record or field values from one table.

What does the FIND statement do?
- Locates a single record in a table and moves that record into a record buffer 

What is the END-ERROR key used for?
- To interrupt an active procedure 

What symbol represents greater than or equal to?
- (>=)

What is the purpose of word indexing a field?
- Searches the contents of a character field for a word or text string.

Which of the listed operators can be used to fill in the blank in the following statement?
```
FOR EACH Item WHERE ItemName __________"Bat ! Stick ! Pole ":
  DISPLAY ItemNum ItemName.
END.
```
- contains

What is the purpose of the BY option on a FOR EACH statement?
- Sorts the selected records based on the value of a given expression, such as a specified field or group of fields.

What is the purpose of the ALERT-BOX option on the MESSAGE statement?
- Causes a dialog box to display on the screen. It may include enabled buttons which require user input.

## Developing Program Logic
Which data types can you use to define variables?
- character, integer, decimal, date, datetime, rowid, handle

Which function would you use to convert numerical data to character?
- string()

When does the INTEGER function round up or down a decimal value?
- Rounds up if the decimal value is greater than or equal to 0.5 and rounds down if the decimal value is less than 0.5.

What are the three things you specify in the SUBSTRING syntax and the order in which they are specified?
- substring(old string, position to start, number of characters in the substring)

How would you use the NUM-ENTRIES function?
- To find the number of entries in a list, and to repeat the loop the same number of times to process each entry.

When is a CASE statement used instead of the IF...THEN...ELSE statement?
- There are more than two conditional branches, and you want to execute a statement or block for each condition.

## Using Queries
What does the OPEN QUERY statement do?
- Creates a results list of ROWIDs of the records that satisfy the query 

How do you retrieve records from a results list?
- use a get statement

Rewrite the following ABL statement using a shorter syntax:.
```
OPEN QUERY qQuery FOR EACH Order WHERE Order.OrderNum = Orderline.OrderNum
```
- OPEN QUERY qQuery FOR EACH Order OF Orderline

How can a query results list be accessed randomly?
- Define a query with the SCROLLING option, and then use REPOSITION and GET.

Which of the following is true about ROWID?
- A pointer to a record’s location in the database 
- A function that returns a pointer to a record
- A data type for variables that store row IDs

## Creating, Updating, and Deleting Records
What happens when the CREATE statement executes?
- A new record is created in the database.
- Default values are set if they are defined in the data dictionary.
- The CREATE trigger executes if one exists.
- A copy of the record is moved to the record buffer.

How does the ASSIGN statement affect data?
- Moves data into the RECORD buffer.

What is the effect of deleting a parent record without deleting its children?
- You create orphan records that can cause run-time errors, clutter the database, and increase overhead.

## Managing Transactions
Which ABL tools are available to determine whether a transaction is active?
- compile listing, transaction function, debugger

Which ABL blocks can take the TRANSACTION option?
- REPEAT, FOR EACH, DO

Which ABL blocks have the transaction property?
- REPEAT, FOR EACH, DO ON ERROR

Which ABL statements can update the database?
- CREATE, DELETE, ASSIGN

Which option on the DEFINE VARIABLE statement prevents the AVM, at run time, from undoing the variable in a transaction?
- NO-UNDO

## Managing Record Locking
Which of the following prevent a record from being changed by another user?
- EXCLUSIVE-LOCK, SHARE-LOCK

Which type of lock allows you to upgrade to an exclusive lock?
- SHARE-LOCK

Which type of lock cannot be used by users to retrieve a record that is locked by another user using a SHARE-LOCK?
- EXCLUSIVE-LOCK

What are the different locking strategies provided by ABL?
- Optimistic, Pessimistic, Default

Which locking strategy retrieves a record with an EXCLUSIVE-LOCK at run time?
- pessimistic locking

What happens when a deadlock occurs?
- None of the users can continue processing because each user has the same record SHARE-LOCK and each user is trying to acquire an EXCLUSIVE-LOCK to update the record.

What are the benefits of the RELEASE statement?
- RELEASE downgrades a lock to NO-LOCK and removes the current record from the record buffer

## Handling Errors
When an error occurs at runtime, the AVM undoes the processing done in a procedure, trigger, FOR block, or a REPEAT block. For the RETURN keyword, what action does the AVM take at runtime, after undoing processing?
- Returns control to the calling procedure. If there is no calling procedure, returns to the editor.

When an error occurs at runtime, the AVM undoes the processing done in a procedure, trigger, FOR block, or a REPEAT block. For the RETRY keyword, what action does the AVM take at runtime, after undoing processing?
- Repeats the same iteration of the current or specified block.

When an error occurs at runtime, the AVM undoes the processing done in a procedure, trigger, FOR block, or a REPEAT block. For the LEAVE keyword, what action does the AVM take at runtime, after undoing processing?
- Leaves the current or specified block and continues executing the rest of the procedure code.

What is the default response when a QUIT condition occurs in a block with error processing properties?
- Save (commit) the current transaction and then return to the operating system or to the editor.

What is the default response when a STOP condition occurs in a block with error processing properties?
- UNDO the transaction block, and RETRY the startup procedure (if exists)

What is the default response when an ENDKEY condition occurs in a block with error processing properties?
- UNDO, LEAVE the nearest procedure, REPEAT or FOR EACH block.

What is the default response when an END-ERROR condition occurs in a block with error processing properties?
- UNDO, LEAVE on the first screen interaction in a block (acts as an ENDKEY)
- UNDO, RETRY on subsequent screen interactions (acts as an ERROR).

What is the default response when an ERROR condition occurs in a block with error processing properties?
- UNDO, RETRY the nearest procedure, REPEAT, or FOR EACH block
- UNDO, and RETURN ERROR if inside a database trigger

Which of the following blocks is always executed: catch, throw, no-error, finally?
- FINALLY

Which of the following error class or interface can catch all possible error types?
- Progress.Lang.Error

Which of the following class can be used to write user-defined errors?
- Progress.Lang.AppError

Which of the following class represents the error object thrown by the AVM, when an ABL statement raises an error condition?
- Progress.Lang.SysError

Which of the following is true about CATCH blocks?
- An associated block can have multiple CATCH blocks representing different sub-error classes.
- A CATCH block can be nested inside another catch block.

When an error occurs, what is the precedence used by the AVM to look for an error handler?
- NO-ERROR option, CATCH block, Explicit ON-ERROR, Implicit ON-ERROR





























