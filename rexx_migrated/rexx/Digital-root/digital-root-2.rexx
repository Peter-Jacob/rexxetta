/*�*REXX program  calculates and displays the  digital root  and  additive persistence.   */
say 'digital   additive'                         /*�*display the  1st  line of the header.*/
say "  root  persistence" center('number',77)    /*�*   "     "   2nd    "   "  "     "   */
say "═══════ ═══════════"   left('', 77, "═")    /*�*   "     "   3rd    "   "  "     "   */
say digRoot(       627615)
say digRoot(        39390)
say digRoot(       588225)
say digRoot( 393900588225)
say digRoot(89999999999999999999999999999999999999999999999999999999999999999999999999999)
say "═══════ ═══════════"   left('', 77, "═")    /*�*display the  foot separator.         */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
digRoot: procedure; parse arg x 1 z;  L= length(x)    /*�*get a number & also another copy*/
do pers=1  until L==1;  newV1= left(x, 1)      /*�*sum until  digRoot ≡ one digit. */
do j=2  for L-1;     newV1= newV1+substr(x,j,1) /*�*add digits in the decimal number*/
end   /*�*j*/
x= newV1;                      L= length(x)    /*�*a new num, it may be multi─digit*/
end     /*�*pers*/
return center(x, 7)  center(pers, 11)  z     /*�*return a nicely formatted line. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Digital-root\digital-root-2.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
