/*ª*REXX program simulates a 7â”€sided die based on a 5â”€sided throw for a number of trials. */
parse arg trials sample seed .                   /*ª*obtain optional arguments from the CL*/
if trials=='' | trials=","  then trials=       1 /*ª*Not specified?  Then use the default.*/
if sample=='' | sample=","  then sample= 1000000 /*ª* "      "         "   "   "     "    */
if datatype(seed, 'W')  then call random ,,seed  /*ª*Integer?  Then use it as a RAND seed.*/
L= length(trials)                                /*ª* [â†‘]  one million samples to be used.*/

do newV1=1  for trials;            die.= 0        /*ª*performs the number of desired trials*/
k= 0
do  until k==sample;           r= 5 * random(1, 5)  +  random(1, 5)  -  6
if r>20  then iterate
k= k + 1;                      r= r // 7  +  1;          die.r= die.r + 1
end   /*ª*until*/
say
expect= sample % 7
say center('trial:' right(newV1, L)    "   "     sample  'samples, expect' expect, 80, "â”€")

do j=1  for 7
say '      side'      j       "had "       die.j           ' occurrences',
'      difference from expected:'right(die.j - expect, length(sample) )
end   /*ª*j*/
end   /*ª*#*/                                   /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Seven-sided-dice-from-five-sided-dice\seven-sided-dice-from-five-sided-dice.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
