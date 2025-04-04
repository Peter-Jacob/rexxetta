/*ͺ*REXX program  converts  a   mm/dd/yyyy    Gregorian date   ββββΊ   a  Discordian date. */
newV2.1= 'Sweetness'                             /*ͺ*define the 1st dayβofβDiscordianβweek*/
newV2.2= 'Boomtime'                              /*ͺ*   "    "  2nd  "   "      "       " */
newV2.3= 'Pungenday'                             /*ͺ*   "    "  3rd  "   "      "       " */
newV2.4= 'Prickle-Prickle'                       /*ͺ*   "    "  4th  "   "      "       " */
newV2.5= 'Setting Orange'                        /*ͺ*   "    "  5th  "   "      "       " */

newV1.0= "St. Tib's day,"                        /*ͺ*define the leapβday of Discordian yr.*/
newV1.1= 'Chaos'                                 /*ͺ*   "   1st seasonβofβDiscordianβyear.*/
newV1.2= 'Discord'                               /*ͺ*   "   2nd    "    "      "       "  */
newV1.3= 'Confusion'                             /*ͺ*   "   3rd    "    "      "       "  */
newV1.4= 'Bureaucracy'                           /*ͺ*   "   4th    "    "      "       "  */
newV1.5= 'The Aftermath'                         /*ͺ*   "   5th    "    "      "       "  */

parse arg  gM  '/'  gD  "/"  gY .                /*ͺ*obtain the specified Gregorian date. */
if gM=='' | gM=="," | gM=='*'  then parse value  date("U")   with   gM  '/'  gD  "/"  gY .

gY=left( right( date(), 4), 4 - length(Gy) )gY   /*ͺ*adjust for twoβdigit year or no year.*/

/*ͺ* [β]  dayβofβyear,  leapyear adjust. */
doy= date('d', gY || right(gM, 2, 0)right(gD ,2, 0),  "s")   -   (leapyear(gY)   &   gM>2)

dW= doy//5;                if dW==0  then dW=  5 /*ͺ*compute the Discordian weekday.      */
dS= (doy-1) % 73  +  1                           /*ͺ*   "     "       "     season.       */
dD= doy//73;               if dD==0  then dD= 73 /*ͺ*   "     "       "     dayβofβmonth. */
if leapyear(gY)  &  gM==2  &  gD==29 then ds=  0 /*ͺ*is this St. Tib's day  (leapday) ?   */
if ds==0  then dD=                               /*ͺ*adjust for the Discordian leap day.  */

say space(newV2.dW','  newV1.dS dD","  gY + 1166) /*ͺ*display Discordian date to terminal. */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
leapyear: procedure;   parse arg y               /*ͺ*obtain a fourβdigit Gregorian year.  */
if y//4  \==  0  then return 0         /*ͺ*Not  Γ·  by 4?   Then not a leapyear. */
return y//100 \== 0  |  y//400 == 0    /*ͺ*apply the  100  and  400  year rules.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Discordian-date\discordian-date.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
