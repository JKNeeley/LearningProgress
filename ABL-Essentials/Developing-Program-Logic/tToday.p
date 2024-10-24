/*------------------------------------------------------------------------
    File        : tToday.p
    Purpose     : Display today’s date, the day of the month, the month, the year in a single column.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

display today        label "Today is"
    day(today)   label "Day" 
    month(today) label "Month" 
    year(today)  label "Year" format "9999"
    with 1 column.
