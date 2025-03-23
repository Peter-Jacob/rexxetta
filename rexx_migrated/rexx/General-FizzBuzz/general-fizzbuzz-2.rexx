/*ª*REXX program shows a generalized  FizzBuzz  program:  #1 name1    #2 name2   Â·Â·Â·      */
parse arg h newV1                                    /*ª*obtain optional arguments from the CL*/
if h='' | h=","  then h= 20                      /*ª*Not specified?  Then use the default.*/
if newV1='' | newV1=","  then newV1= "3 Fizz 5 Buzz 7 Baxx"  /*ª* "      "         "   "   "     "    */

do j=1  for h;             z=                  /*ª*traipse through the numbers to   H.  */
do k=1  by 2  for words(newV1)%2                 /*ª*   "       "     " factors  in   J.  */
if j//word(newV1,k)==0  then z= z || word(newV1,k+1) /*ª*Is it a factor?  Then append it to Z.*/
end   /*ª*k*/                                  /*ª* [â†‘]  Note:  the factors may be zero.*/
say word(Z j, 1)                               /*ª*display the number  or  its factors. */
end     /*ª*j*/                                  /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\General-FizzBuzz\general-fizzbuzz-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
