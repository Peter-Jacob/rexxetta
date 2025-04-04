/*ͺ*REXX program implements and displays  a  stateless   Y   combinator.                  */
numeric digits 1000                                               /*ͺ*allow big numbers.  */
say '    fib'   Y(fib      (50) )                                 /*ͺ*Fibonacci series.   */
say '    fib'   Y(fib      (12 11 10 9 8 7 6 5 4 3 2 1 0)  )      /*ͺ*Fibonacci series.   */
say '   fact'   Y(fact     (60) )                                 /*ͺ*single    factorial.*/
say '   fact'   Y(fact     (0 1 2 3 4 5 6 7 8 9 10 11) )          /*ͺ*single    factorial.*/
say '  Dfact'   Y(dfact    (4 5 6 7 8 9 10 11 12 13)   )          /*ͺ*double    factorial.*/
say '  Tfact'   Y(tfact    (4 5 6 7 8 9 10 11 12 13)   )          /*ͺ*triple    factorial.*/
say '  Qfact'   Y(qfact    (4 5 6 7 8 40) )                       /*ͺ*quadruple factorial.*/
say ' length'   Y(length   (when for to where whenceforth) )      /*ͺ*lengths   of words. */
say 'reverse'   Y(reverse  (123 66188 3007 45.54 MAS I MA) )      /*ͺ*reverses  strings.  */
say '   sign'   Y(sign     (-8 0 8) )                             /*ͺ*sign of the numbers.*/
say '  trunc'   Y(trunc    (-7.0005 12 3.14159 6.4 78.999) )      /*ͺ*truncates numbers.  */
say '    b2x'   Y(b2x      (1 10 11 100 1000 10000 11111 ) )      /*ͺ*converts BINβββΊHEX. */
say '    d2x'   Y(d2x      (8 9 10 11 12 88 89 90 91 6789) )      /*ͺ*converts DECβββΊHEX. */
say '    x2d'   Y(x2d      (8 9 10 11 12 88 89 90 91 6789) )      /*ͺ*converts HEXβββΊDEC. */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
Y: parse arg Y newV1; newV2=; do j=1 for words(newV1); interpret '$=$' Y"("word(newV1,j)')'; end; return newV2
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
fib:   procedure; parse arg x;  if x<2  then return x;  s= 0;  a= 0;   b= 1
do j=2  to x;  s= a+b;  a= b;  b= s;  end;    return s
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
dfact: procedure; parse arg x;  newV3= 1;    do j=x  to 2  by -2;   newV3= newV3*j;   end;    return newV3
tfact: procedure; parse arg x;  newV3= 1;    do j=x  to 2  by -3;   newV3= newV3*j;   end;    return newV3
qfact: procedure; parse arg x;  newV3= 1;    do j=x  to 2  by -4;   newV3= newV3*j;   end;    return newV3
fact: procedure; parse arg x;  newV3= 1;    do j=2  to x       ;   newV3= newV3*j;   end;    return newV3
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Y-combinator\y-combinator.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
