/*�*REXX program demonstrates a method of a  partial function application.      */
s=;      do a=0  to 3                  /*�*build 1st series of some low integers*/
s=strip(s a)                  /*�*append to the integer to the  S  list*/
end   /*�*a*/

call fs 'f1',s;         say 'for f1:  series=' s",   result="  result
call fs 'f2',s;         say 'for f2:  series=' s",   result="  result

s=;      do b=2  to  8  by 2           /*�*build 2nd series, low even integers. */
s=strip(s b)                  /*�*append to the integer to the  S  list*/
end   /*�*b*/

call fs 'f1',s;         say 'for f1:  series=' s",   result="  result
call fs 'f2',s;         say 'for f2:  series=' s",   result="  result
exit                                   /*�*stick a fork in it,  we're all done. */
/*�*────────────────────────────────────────────────────────────────────────────*/
f1:  return arg(1)* 2
f2:  return arg(1)**2
/*�*────────────────────────────────────────────────────────────────────────────*/
fs:  procedure;   arg f,s;   newV1=;       do j=1  for words(s);   z=word(s,j)
interpret '$=$'     f"("z')'
end  /*�*j*/
return strip(newV1)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Partial-function-application\partial-function-application.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
