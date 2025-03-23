/*�*REXX program  calculates and displays  some values for the  Ackermann function.       */
numeric digits 100                               /*�*use up to 100 decimal digit integers.*/
/*�*╔═════════════════════════════════════════════════════════════╗
║ When REXX raises a number to an integer power  (via the  ** ║
║ operator,  the power can be positive, zero, or negative).   ║
║ Ackermann(5,1)   is a bit impractical to calculate.         ║
╚═════════════════════════════════════════════════════════════╝*/
high=24
do     j=0  to 4;                   say
do k=0  to high % (max(1, j))
call tell_Ack  j, k
if j==4 & k==2  then leave          /*�*there's no sense in going overboard. */
end   /*�*k*/
end       /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
tell_Ack:  parse arg mm,nn;   calls=0            /*�*display an echo message to terminal. */
newV1=right(nn,length(high))
say 'Ackermann('mm", "newV1')='right(ackermann(mm, nn), high),
left('', 12)     'calls='right(calls, high)
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
ackermann: procedure expose calls                /*�*compute value of Ackermann function. */
parse arg m,n;   calls=calls+1
if m==0  then return n + 1
if m==1  then return n + 2
if m==2  then return n + 3 + n
if m==3  then return 2**(n+3) - 3
if m==4  then do; newV1=2                 /*�* [↓]  Ugh!  ···  and still more ughs.*/
do (n+3)-1 /*�*This is where the heavy lifting is.  */
newV1=2**newV1
end
return newV1-3
end
if n==0  then return ackermann(m-1, 1)
return ackermann(m-1, ackermann(m, n-1) )
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Ackermann-function\ackermann-function-3.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
