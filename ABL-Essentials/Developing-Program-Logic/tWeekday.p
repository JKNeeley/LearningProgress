
/*------------------------------------------------------------------------
    File        : tWeekday.p
    Purpose     : Display a message for the part of the week.
    Description : If today is Monday or Tuesday, display a message that it is the beginning of the week. If today is Wednesday, display a message that it is Wednesday. If today is Thursday or Friday, then display a message that the weekend is coming soon. If today is Saturday or Sunday, display a message that it is the weekend.
    Author(s)   : Jade Neeley
  ----------------------------------------------------------------------*/

case weekday(today):
    when 2 or when 3 
        then display "It's the beginning of the week".
    when 4
        then display "It's Wednesday".
    when 5 or when 6
        then display "The weekend is coming soon".
    otherwise display "It's the weekend".
end case.
