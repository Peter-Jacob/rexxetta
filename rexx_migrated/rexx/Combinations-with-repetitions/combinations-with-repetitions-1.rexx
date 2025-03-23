/*�*REXX pgm displays combination sets with repetitions for  X  things taken  Y  at a time*/
call RcombN    3,  2,  'iced jam plain'          /*�*The  1st  part of Rosetta Code task. */
call RcombN  -10,  3,  'Iced jam plain'          /*�* "   2nd    "   "    "      "    "   */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
RcombN: procedure; parse arg x,y,syms;  tell= x>0;  x=abs(x);   z=x+1  /*�*X>0? Show combo*/
say copies('─',15) x "doughnut selection taken" y 'at a time:' /*�*display title. */
do i=1  for words(syms);           newV1.i=word(syms, i)    /*�*assign symbols.*/
end   /*�*i*/
newV2.=1                                                           /*�*assign default.*/
do newV3=1;        if tell    then  call show               /*�*display combos?*/
newV2.y=newV2.y + 1;   if newV2.y==z  then  if .(y-1)  then leave   /*�* ◄─── recursive*/
end   /*�*#*/
say copies('═',15)  newV3  "combinations.";    say;   say          /*�*display answer.*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.: procedure expose newV2. y z;   parse arg newV4;     if newV4==0  then return 1;            p=newV2.newV4 +1
if p==z  then return .(newV4 -1);      do j=newV4  to y;   newV2.j=p;   end  /*�*j*/;   return 0
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:   L=;      do c=1  for y;   newV5=newV2.c;   L=L newV1.newV5;   end  /*�*c*/;       say L;    return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Combinations-with-repetitions\combinations-with-repetitions-1.rexx was migrated on 23 Mar 2025 at 10:43:08
 * -------------------------------------------------------------------------
*/ 
