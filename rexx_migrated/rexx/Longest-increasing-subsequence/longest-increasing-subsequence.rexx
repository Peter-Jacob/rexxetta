/*�*REXX program finds & displays the  longest increasing subsequence  from a list of #'s.*/
newV1.=;  newV1.1= 3 2 6 4 5 1                           /*�*define the 1st list to be examined.  */
newV1.2= 0 8 4 12 2 10 6 14 1 9 5 13 3 11 7 15 /*�*   "    "  2nd   "   "  "     "      */

do j=1   while  newV1.j\=='';     say        /*�* [↓]  process all of the list for LIS*/
say ' input: '  newV1.j                      /*�*display the (original) input list.   */
call LIS        newV1.j                      /*�*invoke the  LIS  function.           */
say 'output: '  result                   /*�*display the  output (result from LIS)*/
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
LIS: procedure; parse arg x;   n= words(x);   if n==0  then return ''
p.=;                            m.= p.
do newV3=1  to n;  newV4= newV3 - 1;  newV2.newV4= word(x, newV3)    /*�*build an array (@) from input.*/
end   /*�*#*/
L= 0
do j=0  to n-1;  lo= 1
HI= L
do  while LO<=HI;    middle= (LO+HI) % 2
newV4= m.middle            /*�*create a temporary value for @ index.*/
if newV2.newV4<newV2.j  then LO= middle + 1
else HI= middle - 1
end   /*�*while*/
newLO= LO
newV4= newLO - 1                   /*�*create a temporary value for M index.*/
p.j= m.newV4
m.newLO= j
if newLO>L  then L= newLO
end   /*�*i*/
k= m.L;                newV5=                   /*�* [↓]  build a list for the result.   */
do L;  newV5= newV2.k newV5;  k= p.k    /*�*perform this  DO  loop   L   times.  */
end   /*�*i*/
return strip(newV5)                             /*�*the result has an extra leading blank*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Longest-increasing-subsequence\longest-increasing-subsequence.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
