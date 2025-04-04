/*Ș*REXX program reports on the amount of elapsed time 4 different tasks use (wall clock).*/
time.=                                           /*Ș*nullify times for all the tasks below*/
/*Ș*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
call time 'Reset'                                /*Ș*reset the REXX (elapsed) clock timer.*/
/*Ș*show pi in hex to  2,000 dec. digits.*/
task.1= 'base(pi,16)  ;;;  lowercase   digits 2k   echoOptions'
call '$CALC' task.1            /*Ș*perform task number one  (via $CALC).*/
time.1=time('E')                                 /*Ș*get and save the time used by task 1.*/
/*Ș*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
call time 'Reset'                                /*Ș*reset the REXX (elapsed) clock timer.*/
/*Ș*get primes  40000 âââș 40800 and      */
/*Ș*show their differences.              */
task.2= 'diffs[ prime(40k, 40.8k) ]  ;;;  GRoup 20'
call '$CALC' task.2            /*Ș*perform task number two  (via $CALC).*/
time.2=time('E')                                 /*Ș*get and save the time used by task 2.*/
/*Ș*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
call time 'Reset'                                /*Ș*reset the REXX (elapsed) clock timer.*/
/*Ș*show the  Collatz sequence  for a    */
/*Ș*stupidly gihugeic number.            */
task.3= 'Collatz(38**8)  ;;;  Horizontal'
call '$CALC' task.3            /*Ș*perform task number three (via $CALC)*/
time.3=time('E')                                 /*Ș*get and save the time used by task 3.*/
/*Ș*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
call time 'Reset'                                /*Ș*reset the REXX (elapsed) clock timer.*/
newV1=  äćçòćć éîăòćíćîôóź*/
/*Ș*using five decimal digits  (ÂŹ 60).   */
task.4= 'sinD(-180, +180, 0.5)  ;;;  Plot  DIGits 5   echoOptions'
call '$CALC' task.4            /*Ș*perform task number four (via $CALC).*/
time.4=time('E')                                 /*Ș*get and save the time used by task 4.*/
/*Ș*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
say
do j=1  while  time.j\==''
say 'time used for task'     j     "was"     right(format(time.j,,0),4)     'seconds.'
end   /*Ș*j*/
/*Ș*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rate-counter\rate-counter.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
