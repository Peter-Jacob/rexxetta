/*�*REXX program simulates any number of trials of the classic TV show Monty Hall problem.*/
parse arg newV1 seed .                               /*�*obtain the optional args from the CL.*/
if newV1==''  |  newV1==","     then newV1= 1000000          /*�*Not specified?  Then 1 million trials*/
if datatype(seed, 'W')  then call random ,, seed /*�*Specified?  Use as a seed for RANDOM.*/
wins.= 0                                         /*�*wins.0 ≡ stay,    wins.1 ≡ switching.*/
do  newV1;                    door.   = 0  /*�*initialize all doors to a value of 0.*/
car= random(1, 3);        door.car= 1  /*�*the TV show hides a car randomly.    */
newV2= random(1, 3);        newV3= door.newV2    /*�*the contestant picks a (random) door.*/
wins.newV3 =  wins.newV3  +  1                 /*�*bump count of  type  of win strategy.*/
end   /*�*#*/                            /*�* [↑]  perform the loop   #   times.  */
/*�* [↑]  door values:   0≡goat    1≡car */
say 'switching wins '    format(wins.0 / newV1 * 100, , 1)"%  of the time."
say '  staying wins '    format(wins.1 / newV1 * 100, , 1)"%  of the time." ;     say
say 'performed '    newV1    " times with 3 doors."  /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Monty-Hall-problem\monty-hall-problem-2.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
