/*�*REXX program to use a  first-class function  to  use numbers analogously.             */
nums=   2.0     4.0      6.0                     /*�*various numbers,  can have fractions.*/
invs= 1/2.0   1/4.0    1/6.0                     /*�*inverses of the above (real) numbers.*/
m=   0.5                                      /*�*multiplier when invoking new function*/
do j=1  for words(nums);   num= word(nums, j);  inv= word(invs, j)
nf= multiplier(num, inv);  interpret call nf m       /*�*sets the var RESULT.*/
say 'number=' @(num)    'inverse=' @(inv)    'm=' @(m)    'result=' @(result)
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
@:          return left( arg(1) / 1, 15)         /*�*format the number,  left justified.  */
multiplier: procedure expose n1n2; parse arg n1,n2;   n1n2= n1 * n2;   return 'a_new_func'
a_new_func: return n1n2 * arg(1)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\First-class-functions-Use-numbers-analogously\first-class-functions-use-numbers-analogously.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
