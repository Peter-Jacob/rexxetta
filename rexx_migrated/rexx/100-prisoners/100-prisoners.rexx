/*ช*REXX program to simulate the problem of 100 prisoners:  random,  and optimal strategy.*/
parse arg men trials seed .                      /*ช*obtain optional arguments from the CL*/
if    men=='' |    men==","  then    men=    100 /*ช*number of   prisoners   for this run.*/
if trials=='' | trials==","  then trials= 100000 /*ช*  "     "  simulations   "    "   "  */
if datatype(seed, 'W')  then call random ,,seed  /*ช*seed for the random number generator.*/
try= men % 2;                swaps= men * 3      /*ช*number tries for searching for a card*/
newV1.1= ' a simple ';           newV1.2= "an optimal"   /*ช*literals used for the SAY instruction*/
say center(' running'  commas(trials)   "trials with"  commas(men)  'prisoners ', 70, "โ")
say
do strategy=1  for 2;    pardons= 0          /*ช*perform the two types of strategies. */

do trials;             call gCards         /*ช*do trials for a strategy;  gen cards.*/
do p=1  for men  until failure           /*ช*have each prisoner go through process*/
if strategy==1  then failure= simple()   /*ช*Is 1st strategy?  Use simple strategy*/
else failure= picker()   /*ช* " 2nd     "       "  optimal   "    */
end   /*ช*p*/                              /*ช*FAILURE โก 1?  Then a prisoner failed.*/
if newV6==men  then pardons= pardons + 1       /*ช*was there a pardon of all prisoners? */
end     /*ช*trials*/                         /*ช*if 1 prisoner fails, then they all do*/

pc= format( pardons/trials*100, , 3);                           newV4= left('', pc<10)
say right('Using', 9)  newV1.strategy  "strategy yields pardons "   newV4||pc"%  of the time."
end       /*ช*strategy*/
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
commas:  parse arg newV4;  do c=length(newV4)-3  to 1  by -3; newV4= insert(',', newV4, c); end;  return newV4
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
gCards: newV6= 0;                do j=1  for men;  newV2.j= j             /*ช*define seq. of cards*/
end   /*ช*j*/                          /*ช*same as seq. of men.*/
do swaps;             a= random(1, men)            /*ช*get 1st rand number.*/
do until  b\==a;  b= random(1, men)            /*ช* "  2nd   "     "   */
end   /*ช*until*/                                /*ช* [โ] ensure A ยฌ== B */
parse value  newV2.a newV2.b  with  newV2.b newV2.a                /*ช*swap 2 random cards.*/
end       /*ช*swaps*/;  return
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
simple: newV3.= 0; do try;         do until newV3.newV5==0; newV5= random(1, men) /*ช*get random card ยทยทยท */
end   /*ช*until*/                    /*ช*ยทยทยท not used before.*/
if newV2.newV5==p  then do;   newV6= newV6+1;  return 0;  end      /*ช*found his own card? */
newV3.newV5= 1                                             /*ช*flag as being used. */
end   /*ช*try*/;        return 1                     /*ช*didn't find his card*/
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
picker: newV5= p;  do try; if newV2.newV5==p  then do;   newV6= newV6+1;    return 0  /*ช*Found his own card? */
end       /*ช* [โ]  indicate success for prisoner. */
newV5= newV2.newV5                            /*ช*choose next drawer from current card.*/
end   /*ช*try*/;        return 1    /*ช*choose half of the number of drawers.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\100-prisoners\100-prisoners.rexx was migrated on 23 Mar 2025 at 10:43:03
 * -------------------------------------------------------------------------
*/ 
