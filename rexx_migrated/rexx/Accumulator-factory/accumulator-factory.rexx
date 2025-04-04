/*ª*REXX program shows one method an   accumulator factory   could be implemented.        */
x=.accumulator(1)                                /*ª*initialize accumulator with a 1 value*/
x=call(5)
x=call(2.3)
say '          X value is now'   x               /*ª*displays the current value of   X.   */
say 'Accumulator value is now'  sum              /*ª*displays the current value of  accum.*/
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
.accumulator:  procedure expose sum;   if symbol('SUM')=="LIT"  then sum=0   /*ª*1st time?*/
sum=sum + arg(1)                                              /*ª*addâââºsum*/
return sum
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
call:  procedure expose sum;  sum=sum+arg(1);    return sum          /*ª*add arg1 âââº sum.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Accumulator-factory\accumulator-factory.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
