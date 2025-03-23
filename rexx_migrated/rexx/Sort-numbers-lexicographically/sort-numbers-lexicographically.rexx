/*�*REXX pgm displays a horizontal list of a  range of numbers  sorted  lexicographically.*/
parse arg LO HI INC .                            /*�*obtain optional arguments from the CL*/
if  LO=='' |  LO==","  then  LO=  1              /*�*Not specified?  Then use the default.*/
if  HI=='' |  HI==","  then  HI= 13              /*�* "      "         "   "   "     "    */
if INC=='' | INC==","  then INC=  1              /*�* "      "         "   "   "     "    */
newV2= 0                                             /*�*for actual sort, start array with  1.*/
do j=LO  to  HI  by  INC       /*�*construct an array from  LO   to  HI.*/
newV2= newV2 + 1;        newV1.newV2= j / 1    /*�*bump counter;  define array element. */
end   /*�*j*/                    /*�* [↑]  Also, normalize the element #. */
call Lsort newV2                                     /*�*sort numeric array with a simple sort*/
newV3=                                               /*�*initialize a horizontal numeric list.*/
do k=1  for  newV2;    newV3= newV3','newV1.k  /*�*construct      "         "      "    */
end   /*�*k*/                    /*�* [↑]  prefix each number with a comma*/
/*�* [↓]  display a continued  SAY  text.*/
say 'for   '  LO"──►"HI     ' by '     INC     " (inclusive), "         newV2 ,
' elements sorted lexicographically:'
say  '['strip(newV3, "L", ',')"]"                    /*�*strip leading comma, bracket the list*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Lsort: procedure expose newV1.; parse arg n;  m= n-1 /*�*N: is the number of @ array elements.*/
do m=m  by -1  until ok;          ok= 1   /*�*keep sorting the  @ array until done.*/
do j=1  for m;  k= j+1;  if newV1.j>>newV1.k  then parse value newV1.j newV1.k 0 with newV1.k newV1.j ok
end   /*�*j*/                            /*�* [↑]  swap 2 elements, flag as ¬done.*/
end      /*�*m*/;    return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sort-numbers-lexicographically\sort-numbers-lexicographically.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
