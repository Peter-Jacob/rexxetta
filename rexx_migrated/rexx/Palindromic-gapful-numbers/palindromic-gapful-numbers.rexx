/*�*REXX program computes and displays palindromic gapful numbers, it also can show those */
/*�*─────────────────────── palindromic gapful numbers listed by their last decimal digit.*/
numeric digits 20                                /*�*ensure enough decimal digits gapfuls.*/
parse arg palGaps                                /*�*obtain optional arguments from the CL*/
if palGaps=''  then palGaps= 20 100@@15 1000@@10 /*�*Not specified?  Then use the defaults*/

do until palGaps='';      parse var palGaps  stuff palGaps;      call palGap stuff
end   /*�*until*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
palGap: procedure; parse arg n '@' sp "@" z;    newV6= 0;    if sp==''  then sp= 100
newV2= '  (ending in a specific digit) ';      if  z==''  then  z=   n
newV3= ' last ';                                if  z==n   then newV3= " first "
newV1= ' palindromic gapful numbers starting at: '
say center(newV3   z    ' of '     n   newV1   sp" "   newV2, 140, "═")
newV4.= 0                                    /*�*array of result counts for each digit*/
newSP= max(110, sp%11*11)                /*�*calculate the new starting point.    */
tot= n * 9                               /*�*total # of results that are wanted.  */
newV5.=;                           sum= 0    /*�*blank lists;  digit results (so far).*/
do j=newSP  by 11  until sum==tot  /*�*loop 'til all digit counters filled. */
if reverse(j)  \==j  then iterate  /*�*Not a palindrome?       Then skip it.*/
parse var   j   a  2  ''  -1  b    /*�*obtain the first and last dec. digit.*/
if newV4.b          ==n  then iterate  /*�*Digit quota filled?     Then skip it.*/
if j // (a||b) \==0  then iterate  /*�*Not divisible by A||B?    "    "   " */
sum= sum + 1;        newV4.b= newV4.b + 1  /*�*bump the sum counter & digit counter.*/
newV5.b= newV5.b  j                        /*�*append   J   to the correct list.    */
end   /*�*j*/
/*�* [↓]  just show the last  Z  numbers.*/
do k=1  for 9;   say  k':'   strip( subword(newV5.k, 1 + n - z) )
end   /*�*k*/;     say
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Palindromic-gapful-numbers\palindromic-gapful-numbers.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
