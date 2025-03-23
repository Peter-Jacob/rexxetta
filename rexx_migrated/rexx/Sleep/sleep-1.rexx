/*ª*REXX program sleeps  X  seconds  (the number of seconds is supplied via the argument).*/
parse arg secs .                                 /*ª*obtain optional argument from the CL.*/
if secs=='' | secs==","  then secs=0             /*ª*Not specified?  Then assume 0 (zero).*/
say 'Sleeping'    secs    "seconds."             /*ª*inform the invoker what's happening. */
call delay secs                                  /*ª*Snooze.  Hopefully, just a short nap.*/
say 'Awake!'                                     /*ª*and now inform invoker we're running.*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sleep\sleep-1.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
