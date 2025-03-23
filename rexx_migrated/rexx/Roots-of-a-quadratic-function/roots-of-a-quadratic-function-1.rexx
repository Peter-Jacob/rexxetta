/*�*REXX program finds the  roots  (which may be complex)  of a quadratic function.       */
parse arg  a b c .                               /*�*obtain the specified arguments: A B C*/
call quad  a,b,c                                 /*�*solve quadratic function via the sub.*/
r1= r1/1;  r2= r2/1;   a= a/1;  b= b/1;  c= c/1  /*�*normalize numbers to a new precision.*/
if r1j\=0  then r1=r1||left('+',r1j>0)(r1j/1)"i" /*�*Imaginary part? Handle complex number*/
if r2j\=0  then r2=r2||left('+',r2j>0)(r2j/1)"i" /*�*   "        "      "       "      "  */
say '    a ='   a                  /*�*display the normalized value of   A. */
say '    b ='   b                  /*�*   "     "       "       "    "   B. */
say '    c ='   c                  /*�*   "     "       "       "    "   C. */
say;    say 'root1 ='   r1                 /*�*   "     "       "       "   1st root*/
say 'root2 ='   r2                 /*�*   "     "       "       "   2nd root*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
quad: parse arg aa,bb,cc;     numeric digits 200 /*�*obtain 3 args; use enough dec. digits*/
newV1= sqrt(bb**2-4*aa*cc);       L= length(newV1) /*�*compute  SQRT (which may be complex).*/
r= 1 /(aa+aa);   newV2= right(newV1, 1)=='i'       /*�*compute reciprocal of 2*aa;  Complex?*/
if newV2  then do;  r1= -bb   *r;   r2=r1;          r1j= left(newV1,L-1)*r;   r2j=-r1j;  end
else do;  r1=(-bb+newV1)*r;   r2=(-bb-newV1)*r;   r1j= 0;               r2j= 0;    end
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sqrt: procedure; parse arg x 1 ox; if x=0  then return 0; d= digits(); m.= 9; numeric form
numeric digits 9; h= d+6; x=abs(x); parse value format(x,2,1,,0) 'E0' with g 'E' newV3 .
g=g*.5'e'newV3%2;   do j=0  while h>9;      m.j=h;              h=h%2+1;       end /*�*j*/
do k=j+5  to 0  by -1;  numeric digits m.k; g=(g+x/g)*.5;  end /*�*k*/
numeric digits d;         return (g/1)left('i', ox<0)     /*�*make complex if OX<0. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Roots-of-a-quadratic-function\roots-of-a-quadratic-function-1.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
