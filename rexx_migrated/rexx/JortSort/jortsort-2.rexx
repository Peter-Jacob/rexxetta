/*�*REXX program  verifies  that  an array  is sorted  using  a   jortSort   algorithm.   */
parse arg newV1                                      /*�*obtain the list of numbers from C.L. */
if newV1=''  then newV1=1 2 4 3                          /*�*Not specified?  Then use the default.*/
say 'array items='  space(newV1)                     /*�*display the list to the terminal.    */
if jortSort(newV1)  then say  'The array is sorted.'
else say  "The array isn't sorted."
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
jortSort: parse arg x
p=word(x,1)
do j=2  to words(x);  newV2=word(x,j)
if newV2<p  then return 0                      /*�*array  isn't sorted.*/
p=newV2
end   /*�*j*/
return 1                                                /*�*array  is    sorted.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\JortSort\jortsort-2.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
