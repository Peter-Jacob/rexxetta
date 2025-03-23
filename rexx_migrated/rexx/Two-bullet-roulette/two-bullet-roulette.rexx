/*�*REXX pgm simulates scenarios for a two─bullet Russian roulette game with a 6 cyl. gun.*/
parse arg cyls tests seed .                      /*�*obtain optional arguments from the CL*/
if  cyls=='' |  cyls==","  then  cyls=      6    /*�*Not specified?  Then use the default.*/
if tests=='' | tests==","  then tests= 100000    /*�* "      "         "   "   "     "    */
if datatype(seed, 'W')  then call random ,,seed  /*�* "      "         "   "   "     "    */
cyls_ = cyls - 1;          newV2= copies(0, cyls)   /*�*shortcut placeholder for cylinders-1 */
newV1= 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'               /*�*indices for the various options used.*/
scenarios= 'LSLSFsF  LSLSFF  LLSFSF  LLSFF'      /*�*the list of scenarios to be tested.  */
newV3= words(scenarios)                              /*�*the number of actions in a scenario. */
/*�*The scenarios are case insensitive.  */
do m=1  for newV3;     q= word(scenarios, m) /*�*test each of the scenarios specified.*/
sum= 0                /*�*initialize the  sum  to zero.        */
do tests;       sum= sum + method()   /*�*added the sums up for the percentages*/
end   /*�*tests*/
pc= left( (sum * 100 / tests)"%",  7)
say act()   '  (option'     substr(newV1, m, 1)")   produces  "    pc    ' deaths.'
end   /*�*m*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
fire:   != left(newV4, 1);      newV4= right(newV4, cyls_)left(newV4, 1);   /*�* ◄──── next cyl.*/  return !
load:   if left(newV4, 1)  then newV4= right(newV4, cyls_)left(newV4, 1);  newV4= 1||right(newV4, cyls_); return
spin:   ?= random(1, cyls);    if ?\==cyls  then newV4= substr(newV4 || newV4, ? + 1, cyls);  return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
method: newV4= newV2;   do a=1  for length(q);          y= substr(q, a, 1)
if y=='L'  then call load
else if y=='S'  then call spin
else if y=='F'  then if fire()  then return 1
end   /*�*a*/;                                                    return 0
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
act:    newV5=;      do a=1  for length(q);          y= substr(q, a, 1)
if y=='L'  then newV5= newV5", load"
if y=='S'  then newV5= newV5", spin"
if y=='F'  then newV5= newV5", fire"
end   /*�*a*/;                  return right( strip( strip(newV5, , ",") ), 45)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Two-bullet-roulette\two-bullet-roulette.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
