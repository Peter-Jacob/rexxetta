/*ͺ*REXX pgm displays a horizontal list of a  range of numbers  sorted  lexicographically.*/
parse arg LO HI INC .                            /*ͺ*obtain optional arguments from the CL*/
if  LO=='' |  LO==","  then  LO=  1              /*ͺ*Not specified?  Then use the default.*/
if  HI=='' |  HI==","  then  HI= 13              /*ͺ* "      "         "   "   "     "    */
if INC=='' | INC==","  then INC=  1              /*ͺ* "      "         "   "   "     "    */
newV2= 0                                             /*ͺ*for actual sort, start array with  1.*/
do j=LO  to  HI  by  INC       /*ͺ*construct an array from  LO   to  HI.*/
newV2= newV2 + 1;        newV1.newV2= j / 1    /*ͺ*bump counter;  define array element. */
end   /*ͺ*j*/                    /*ͺ* [β]  Also, normalize the element #. */
call Lsort newV2                                     /*ͺ*sort numeric array with a simple sort*/
newV3=                                               /*ͺ*initialize a horizontal numeric list.*/
do k=1  for  newV2;    newV3= newV3','newV1.k  /*ͺ*construct      "         "      "    */
end   /*ͺ*k*/                    /*ͺ* [β]  prefix each number with a comma*/
/*ͺ* [β]  display a continued  SAY  text.*/
say 'for   '  LO"βββΊ"HI     ' by '     INC     " (inclusive), "         newV2 ,
' elements sorted lexicographically:'
say  '['strip(newV3, "L", ',')"]"                    /*ͺ*strip leading comma, bracket the list*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Lsort: procedure expose newV1.; parse arg n;  m= n-1 /*ͺ*N: is the number of @ array elements.*/
do m=m  by -1  until ok;          ok= 1   /*ͺ*keep sorting the  @ array until done.*/
do j=1  for m;  k= j+1;  if newV1.j>>newV1.k  then parse value newV1.j newV1.k 0 with newV1.k newV1.j ok
end   /*ͺ*j*/                            /*ͺ* [β]  swap 2 elements, flag as Β¬done.*/
end      /*ͺ*m*/;    return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sort-numbers-lexicographically\sort-numbers-lexicographically.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
