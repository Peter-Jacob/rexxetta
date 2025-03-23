/*�*REXX program to demonstrate FIFO queue usage by some simple operations*/
call viewQueue
a="Fred"
push                                   /*�*puts a  "null" on top of queue.*/
push a 2                               /*�*puts  "Fred 2" on top of queue.*/
call viewQueue

queue "Toft 2"                         /*�*put  "Toft 2"  on queue bottom.*/
queue                                  /*�*put a "null"   on queue bottom.*/
call viewQueue
do n=1  while queued()\==0
parse pull xxx
say "queue entry" n': ' xxx
end   /*�*n*/
call viewQueue
exit                                   /*�*stick a fork in it, we're done.*/
/*�*──────────────────────────────────viewQueue subroutine────────────────*/
viewQueue:  if queued()==0 then say 'Queue is empty'
else say 'There are' queued() 'elements in the queue'
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Queue-Definition\queue-definition.rexx was migrated on 23 Mar 2025 at 10:43:25
 * -------------------------------------------------------------------------
*/ 
