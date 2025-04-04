/*ª*REXX program displays integers until a   CtrlâC  is pressed, then shows the number of */
/*ª*ââââââââââââââââââââââââââââââââââ seconds that have elapsed since start of execution.*/
call time 'Reset'                                /*ª*reset the REXX elapsed timer.        */
signal on halt                                   /*ª*HALT: signaled via a  CtrlâC  in DOS.*/

do j=1                                        /*ª*start with  unity  and go ye forth.  */
say right(j,20)                               /*ª*display the integer right-justified. */
t=time('E')                                   /*ª*get the REXX elapsed time in seconds.*/
do forever;   u=time('Elapsed')  /*ª* "   "    "     "      "   "    "    */
if u<t | u>t+.5  then iterate j  /*ª* ââââ passed midnight or  Â½  second. */
end   /*ª*forever*/
end   /*ª*j*/

halt: say  'program HALTed, it ran for'   format(time("ELapsed"),,2)     'seconds.'
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Handle-a-signal\handle-a-signal.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
