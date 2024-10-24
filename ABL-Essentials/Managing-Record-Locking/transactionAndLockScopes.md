*consider the following program*
```
/* lLock.p */

repeat:
  prompt-for Customer.CustNum.
  find Customer using CustNum.
  update Name CreditLimit.
  for each Order of Customer:
    display OrderNum OrderDate.
    for each OrderLine of Order, 
             Item of OrderLine:
      display LineNum ItemName Qty OrderLine.Price.
    end. /* FOR EACH Orderline */
  end. /* FOR EACH Order */
end. /* REPEAT */
```

Identify the scope of the transaction
- The RepOrdblk block and the ForCustblk block both determine transaction scope. The Repordlineblk block is a subtransaction block within an existing transaction, RepOrdblk

Identify the scope of each record buffer

| This record buffer… | Is scoped to this block… |
| ----- | ----- |
| Customer | repblk |
| Order | forblk1 |
| OrderLine | forblk2 |
| Item | forblk2 |

Identify the type and duration of the lock on each record

| Record | Lock type | Block in which the lock is acquired | Upgraded or released in |
| ----- | ----- | ----- | ----- |
| Customer | share | repblk | - |
| Customer | exclusive | repblk | repblk |
| Order | share | forblk1 | repblk |
| OrderLine | share | forblk2 | repblk |
| Item | share | forblk2 | repblk |

How does the locking strategy of this procedure affect other users’ access to the database?
- If every OrderLine record for every order for the customer in question is share locked then the records are unavailable for update to other users until the end of the transaction (end of REPEAT block).

How does the locking strategy of this procedure affect the execution of this procedure?
- The AVM might suspend execution of the inner FOR EACH block if the procedure must wait for an upgrade from SHARE-LOCK to EXCLUSIVE-LOCK for a Customer record










