/*ช*REXX program finds and displays  Lychrel numbers,  related numbers, and  palindromes. */
parse arg high limit .                           /*ช*obtain optional argument from the CL.*/
if  high='' |  high==","  then  high= 10000      /*ช*Not specified?  Then use the default.*/
if limit='' | limit==","  then limit=   500      /*ช* "      "         "   "   "     "    */
numeric digits  limit % 2                        /*ช*ensure enough decimal digits for adds*/
T.= 0;   newV1.= T.;   newV2.=newV1.;     w= length(high)    /*ช*W:   is used for formatting numbers. */
newV4=                                               /*ช*the list of  Lychrel  numbers.       */
do j=1  for high;         call Lychrel j     /*ช*find the    Lychrel   numbers.       */
end   /*ช*j*/
p=;                           R=                 /*ช*P: list of palindromes; R: related #s*/
do k=1  for high
if newV2.k                    then newV4= newV4 k        /*ช*build a list of Lychrel numbers.     */
if T.k                    then R= R k        /*ช*  "   "   "   "    "    related nums.*/
if T.k  &  k==reverse(k)  then p= p k        /*ช*  "   "   "   "    "    palindromes. */
end   /*ช*k*/

say 'Found in the range  1  to '   high    " (limiting searches to "    limit   ' steps):'
say
say right( words(newV4)           , w)         'Lychrel numbers:'             newV4
say right( words(R) - words(newV4), w)         'Lychrel related numbers.'
say right( words(p)           , w)         'Lychrel palindromes:'         p
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
Lychrel: procedure expose limit newV1. newV2. T.; parse arg x 1 z   /*ช*set X and Z to argument 1.*/
rels= 0                                            /*ช*# related numbers (so far)*/
do  limit;             z= z + reverse(z) /*ช*add the reverse of Z ยทยทยท  */
if z==reverse(z)  then return            /*ช*is the new Z a palindrome?*/
rels= rels + 1;        newV3.rels= z         /*ช*add to the related numbers*/
end   /*ช*limit*/                          /*ช* [โ]  only DO limit times.*/
newV2.x= 1                                             /*ช*mark number as a  Lychrel.*/
T.x= 1;   do a=1  for rels;      newV5= newV3.a            /*ช*process "related" numbers.*/
if newV1.newV5  then newV2.x= 0                      /*ช*unmark number as  Lychrel.*/
else newV1.newV5= 1                      /*ช*  mark    "    "    "     */
T.newV5= 1                                   /*ช*mark number as  "related".*/
end   /*ช*a*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Lychrel-numbers\lychrel-numbers.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
