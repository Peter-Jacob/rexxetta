/*�*REXX pgm performs numerical integration using 5 different algorithms and show results.*/
numeric digits 20                                /*�*use twenty decimal digits precision. */

do test=1  for 4;             say           /*�*perform the 4 different test suites. */
if test==1  then do;    L= 0;     H=    1;     i=     100;     end
if test==2  then do;    L= 1;     H=  100;     i=    1000;     end
if test==3  then do;    L= 0;     H= 5000;     i= 5000000;     end
if test==4  then do;    L= 0;     H= 6000;     i= 6000000;     end
say center('test' test, 79, "═")            /*�*display a header for the test suite. */
say '           left rectangular('L", "H', 'i")  ──► "         left_rect(L, H, i)
say '       midpoint rectangular('L", "H', 'i")  ──► "     midpoint_rect(L, H, i)
say '          right rectangular('L", "H', 'i")  ──► "        right_rect(L, H, i)
say '                    Simpson('L", "H', 'i")  ──► "           Simpson(L, H, i)
say '                  trapezium('L", "H', 'i")  ──► "         trapezium(L, H, i)
end   /*�*test*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
f:   parse arg y;  if test>2   then return y     /*�*choose the   "as─is"   function.     */
if test==1  then return y**3  /*�*   "    "     cube     function.     */
return 1/y   /*�*   "    "  reciprocal     "          */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
left_rect:     procedure expose test; parse arg a,b,newV1;     newV2= 0;                h= (b-a)/newV1
do x=a      by h  for newV1;      newV2= newV2 + f(x)
end   /*�*x*/
return newV2*h/1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
midpoint_rect: procedure expose test; parse arg a,b,newV1;     newV2= 0;                h= (b-a)/newV1
do x=a+h/2  by h  for newV1;      newV2= newV2 + f(x)
end   /*�*x*/
return newV2*h/1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
right_rect:    procedure expose test; parse arg a,b,newV1;     newV2= 0;                h= (b-a)/newV1
do x=a+h    by h  for newV1;      newV2= newV2 + f(x)
end   /*�*x*/
return newV2*h/1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
Simpson:       procedure expose test; parse arg a,b,newV1;                          h= (b-a)/newV1
hh= h/2;                                    newV2= f(a + hh)
newV3= 0;         do x=1  for newV1-1; hx=h*x + a;  newV3= newV3 + f(hx)
newV2= newV2 + f(hx + hh)
end   /*�*x*/

return h * (f(a) + f(b) + 4*newV2 + 2*newV3)  /  6
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
trapezium:     procedure expose test; parse arg a,b,newV1;     newV2= 0;                h= (b-a)/newV1
do x=a  by h  for newV1;          newV2= newV2 + (f(x) + f(x+h))
end   /*�*x*/
return newV2*h/2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Numerical-integration\numerical-integration.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
