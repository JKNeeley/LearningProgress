/*****************************
    Program: CrOrd.p
    Modified by Jade Neeley
*****************************/

trigger procedure for create of Order.

/* Automatically Increment Order Number using NextOrdNum Sequence */
assign Order.OrderNum =  next-value(NextOrdNum) 

/* Set Order Date to TODAY, Promise Date to 1 week from TODAY */
Order.OrderDate = today
Order.PromiseDate = today + 7.

