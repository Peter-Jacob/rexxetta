/*ª*REXX program simulates any number of trials of the classic TV show Monty Hall problem.*/
parse arg newV1 seed .                               /*ª*obtain the optional args from the CL.*/
if newV1==''  |  newV1==","     then newV1= 1000000          /*ª*Not specified?  Then 1 million trials*/
if datatype(seed, 'W')  then call random ,, seed /*ª*Specified?  Use as a seed for RANDOM.*/
wins.= 0                                         /*ª*wins.0 â‰¡ stay,    wins.1 â‰¡ switching.*/
do  newV1;                    door.   = 0  /*ª*initialize all doors to a value of 0.*/
car= random(1, 3);        door.car= 1  /*ª*the TV show hides a car randomly.    */
newV2= random(1, 3);        newV3= door.newV2    /*ª*the contestant picks a (random) door.*/
wins.newV3 =  wins.newV3  +  1                 /*ª*bump count of  type  of win strategy.*/
end   /*ª*#*/                            /*ª* [â†‘]  perform the loop   #   times.  */
/*ª* [â†‘]  door values:   0â‰¡goat    1â‰¡car */
say 'switching wins '    format(wins.0 / newV1 * 100, , 1)"%  of the time."
say '  staying wins '    format(wins.1 / newV1 * 100, , 1)"%  of the time." ;     say
say 'performed '    newV1    " times with 3 doors."  /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Monty-Hall-problem\monty-hall-problem-2.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
