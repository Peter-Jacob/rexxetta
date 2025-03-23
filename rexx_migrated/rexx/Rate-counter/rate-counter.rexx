/*�*REXX program reports on the amount of elapsed time 4 different tasks use (wall clock).*/
time.=                                           /*�*nullify times for all the tasks below*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
call time 'Reset'                                /*�*reset the REXX (elapsed) clock timer.*/
/*�*show pi in hex to  2,000 dec. digits.*/
task.1= 'base(pi,16)  ;;;  lowercase   digits 2k   echoOptions'
call '$CALC' task.1            /*�*perform task number one  (via $CALC).*/
time.1=time('E')                                 /*�*get and save the time used by task 1.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
call time 'Reset'                                /*�*reset the REXX (elapsed) clock timer.*/
/*�*get primes  40000 ──► 40800 and      */
/*�*show their differences.              */
task.2= 'diffs[ prime(40k, 40.8k) ]  ;;;  GRoup 20'
call '$CALC' task.2            /*�*perform task number two  (via $CALC).*/
time.2=time('E')                                 /*�*get and save the time used by task 2.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
call time 'Reset'                                /*�*reset the REXX (elapsed) clock timer.*/
/*�*show the  Collatz sequence  for a    */
/*�*stupidly gihugeic number.            */
task.3= 'Collatz(38**8)  ;;;  Horizontal'
call '$CALC' task.3            /*�*perform task number three (via $CALC)*/
time.3=time('E')                                 /*�*get and save the time used by task 3.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
call time 'Reset'                                /*�*reset the REXX (elapsed) clock timer.*/
newV1=������������������*/
/*�*using five decimal digits  (¬ 60).   */
task.4= 'sinD(-180, +180, 0.5)  ;;;  Plot  DIGits 5   echoOptions'
call '$CALC' task.4            /*�*perform task number four (via $CALC).*/
time.4=time('E')                                 /*�*get and save the time used by task 4.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
say
do j=1  while  time.j\==''
say 'time used for task'     j     "was"     right(format(time.j,,0),4)     'seconds.'
end   /*�*j*/
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rate-counter\rate-counter.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
