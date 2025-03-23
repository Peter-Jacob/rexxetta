/*�*REXX pgm generates/displays the   'start ──► end'    elements of the Van Eck sequence.*/
parse arg LO HI sta .                            /*�*obtain optional arguments from the CL*/
if  LO=='' |  LO==","  then  LO=  1              /*�*Not specified?  Then use the default.*/
if  HI=='' |  HI==","  then  HI= 10              /*�* "      "         "   "   "     "    */
if sta=='' | sta==","  then sta=  0              /*�* "      "         "   "   "     "    */
newV1.0= sta;                    x= sta;      newV2.=.   /*�*$.: the  Van Eck  sequence as a list.*/
do newV3=1 for HI-1                             /*�*X:  is the last term being examined. */
if newV2.x==.  then do;   newV2.x= newV3;        newV1.newV3= 0;             x= 0;   end    /*�*new term.*/
else do;     z= newV3 - newV2.x;  newV1.newV3= z;   newV2.x= newV3;   x= z;   end    /*�*old term.*/
end   /*�*#*/                                 /*�*Z:  the new term being added to list.*/
LOw= LO - 1;     out= newV1.LOw            /*�*initialize the output value.         */
do j=LO  to HI-1;     out= out newV1.j          /*�*build a list for the output display. */
end   /*�*j*/                                 /*�*stick a fork in it,  we're all done. */
say 'terms '     LO     " through "     HI    ' of the Van Eck sequence are: '     out
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Van-Eck-sequence\van-eck-sequence-2.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
