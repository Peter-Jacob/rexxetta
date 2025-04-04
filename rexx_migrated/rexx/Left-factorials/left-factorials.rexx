/*ª*REXX program computes/display the left factorial (or its dec. width) of N (or a range)*/
parse arg bot top inc .                          /*ª*obtain optional arguments from the CL*/
if bot=='' | bot==","  then bot=   1             /*ª*Not specified:  Then use the default.*/
if top=='' | top==","  then top= bot             /*ª* "      "         "   "   "     "    */
if inc=''  | inc==","  then inc=   1             /*ª* "      "         "   "   "     "    */
tell=  bot<0                                     /*ª*if BOT < 0,   only show # of digits. */
bot= abs(bot)                                    /*ª*use the  âbotâ  for the   DO   loop. */
w= length(top)                                   /*ª*width of the largest number request. */
do j=bot  to top  by inc           /*ª*traipse through the numbers requested*/
if tell  then say 'left ! of '  right(j,w) " ââââº " length(LnewV2(j))  ' digits'
else say 'left ! of '  right(j,w) " ââââº "        LnewV2(j)
end   /*ª*j*/                        /*ª* [â]  show either  L!  or # of digits*/
exit 0                                           /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
LnewV2: procedure; parse arg x .;  if x<3  then return x;   newV1= 4;  newV2= 2    /*ª*some shortcuts.*/
do newV3=3  to x-1;   newV2= newV2 * newV3          /*ª*compute  L!  for all numbers âââ âº X.*/
if pos(., newV2)\==0  then numeric digits digits() * 3 % 2    /*ª*bump dec. digs.*/
newV1= newV1 + newV2                            /*ª*add the factorial ââââº  L!  sum.     */
end   /*ª*#*/                         /*ª* [â]  handles gihugeic numbers.      */
return newV1                                     /*ª*return the sum  (L!)  to the invoker.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Left-factorials\left-factorials.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
