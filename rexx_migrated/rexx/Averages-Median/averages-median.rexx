/*ͺ*REXX program finds the  median  of a  vector  (and displays the  vector  and  median).*/
/*ͺ*  ββββββββββvectorββββββββββββ   ββshow vectorβββ   ββββββββshow resultβββββββββββ    */
v=  1 9 2 4                ;   say "vector"  v;   say 'medianβββββββΊ' median(v);   say
v=  3 1 4 1 5 9 7 6        ;   say "vector"  v;   say 'medianβββββββΊ' median(v);   say
v= '3 4 1 -8.4 7.2 4 1 1.2';   say "vector"  v;   say 'medianβββββββΊ' median(v);   say
v=  -1.2345678e99  2.3e700 ;   say "vector"  v;   say 'medianβββββββΊ' median(v);   say
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
eSORT:  procedure expose newV1. newV3;     parse arg newV2;     newV3= words(newV2)   /*ͺ*$:  is the  vector. */
do g=1  for newV3;   newV1.g= word(newV2, g);   end  /*ͺ*g*/    /*ͺ*convert listβββΊarray*/
h=newV3                                                       /*ͺ*#:  number elements.*/
do  while  h>1;             h= h % 2              /*ͺ*cut entries by half.*/
do i=1  for newV3-h;         j= i;        k= h + i /*ͺ*sort lower section. */
do  while newV1.k<newV1.j;    parse value  newV1.j newV1.k  with  newV1.k newV1.j  /*ͺ*swap.*/
if h>=j  then leave;  j= j - h;    k= k - h /*ͺ*diminish  J  and  K.*/
end   /*ͺ*while @.k<@.j*/
end      /*ͺ*i*/
end         /*ͺ*while h>1*/                         /*ͺ*end of exchange sort*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
median: procedure; call eSORT arg(1);   m= newV3 % 2    /*ͺ*   %   is REXX's integer division.*/
n= m + 1                                    /*ͺ*N:     the next element after  M. */
if newV3 // 2  then return newV1.n                  /*ͺ*[odd?]   // ββββREXX's Γ· remainder*/
return (newV1.m + newV1.n) / 2      /*ͺ*process an  evenβelement  vector. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Averages-Median\averages-median.rexx was migrated on 23 Mar 2025 at 10:43:06
 * -------------------------------------------------------------------------
*/ 
