/*ͺ*REXX program performs a  sort  of  OID  (Object IDentifiers βββ used in Network data).*/
call gen                                         /*ͺ*generate an array (@.) from the OIDs.*/
call show   'before sort ββββΊ '                  /*ͺ*display the  @  array before sorting.*/
say copies('β', 79) /*ͺ*   "   fence, separate before & after*/
call adj    1                                    /*ͺ*expand  the  $  list of OID numbers. */
call bSort  newV3                                    /*ͺ*sort     "   "    "   "  "     "     */
call adj    0                                    /*ͺ*shrink   "   "    "   "  "     "     */
call show   ' after sort ββββΊ '                  /*ͺ*display the  @  array after sorting. */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
bSort: procedure expose newV1.; parse arg n;   m=n-1 /*ͺ*N: is the number of @ array elements.*/
do m=m  for m  by -1  until ok;  ok= 1 /*ͺ*keep sorting the @ array until done. */
do j=1  for m;     newV2= j + 1         /*ͺ*calculate the next (index) in @ array*/
if newV1.j>newV1.newV2  then parse value    newV1.j  newV1.newV2  0      with      newV1.newV2  newV1.j  ok
end   /*ͺ*j*/                         /*ͺ* [β]  swap two outβofβorder elements.*/
end      /*ͺ*m*/                         /*ͺ* [β]  use a simple  bubble  sort.    */
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
gen:   $=    1.3.6.1.4.1.11.2.17.19.3.4.0.10 ,   /*ͺ* ββββ                                */
1.3.6.1.4.1.11.2.17.5.2.0.79    ,   /*ͺ* ββββ€                                */
1.3.6.1.4.1.11.2.17.19.3.4.0.4  ,   /*ͺ* ββββΌβββ six OID numbers (as a list).*/
1.3.6.1.4.1.11150.3.4.0.1       ,   /*ͺ* ββββ€                                */
1.3.6.1.4.1.11.2.17.19.3.4.0.1  ,   /*ͺ* ββββ€                                */
1.3.6.1.4.1.11150.3.4.0             /*ͺ* ββββ                                */
w= 0                                                      /*ͺ*W: max length of #'s.*/
newV3= words($);     do i=1  for newV3;    newV1.i= word($, i);    w= max(w, length(newV1.i) )
end   /*ͺ*i*/                              /*ͺ*W: max length of #'s.*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
adj:   arg LZ;  do j=1  for newV3;       x= translate(newV1.j, , .);  y= /*ͺ*construct X version. */
do k=1  for words(x);           newV2= word(x, k) /*ͺ*get a number in  X.  */
if LZ  then y= y right(newV2, w, 0)               /*ͺ*(prepend) leading 0's*/
else y= y    (newV2   +   0)               /*ͺ* (elide)     "     " */
end   /*ͺ*k*/
newV1.j = translate( space(y), ., ' ')               /*ͺ*reconstitute number. */
end      /*ͺ*j*/                                   /*ͺ*LZ:  Leading Zero(s).*/
return                                                    /*ͺ*ββ   β       β       */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show:  do a=1 for newV3; say right("OID number",20) right(a,length(newV3)) arg(1) newV1.a; end; return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sort-a-list-of-object-identifiers\sort-a-list-of-object-identifiers.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
