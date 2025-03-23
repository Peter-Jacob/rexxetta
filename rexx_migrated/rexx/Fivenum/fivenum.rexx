/*�*REXX program computes the five─number summary  (LO─value, p25, medium, p75, HI─value).*/
parse arg x
if x=''  then x= 15 6 42 41 7 36 49 40 39 47 43  /*�*Not specified?  Then use the defaults*/
say 'input numbers: '     space(x)               /*�*display the original list of numbers.*/
call 5num                                        /*�*invoke the  five─number  function.   */
say ' five─numbers: '     result                 /*�*display "     "     "    results.    */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
bSort: procedure expose newV1.;  parse arg n;  m=n-1 /*�*N:  the number of  @  array elements.*/
do m=m  for m  by -1  until ok;   ok= 1 /*�*keep sorting the  @  array 'til done.*/
do j=1  for m;      k= j + 1;         /*�*set  K  to the next item in  @ array.*/
if newV1.j<=newV1.k  then iterate             /*�*Is  @.J  in numerical order?   Good. */
parse value newV1.j newV1.k 0 with newV1.k newV1.j ok /*�*swap two elements and  flag as ¬done.*/
end   /*�*j*/
end     /*�*m*/;          return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
med:   arg s,e;  newV2=e-s+1;  m=s+newV2%2;  if newV2//2  then return newV1.m;  newV3=m-1;  return (newV1.newV3+newV1.m)/2
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
5num:  #= words(x);                  if #==0  then return  '***error***  array is empty.'
parse var x . 1 LO . 1 HI .               /*�*assume values for LO and HI (for now)*/
q2= # % 2;                                er= '***error***  element'
do j=1  for #;     newV1.j= word(x, j)
if \datatype(newV1.j, 'N')  then return  er   j   "isn't numeric: "   newV1.j
LO= min(LO, newV1.j);  HI= max(HI, newV1.j)
end   /*�*j*/                 /*�* [↑] traipse thru array, find min,max*/
call bSort #                              /*�*use a bubble sort (easiest to code). */
if #//2  then p25= q2                     /*�*calculate the second quartile number.*/
else p25= q2 - 1                 /*�*    "      "     "       "       "   */
return LO  med(1, p25)   med(1, #)   med(q2, #)   HI  /*�*return list of 5 numbers.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fivenum\fivenum.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
