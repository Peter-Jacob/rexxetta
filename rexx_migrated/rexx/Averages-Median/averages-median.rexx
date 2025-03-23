/*�*REXX program finds the  median  of a  vector  (and displays the  vector  and  median).*/
/*�*  ══════════vector════════════   ══show vector═══   ════════show result═══════════    */
v=  1 9 2 4                ;   say "vector"  v;   say 'median──────►' median(v);   say
v=  3 1 4 1 5 9 7 6        ;   say "vector"  v;   say 'median──────►' median(v);   say
v= '3 4 1 -8.4 7.2 4 1 1.2';   say "vector"  v;   say 'median──────►' median(v);   say
v=  -1.2345678e99  2.3e700 ;   say "vector"  v;   say 'median──────►' median(v);   say
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
eSORT:  procedure expose newV1. newV3;     parse arg newV2;     newV3= words(newV2)   /*�*$:  is the  vector. */
do g=1  for newV3;   newV1.g= word(newV2, g);   end  /*�*g*/    /*�*convert list──►array*/
h=newV3                                                       /*�*#:  number elements.*/
do  while  h>1;             h= h % 2              /*�*cut entries by half.*/
do i=1  for newV3-h;         j= i;        k= h + i /*�*sort lower section. */
do  while newV1.k<newV1.j;    parse value  newV1.j newV1.k  with  newV1.k newV1.j  /*�*swap.*/
if h>=j  then leave;  j= j - h;    k= k - h /*�*diminish  J  and  K.*/
end   /*�*while @.k<@.j*/
end      /*�*i*/
end         /*�*while h>1*/                         /*�*end of exchange sort*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
median: procedure; call eSORT arg(1);   m= newV3 % 2    /*�*   %   is REXX's integer division.*/
n= m + 1                                    /*�*N:     the next element after  M. */
if newV3 // 2  then return newV1.n                  /*�*[odd?]   // ◄───REXX's ÷ remainder*/
return (newV1.m + newV1.n) / 2      /*�*process an  even─element  vector. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Averages-Median\averages-median.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
