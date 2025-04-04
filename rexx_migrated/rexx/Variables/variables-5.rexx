/*ͺ*REXX pgm shows different scopes of a variable: "global"  and  "local".*/
q = 55          ;    say ' 1st q='  q  /*ͺ*assign a value ββββΊ  "main"  Q.*/
call sub        ;    say ' 2nd q='  q  /*ͺ*call a procedure subroutine.   */
call gyro       ;    say ' 3rd q='  q  /*ͺ*call a procedure with EXPOSE.  */
call sand       ;    say ' 4th q='  q  /*ͺ*call a subroutine or function. */
exit                                   /*ͺ*stick a fork in it, we're done.*/
/*ͺ*ββββββββββββββββββββββββββββββββββSUB subroutineββββββββββββββββββββββ*/
sub:  procedure                        /*ͺ*use PROCEDURE to use local vars*/
q = -777        ;    say ' sub q='  q  /*ͺ*assign a value ββββΊ "local" Q. */
return
/*ͺ*ββββββββββββββββββββββββββββββββββGYRO subroutineβββββββββββββββββββββ*/
gyro: procedure expose q               /*ͺ*use EXPOSE to use global var Q.*/
q = "yuppers"   ;    say 'gyro q='  q  /*ͺ*assign a value ββββΊ "exposed" Q*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββSAND subroutineβββββββββββββββββββββ*/
sand:                                  /*ͺ*all REXX variables are exposed.*/
q = "Monty"     ;    say 'sand q='  q  /*ͺ*assign a value ββββΊ "global"  Q*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Variables\variables-5.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
