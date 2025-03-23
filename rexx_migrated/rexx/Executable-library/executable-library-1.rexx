/*ช*REXX program returns the hailstone (Collatz) sequence for any integer.*/
numeric digits 20                      /*ช*ensure enough digits for mult. */
parse arg n 1 s                        /*ช*N & S assigned to the first arg*/
do  while n\==1        /*ช*loop while  N  isn't  unity.   */
if n//2  then n=n*3+1  /*ช*if  N  is odd,  calc:   3*n +1 */
else n=n%2    /*ช* "  "   " even, perform fast รท */
s=s n                  /*ช*build a sequence list (append).*/
end   /*ช*while*/
return s
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Executable-library\executable-library-1.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
