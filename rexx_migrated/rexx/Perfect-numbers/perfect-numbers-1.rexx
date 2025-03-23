/*ª*REXX version of the  ooRexx  program (the code was modified to run with Classic REXX).*/
do i=1  to 10000                                 /*ª*statement changed:  LOOP â”€â”€â–º DO*/
if perfectNumber(i)  then say  i   "is a perfect number"
end
exit

perfectNumber: procedure; parse arg n                  /*ª*statements changed: ROUTINE,USE*/
sum=0
do i=1  to n%2                            /*ª*statement changed:  LOOP â”€â”€â–º DO*/
if n//i==0 then sum=sum+i                 /*ª*statement changed:  sum += i   */
end
return sum=n
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Perfect-numbers\perfect-numbers-1.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
