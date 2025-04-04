/*ͺ*REXX program  calculates and displays the  digital root  and  additive persistence.   */
say 'digital   additive'                         /*ͺ*display the  1st  line of the header.*/
say "  root  persistence" center('number',77)    /*ͺ*   "     "   2nd    "   "  "     "   */
say "βββββββ βββββββββββ"   left('', 77, "β")    /*ͺ*   "     "   3rd    "   "  "     "   */
say digRoot(       627615)
say digRoot(        39390)
say digRoot(       588225)
say digRoot( 393900588225)
say digRoot(89999999999999999999999999999999999999999999999999999999999999999999999999999)
say "βββββββ βββββββββββ"   left('', 77, "β")    /*ͺ*display the  foot separator.         */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
digRoot: procedure; parse arg x 1 z;  L= length(x)    /*ͺ*get a number & also another copy*/
do pers=1  until L==1;  newV1= left(x, 1)      /*ͺ*sum until  digRoot β‘ one digit. */
do j=2  for L-1;     newV1= newV1+substr(x,j,1) /*ͺ*add digits in the decimal number*/
end   /*ͺ*j*/
x= newV1;                      L= length(x)    /*ͺ*a new num, it may be multiβdigit*/
end     /*ͺ*pers*/
return center(x, 7)  center(pers, 11)  z     /*ͺ*return a nicely formatted line. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Digital-root\digital-root-2.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
