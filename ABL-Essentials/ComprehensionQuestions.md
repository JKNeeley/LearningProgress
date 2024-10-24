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











