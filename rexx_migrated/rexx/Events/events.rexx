/*�*REXX program demonstrates a  method  of  handling events  (this is a time─driven pgm).*/
signal on halt                                   /*�*allow user to  HALT  (Break) the pgm.*/
parse arg timeEvent                              /*�*allow the  "event"  to be specified. */
if timeEvent=''  then timeEvent= 5               /*�*Not specified?  Then use the default.*/

event?:  do forever                              /*�*determine if an event has occurred.  */
theEvent= right(time(), 1)              /*�*maybe it's an event, ─or─  maybe not.*/
if pos(theEvent, timeEvent)>0  then  signal happening
end   /*�*forever*/

say 'Control should never get here!'             /*�*This is a logic  can─never─happen !  */
halt: say '════════════ program halted.'; exit 0 /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
happening: say 'an event occurred at'  time()", the event is:"   theEvent
do while theEvent==right(time(), 1) /*�*spin until a tic (a second) changes. */
nop                                 /*�*replace NOP  with the "process" code.*/
end   /*�*while*/                     /*�*NOP is a REXX statement, does nothing*/
signal event?                         /*�*see if another event has happened.   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Events\events.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
