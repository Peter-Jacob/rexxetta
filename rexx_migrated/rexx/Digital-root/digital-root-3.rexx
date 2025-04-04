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
digRoot: procedure;  parse arg x 1 ox;     L=length(x) /*ͺ*get a number and another copy. */
do pers=1  until L==1;  newV1= 0                /*ͺ*keep summing 'til digRootβ‘1 dig*/
do j=1  for L;     newV2= substr(x, j, 1)  /*ͺ*add each digit in the dec. num.*/
if datatype(newV2, 'W')  then newV1= newV1 + newV2     /*ͺ*add a dec. dig to digital root.*/
end   /*ͺ*j*/
x= newV1;                           L=length(x) /*ͺ*a new #, it may be multiβdigit.*/
end        /*ͺ*pers*/
return center(x,7)   center(pers,11)  ox      /*ͺ*return a nicely formatted line.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Digital-root\digital-root-3.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
