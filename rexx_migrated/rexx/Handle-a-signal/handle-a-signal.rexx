/*�*REXX program displays integers until a   Ctrl─C  is pressed, then shows the number of */
/*�*────────────────────────────────── seconds that have elapsed since start of execution.*/
call time 'Reset'                                /*�*reset the REXX elapsed timer.        */
signal on halt                                   /*�*HALT: signaled via a  Ctrl─C  in DOS.*/

do j=1                                        /*�*start with  unity  and go ye forth.  */
say right(j,20)                               /*�*display the integer right-justified. */
t=time('E')                                   /*�*get the REXX elapsed time in seconds.*/
do forever;   u=time('Elapsed')  /*�* "   "    "     "      "   "    "    */
if u<t | u>t+.5  then iterate j  /*�* ◄═══ passed midnight or  ½  second. */
end   /*�*forever*/
end   /*�*j*/

halt: say  'program HALTed, it ran for'   format(time("ELapsed"),,2)     'seconds.'
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Handle-a-signal\handle-a-signal.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
