/*�*REXX program demonstrates four  queueing  operations:   push,  pop,  empty,  query.   */
say '══════════════════════════════════ Pushing five values to the stack.'
do j=1  for 4                            /*�*a  DO  loop to  PUSH  four values.   */
call push  j * 10                        /*�*PUSH   (aka:   enqueue to the stack).*/
say 'pushed value:'    j * 10            /*�*echo the pushed value.               */
if j\==3  then iterate                   /*�*Not equal 3?   Then use a new number.*/
call push                                /*�*PUSH   (aka:   enqueue to the stack).*/
say 'pushed a "null" value.'             /*�*echo what was  pushed  to the stack. */
end   /*�*j*/
say '══════════════════════════════════ Quering the stack  (number of entries).'
say  queued()  ' entries in the stack.'
say '══════════════════════════════════ Popping all values from the stack.'
do k=1  while  \empty()                  /*�*EMPTY (returns  TRUE  [1]  if empty).*/
call pop                                 /*�*POP   (aka:  dequeue from the stack).*/
say k': popped value='  result           /*�*echo the popped value.               */
end   /*�*k*/
say '══════════════════════════════════ The stack is now empty.'
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
push:   queue arg(1);              return        /*�*(The  REXX  QUEUE   is FIFO.)        */
pop:    procedure;  parse pull x;  return x      /*�*REXX   PULL   removes a stack item.  */
empty:  return queued()==0                       /*�*returns the status of the stack.     */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Queue-Usage\queue-usage.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
