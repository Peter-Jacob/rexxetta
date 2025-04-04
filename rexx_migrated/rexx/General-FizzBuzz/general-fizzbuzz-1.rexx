/*�*REXX program shows a generalized  FizzBuzz  program:  #1 name1    #2 name2   ···      */
parse arg h newV3                                    /*�*obtain optional arguments from the CL*/
if h='' | h=","  then h= 20                      /*�*Not specified?  Then use the default.*/
if newV3='' | newV3=","  then newV3= "3 Fizz 5 Buzz 7 Baxx"  /*�* "      "         "   "   "     "    */
factors= words(newV3) % 2                            /*�*determine number of factors to use.  */

do i=1  by 2  for factors                      /*�*parse the number factors to be used. */
newV1.i=word(newV3, i);   newV2.i=word(newV3, i+1)             /*�*obtain the factor and its  "name".   */
end   /*�*i*/

do j=1  for h;                    z=           /*�*traipse through the numbers to   H.  */
do k=1  by 2  for factors      /*�*   "       "     " factors  in   J.  */
if j//newV1.k==0  then z= z || newV2.k /*�*Is it a factor?  Then append it to Z.*/
end   /*�*k*/                    /*�* [↑]  Note:  the factors may be zero.*/
say word(z j, 1)                               /*�*display the number  or  its factors. */
end                  /*�*j*/                     /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\General-FizzBuzz\general-fizzbuzz-1.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
