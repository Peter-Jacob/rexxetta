/*�*REXX program calculates the value of  pi  using the  AGM  algorithm.                  */
parse arg d .;   if d=='' | d==","  then d= 500  /*�*D  not specified?  Then use default. */
numeric digits d+5                               /*�*set the numeric decimal digits to D+5*/
z= 1/4;                a= 1;     g= sqrt(1/2)    /*�*calculate some initial values.       */
n= 1
do j=1   until a==old;       old= a       /*�*keep calculating until no more noise.*/
x= (a+g) * .5;               g= sqrt(a*g) /*�*calculate the next set of terms.     */
z= z - n*(x-a)**2;  n= n+n;  a= x         /*�*Z  is used in the final calculation. */
end   /*�*j*/                               /*�* [↑]  stop if  A  equals  OLD.       */

pi= a**2 / z                                     /*�*compute the finished  value of  pi.  */
numeric digits d                                 /*�*set the numeric decimal digits to  D.*/
say pi / 1                                       /*�*display the computed value of  pi.   */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sqrt: procedure; parse arg x;  if x=0  then return 0;  d=digits();  numeric digits;  h=d+6
numeric form; m.=9; parse value format(x,2,1,,0) 'E0' with g "E" newV1 .; g=g *.5'e'newV1 %2
do j=0  while h>9;        m.j=h;                 h=h%2+1;          end  /*�*j*/
do k=j+5  to 0  by -1;    numeric digits m.k;    g=(g+x/g)*.5;     end  /*�*k*/
numeric digits d;     return g/1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arithmetic-geometric-mean-Calculate-Pi\arithmetic-geometric-mean-calculate-pi-1.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
