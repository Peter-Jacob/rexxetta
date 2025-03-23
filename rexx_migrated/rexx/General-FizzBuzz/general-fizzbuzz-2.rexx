/*�*REXX program shows a generalized  FizzBuzz  program:  #1 name1    #2 name2   ···      */
parse arg h newV1                                    /*�*obtain optional arguments from the CL*/
if h='' | h=","  then h= 20                      /*�*Not specified?  Then use the default.*/
if newV1='' | newV1=","  then newV1= "3 Fizz 5 Buzz 7 Baxx"  /*�* "      "         "   "   "     "    */

do j=1  for h;             z=                  /*�*traipse through the numbers to   H.  */
do k=1  by 2  for words(newV1)%2                 /*�*   "       "     " factors  in   J.  */
if j//word(newV1,k)==0  then z= z || word(newV1,k+1) /*�*Is it a factor?  Then append it to Z.*/
end   /*�*k*/                                  /*�* [↑]  Note:  the factors may be zero.*/
say word(Z j, 1)                               /*�*display the number  or  its factors. */
end     /*�*j*/                                  /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\General-FizzBuzz\general-fizzbuzz-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
