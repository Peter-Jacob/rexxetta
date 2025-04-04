/*ͺ*REXX program demonstrates a  method  of  handling events  (this is a timeβdriven pgm).*/
signal on halt                                   /*ͺ*allow user to  HALT  (Break) the pgm.*/
parse arg timeEvent                              /*ͺ*allow the  "event"  to be specified. */
if timeEvent=''  then timeEvent= 5               /*ͺ*Not specified?  Then use the default.*/

event?:  do forever                              /*ͺ*determine if an event has occurred.  */
theEvent= right(time(), 1)              /*ͺ*maybe it's an event, βorβ  maybe not.*/
if pos(theEvent, timeEvent)>0  then  signal happening
end   /*ͺ*forever*/

say 'Control should never get here!'             /*ͺ*This is a logic  canβneverβhappen !  */
halt: say 'ββββββββββββ program halted.'; exit 0 /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
happening: say 'an event occurred at'  time()", the event is:"   theEvent
do while theEvent==right(time(), 1) /*ͺ*spin until a tic (a second) changes. */
nop                                 /*ͺ*replace NOP  with the "process" code.*/
end   /*ͺ*while*/                     /*ͺ*NOP is a REXX statement, does nothing*/
signal event?                         /*ͺ*see if another event has happened.   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Events\events.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
