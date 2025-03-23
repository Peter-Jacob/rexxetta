/*�*REXX program  computes and displays  a  Farey sequence  (or the number of fractions). */
parse arg LO HI INC .                            /*�*obtain optional arguments from the CL*/
if  LO=='' |  LO==","  then  LO=  1              /*�*Not specified?  Then use the default.*/
if  HI=='' |  HI==","  then  HI= LO              /*�* "      "         "   "   "     "    */
if INC=='' | INC==","  then INC=  1              /*�* "      "         "   "   "     "    */
sw= linesize() - 1                               /*�*obtain the linesize of the terminal. */
oLO= LO                                          /*�*save original value of the the orders*/
do j=abs(LO)  to abs(HI)  by INC          /*�*process each of the specified numbers*/
newV1= fareyF(j)                              /*�*go ye forth & compute Farey sequence.*/
say center('Farey sequence for order '   j   " has "   newV1   ' fractions.', sw, "═")
if oLO>=0  then call show                 /*�*display the Farey fractions.         */
end   /*�*j*/
exit newV1                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
fareyF: procedure expose n. d.;  parse arg x
n.1= 0;   d.1= 1;   n.2= 1;   d.2= x     /*�*some kit parts for the fraction list.*/
do k=1  until n.z>x          /*�*construct from thirds  and  on  "up".*/
y= k+1;       z= k+2         /*�*calculate the next K and the next Z. */
newV2= d.k + x              /*�*calculation used as a shortcut.      */
n.z= newV2 % d.y*n.y   -   n.k   /*�*    "     the fraction   numerator.  */
d.z= newV2 % d.y*d.y   -   d.k   /*�*    "      "     "     denominator.  */
if n.z>x  then leave         /*�*Should the construction be stopped ? */
end   /*�*k*/
return z - 1                             /*�*return the count of Farey fractions. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:   newV3= '0/1'                                 /*�*construct the start of the Farey seq.*/
do k=2  for newV1-1;   newV2= n.k'/'d.k        /*�*build a fraction:   numer. / denom.  */
if length(newV3 newV2)>sw  then do; say newV3; newV3= newV2; end   /*�*Is new line too wide? Show it*/
else newV3= newV3 newV2                 /*�*No?  Keep it & keep building.*/
end   /*�*k*/
if newV3\==''  then say newV3;      return         /*�*display any residual fractions.      */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Farey-sequence\farey-sequence.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
