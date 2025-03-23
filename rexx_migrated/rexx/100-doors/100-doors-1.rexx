/*�*REXX pgm solves the  100 doors puzzle, doing it the hard way by opening/closing doors.*/
parse xyz with a,b,c
parse arg a,b,c
parse upper var fred aa bb cc
parse arg doors .                                /*�*obtain the optional argument from CL.*/
if doors=='' | doors==","  then doors=100        /*�*not specified?  Then assume 100 doors*/
/*�*        0 =  the door is  closed.    */
/*�*        1 =   "    "   "  open.      */
door.=0                                          /*�*assume all doors are closed at start.*/
do newV1=1  for doors                /*�*process a pass─through for all doors.*/
do j=newV1  by newV1  to doors       /*�*  ··· every Jth door from this point.*/
door.j= \door.j              /*�*toggle the  "openness"  of the door. */
end   /*�*j*/
end       /*�*#*/

say 'After '                doors          " passes, the following doors are open:"
say
do k=1  for doors
if door.k  then say right(k, 20) /*�*add some indentation for the output. */
end    /*�*k*/                     /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\100-doors\100-doors-1.rexx was migrated on 23 Mar 2025 at 10:43:03
 * -------------------------------------------------------------------------
*/ 
