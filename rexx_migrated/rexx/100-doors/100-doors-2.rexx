/*ª*REXX pgm solves the  100 doors  puzzle,  doing it the easy way by calculating squares.*/
parse arg doors .                                /*ª*obtain the optional argument from CL.*/
if doors=='' | doors==","  then doors=100        /*ª*not specified?  Then assume 100 doors*/
say 'After '          doors          " passes, the following doors are open:"
say
do newV1=1  while  newV1**2 <= doors           /*ª*process easy passâ”€through  (squares).*/
say right(newV1**2, 20)                    /*ª*add some indentation for the output. */
end   /*ª*#*/                            /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\100-doors\100-doors-2.rexx was migrated on 23 Mar 2025 at 10:43:03
 * -------------------------------------------------------------------------
*/ 
