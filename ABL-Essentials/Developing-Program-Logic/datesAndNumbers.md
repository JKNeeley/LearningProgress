# Date Functions
What date expression would return the month that this employee began work?
- month(startDate)

How would you find out the year the employee started work?
- year(startDate)

# Numerical Functions
*write an expression for each:*
| Description | Expression |
| ----- | ----- |
| Display 256.1234 with two decimal places. | truncate(256.1234,2) |
| Convert 15.23 to an integer value. | integer(15.23) |
| Calculate the remainder when you divide 29 by 3. | 29 modulo 3 |

What does dAmount represent in the following code sample?
```
define variable dAmount as decimal no-undo.
assign 
    dAmount = (orderLine.Price * Orderline.Qty)
* ((100 – Orderline.Discount) / 100).
```
- Extended price including any discount calculations.

