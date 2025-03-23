/*�*REXX program applies a  callback  to an array  (using factorials for a demonstration).*/
numeric digits 100                               /*�*be able to display some huge numbers.*/
parse arg newV1 .                                    /*�*obtain an optional value from the CL.*/
a.=                                              /*�*initialize the array  A  to all nulls*/
if newV1=='' | newV1==","  then newV1= 12                    /*�*Not assigned?  Then use default value*/
do j=0  to newV1;   a.j= j   /*�*assign the integer   J  ───►   A.j   */
end   /*�*j*/              /*�*array  A  will have N values: 0 ──► #*/

call listA   'before callback'                   /*�*display  A  array before the callback*/
say                                              /*�*display a blank line for readability.*/
say '      ··· applying callback to array A ···' /*�*display what is about to happen to B.*/
say                                              /*�*display a blank line for readability.*/
call bangit  'a'                                 /*�*factorialize (the values) of A array.*/
/*�*    store the results  ───►  array B.*/
call listA   ' after callback'                   /*�*display  A  array after the callback.*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
bangit:   do v=0;  newV2= value(arg(1)'.'v);  if newV2=='' then return  /*�*No value?  Then return*/
call value arg(1)'.'v, fact(newV2)         /*�*assign a value (a factorial) to array*/
end    /*�*i*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
fact:   procedure; arg x;   newV3= 1;         do f=2  to x;  newV3= newV3*f;  end; /*�*f*/;     return newV3
listA:    do k=0  while a.k\=='';  say arg(1)  'a.'k"="  a.k;     end  /*�*k*/;     return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Apply-a-callback-to-an-array\apply-a-callback-to-an-array.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
