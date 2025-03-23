/*�*REXX program   executes   a  named  procedure  a specified number of times.           */
parse arg pN newV1 .                                 /*�*obtain optional arguments from the CL*/
if newV1=='' | newV1==","   then newV1= 1                    /*�*assume  once  if not specified.      */
if pN\==''          then call repeats pN, newV1      /*�*invoke the REPEATS procedure for  pN.*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
repeats: procedure;  parse arg x,n               /*�*obtain the procedureName & # of times*/
do n;  interpret 'CALL' x;  end  /*�*repeat the invocation    N    times. */
return                                  /*�*return to invoker of the REPEATS proc*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
yabba:   say 'Yabba, yabba do!';          return /*�*simple code;  no need for  PROCEDURE.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Repeat\repeat.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
