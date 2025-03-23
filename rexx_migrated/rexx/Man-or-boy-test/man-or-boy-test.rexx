/*�*REXX program performs the  "man or boy"  test as far as possible for  N.              */
do n=0                                      /*�*increment  N  from  zero  forever.   */
say 'n='n   a(N,x1,x2,x3,x4,x5)             /*�*display the result to the terminal.  */
end  /*�*n*/                                  /*�* [↑]  do until something breaks.     */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
a:   procedure; parse arg k, x1, x2, x3, x4, x5
if k<=0  then return f(x4) + f(x5)
else return f(b)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
b:   k=k-1;                            return  a(k, b, x1, x2, x3, x4)
f:   interpret  'v='  arg(1)"()";      return  v
x1:  procedure;                        return  1
x2:  procedure;                        return -1
x3:  procedure;                        return -1
x4:  procedure;                        return  1
x5:  procedure;                        return  0
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Man-or-boy-test\man-or-boy-test.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
