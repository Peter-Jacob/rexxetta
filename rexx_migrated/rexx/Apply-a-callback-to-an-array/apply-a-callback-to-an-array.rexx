/*ช*REXX program applies a  callback  to an array  (using factorials for a demonstration).*/
numeric digits 100                               /*ช*be able to display some huge numbers.*/
parse arg newV1 .                                    /*ช*obtain an optional value from the CL.*/
a.=                                              /*ช*initialize the array  A  to all nulls*/
if newV1=='' | newV1==","  then newV1= 12                    /*ช*Not assigned?  Then use default value*/
do j=0  to newV1;   a.j= j   /*ช*assign the integer   J  โโโโบ   A.j   */
end   /*ช*j*/              /*ช*array  A  will have N values: 0 โโโบ #*/

call listA   'before callback'                   /*ช*display  A  array before the callback*/
say                                              /*ช*display a blank line for readability.*/
say '      ยทยทยท applying callback to array A ยทยทยท' /*ช*display what is about to happen to B.*/
say                                              /*ช*display a blank line for readability.*/
call bangit  'a'                                 /*ช*factorialize (the values) of A array.*/
/*ช*    store the results  โโโโบ  array B.*/
call listA   ' after callback'                   /*ช*display  A  array after the callback.*/
exit 0                                           /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
bangit:   do v=0;  newV2= value(arg(1)'.'v);  if newV2=='' then return  /*ช*No value?  Then return*/
call value arg(1)'.'v, fact(newV2)         /*ช*assign a value (a factorial) to array*/
end    /*ช*i*/
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
fact:   procedure; arg x;   newV3= 1;         do f=2  to x;  newV3= newV3*f;  end; /*ช*f*/;     return newV3
listA:    do k=0  while a.k\=='';  say arg(1)  'a.'k"="  a.k;     end  /*ช*k*/;     return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Apply-a-callback-to-an-array\apply-a-callback-to-an-array.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
