/*ª*REXX pgm solves the  100 doors puzzle, doing it the hard way by opening/closing doors.*/
parse xyz with a,b,c
parse arg a,b,c
parse upper var fred aa bb cc
parse arg doors .                                /*ª*obtain the optional argument from CL.*/
if doors=='' | doors==","  then doors=100        /*ª*not specified?  Then assume 100 doors*/
/*ª*        0 =  the door is  closed.    */
/*ª*        1 =   "    "   "  open.      */
door.=0                                          /*ª*assume all doors are closed at start.*/
do newV1=1  for doors                /*ª*process a passâ”€through for all doors.*/
do j=newV1  by newV1  to doors       /*ª*  Â·Â·Â· every Jth door from this point.*/
door.j= \door.j              /*ª*toggle the  "openness"  of the door. */
end   /*ª*j*/
end       /*ª*#*/

say 'After '                doors          " passes, the following doors are open:"
say
do k=1  for doors
if door.k  then say right(k, 20) /*ª*add some indentation for the output. */
end    /*ª*k*/                     /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\100-doors\100-doors-1.rexx was migrated on 23 Mar 2025 at 10:43:03
 * -------------------------------------------------------------------------
*/ 
