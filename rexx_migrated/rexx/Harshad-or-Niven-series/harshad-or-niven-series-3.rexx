/*ͺ*REXX program finds the first  A  Niven numbers;  it also finds first Niven number > B.*/
parse arg A B .                                  /*ͺ*obtain optional arguments from the CL*/
if A=='' | A==','  then A=   20                  /*ͺ*Not specified?  Then use the default.*/
if B=='' | B==','  then B= 1000                  /*ͺ* "      "         "   "    "     "   */
numeric digits 1+max(8, length(A), length(B) )   /*ͺ*enable the use of any sized numbers. */
newV1= 0;      newV2=                                    /*ͺ*set Niven numbers count;  Niven list.*/
do j=1  until  newV1==A      /*ͺ*ββββββ let's go Niven number hunting.*/
if isNiven(j)  then do;   newV1= newV1+1;   newV2= newV2 j;   end
end   /*ͺ*j*/              /*ͺ* [β]   bump count; append J βββΊ list.*/
say 'first'   A   'Niven numbers:'   newV2           /*ͺ*display list of Niven numbersβββΊterm.*/

do t=B+1  until  isNiven(t)   /*ͺ*hunt for a Niven (or Harshad) number.*/
end
say 'first Niven number >'   B    " is: "     t  /*ͺ*display 1st Niven number >   B.      */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isNiven: parse arg x 1 sum 2 q                   /*ͺ*use the 1st decimal digit for  SUM.  */
do length(q);              parse var q newV3 2 q;          sum= sum + newV3
end   /*ͺ*length(q)*/             /*ͺ*   β                                 */
return x // sum == 0                    /*ͺ*   ββββββββ is destructively parsed. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Harshad-or-Niven-series\harshad-or-niven-series-3.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
