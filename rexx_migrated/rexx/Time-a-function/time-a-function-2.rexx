/*ช*REXX program displays the elapsed time for a REXX function (or subroutine). */
arg reps .                             /*ช*obtain an optional argument from C.L.*/
if reps==''  then reps=100000          /*ช*Not specified?  No, then use default.*/
call time 'Reset'                      /*ช*only the 1st character is examined.  */
junk = silly(reps)                     /*ช*invoke the  SILLY  function (below). */
/*ช*โโโโบ   CALL SILLY REPS    also works.*/

/*ช*                          The   J   is for the CPU time used   */
/*ช*                                โ   by the REXX program since  */
/*ช*                        โโโโโโโโโ   since the time was  RESET. */
/*ช*                        โ           This is a Regina extension.*/
/*ช*                        โ                                      */
say 'function SILLY took' format(time("J"),,2)  'seconds for' reps "iterations."
/*ช*                             โ                                 */
/*ช*                             โ                                 */
/*ช*            โโโโโโโโโโบโโโโโโโโ                                 */
/*ช*            โ                                                  */
/*ช* The above  2  for the  FORMAT  function displays the time with*/
/*ช* two decimal digits (rounded)  past the decimal point).  Using */
/*ช* a   0  (zero)    would round the  time  to whole seconds.     */
exit                                   /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
silly: procedure               /*ช*chew up some CPU time doing some silly stuff.*/
do j=1  for arg(1) /*ช*wash,  apply,  lather,  rinse,  repeat.  ยทยทยท */
newV1.j=random() date() time() digits() fuzz() form() xrange() queued()
end   /*ช*j*/
return j-1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Time-a-function\time-a-function-2.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
