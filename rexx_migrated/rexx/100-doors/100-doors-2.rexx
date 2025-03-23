/*�*REXX pgm solves the  100 doors  puzzle,  doing it the easy way by calculating squares.*/
parse arg doors .                                /*�*obtain the optional argument from CL.*/
if doors=='' | doors==","  then doors=100        /*�*not specified?  Then assume 100 doors*/
say 'After '          doors          " passes, the following doors are open:"
say
do newV1=1  while  newV1**2 <= doors           /*�*process easy pass─through  (squares).*/
say right(newV1**2, 20)                    /*�*add some indentation for the output. */
end   /*�*#*/                            /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\100-doors\100-doors-2.rexx was migrated on 23 Mar 2025 at 10:43:03
 * -------------------------------------------------------------------------
*/ 
