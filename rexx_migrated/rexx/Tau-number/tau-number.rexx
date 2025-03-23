/*�*REXX pgm displays   N   tau numbers,  an integer divisible by the # of its divisors). */
parse arg n cols .                               /*�*obtain optional argument from the CL.*/
if    n=='' |    n==","  then    n= 100          /*�*Not specified?  Then use the default.*/
if cols=='' | cols==","  then cols=  10          /*�*Not specified?  Then use the default.*/
w= max(8, length(n) )                            /*�*W:  used to align 1st output column. */
newV1= ' the first '  commas(n)   " tau numbers " /*�*the title of the tau numbers table.  */
say ' index │'center(newV1,  1 + cols*(w+1)     ) /*�*display the title of the output table*/
say '───────┼'center(""  ,  1 + cols*(w+1), '─') /*�*   "     " header  "  "     "     "  */
idx= 1;                  newV2= 0;           newV3=      /*�*idx: line;   #:  tau numbers;  $: #s */
do j=1  until newV2==n                    /*�*search for   N   tau numbers         */
if j//tau(j) \==0  then iterate       /*�*Is this a tau number?  No, then skip.*/
newV2= newV2 + 1                              /*�*bump the count of tau numbers found. */
newV3= newV3  right( commas(j), w)            /*�*add a tau number to the output list. */
if newV2//cols\==0     then iterate       /*�*Not a multiple of cols?  Don't show. */
say center(idx, 7)'│'   substr(newV3, 2)  /*�*display partial list to the terminal.*/
idx= idx + cols;               newV3=     /*�*bump idx by number of cols; nullify $*/
end   /*�*j*/

if newV3\==''  then say center(idx, 7)"│"  substr(newV3, 2)  /*�*possible display residual output.*/
say '───────┴'center(""  ,  1 + cols*(w+1), '─')
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV4;  do jc=length(newV4)-3  to 1  by -3; newV4=insert(',', newV4, jc); end;  return newV4
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
tau: procedure; parse arg x 1 y                  /*�*X  and  $  are both set from the arg.*/
if x<6  then return 2 + (x==4) - (x==1)     /*�*some low #s should be handled special*/
odd= x // 2                                 /*�*check if  X  is odd (remainder of 1).*/
if odd  then do;   newV2= 2;               end  /*�*Odd?    Assume divisor count of  2.  */
else do;   newV2= 4;   y= x % 2;   end  /*�*Even?      "      "      "    "  4.  */
/*�* [↑]  start with known number of divs*/
do j=3  for x%2-3  by 1+odd  while j<y   /*�*for odd number,  skip even numbers.  */
if x//j==0  then do                      /*�*if no remainder, then found a divisor*/
newV2= newV2 + 2;   y= x % j    /*�*bump # of divisors;  calculate limit.*/
if j>=y  then do;   newV2= newV2 - 1;   leave;   end   /*�*reached limit?*/
end                     /*�*                     ___             */
else if j*j>x  then leave    /*�*only divide up to   √ x              */
end   /*�*j*/                              /*�* [↑]  this form of DO loop is faster.*/
return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Tau-number\tau-number.rexx was migrated on 23 Mar 2025 at 10:43:32
 * -------------------------------------------------------------------------
*/ 
