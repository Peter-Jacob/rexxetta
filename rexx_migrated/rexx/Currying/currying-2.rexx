/*�*REXX program demonstrates a REXX    currying method    to perform addition.           */
say 'add 2 to 3:          '   add(2, 3)
say 'add 2 to 3 (curried):'   add2(3)
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
add:  procedure;  newV1= 0;       do    j=1  for arg()
do k=1  for words( arg(j) );      newV1= newV1 + word( arg(j), k)
end   /*�*k*/
end      /*�*j*/
return newV1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
add2: procedure;  return add( arg(1), 2)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Currying\currying-2.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
