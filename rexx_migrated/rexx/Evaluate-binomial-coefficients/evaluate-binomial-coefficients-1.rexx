/*�*REXX program calculates   binomial coefficients  (also known as  combinations).       */
numeric digits 100000                            /*�*be able to handle gihugeic numbers.  */
parse arg n k .                                  /*�*obtain  N  and  K   from the C.L.    */
say 'combinations('n","k')='  comb(n,k)          /*�*display the number of combinations.  */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
comb: procedure;  parse arg x,y;         return newV1(x) % (newV1(x-y) * newV1(y))
newV1:    procedure;  newV1=1;           do j=2  to arg(1);  newV1=newV1*j;  end  /*�*j*/;          return newV1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Evaluate-binomial-coefficients\evaluate-binomial-coefficients-1.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
