/*�*REXX program computes/display the left factorial (or its dec. width) of N (or a range)*/
parse arg bot top inc .                          /*�*obtain optional arguments from the CL*/
if bot=='' | bot==","  then bot=   1             /*�*Not specified:  Then use the default.*/
if top=='' | top==","  then top= bot             /*�* "      "         "   "   "     "    */
if inc=''  | inc==","  then inc=   1             /*�* "      "         "   "   "     "    */
tell=  bot<0                                     /*�*if BOT < 0,   only show # of digits. */
bot= abs(bot)                                    /*�*use the  │bot│  for the   DO   loop. */
w= length(top)                                   /*�*width of the largest number request. */
do j=bot  to top  by inc           /*�*traipse through the numbers requested*/
if tell  then say 'left ! of '  right(j,w) " ───► " length(LnewV2(j))  ' digits'
else say 'left ! of '  right(j,w) " ───► "        LnewV2(j)
end   /*�*j*/                        /*�* [↑]  show either  L!  or # of digits*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
LnewV2: procedure; parse arg x .;  if x<3  then return x;   newV1= 4;  newV2= 2    /*�*some shortcuts.*/
do newV3=3  to x-1;   newV2= newV2 * newV3          /*�*compute  L!  for all numbers ─── ► X.*/
if pos(., newV2)\==0  then numeric digits digits() * 3 % 2    /*�*bump dec. digs.*/
newV1= newV1 + newV2                            /*�*add the factorial ───►  L!  sum.     */
end   /*�*#*/                         /*�* [↑]  handles gihugeic numbers.      */
return newV1                                     /*�*return the sum  (L!)  to the invoker.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Left-factorials\left-factorials.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
