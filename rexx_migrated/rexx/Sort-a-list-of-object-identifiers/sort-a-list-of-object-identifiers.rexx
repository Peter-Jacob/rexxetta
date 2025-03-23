/*�*REXX program performs a  sort  of  OID  (Object IDentifiers ◄── used in Network data).*/
call gen                                         /*�*generate an array (@.) from the OIDs.*/
call show   'before sort ───► '                  /*�*display the  @  array before sorting.*/
say copies('░', 79) /*�*   "   fence, separate before & after*/
call adj    1                                    /*�*expand  the  $  list of OID numbers. */
call bSort  newV3                                    /*�*sort     "   "    "   "  "     "     */
call adj    0                                    /*�*shrink   "   "    "   "  "     "     */
call show   ' after sort ───► '                  /*�*display the  @  array after sorting. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
bSort: procedure expose newV1.; parse arg n;   m=n-1 /*�*N: is the number of @ array elements.*/
do m=m  for m  by -1  until ok;  ok= 1 /*�*keep sorting the @ array until done. */
do j=1  for m;     newV2= j + 1         /*�*calculate the next (index) in @ array*/
if newV1.j>newV1.newV2  then parse value    newV1.j  newV1.newV2  0      with      newV1.newV2  newV1.j  ok
end   /*�*j*/                         /*�* [↑]  swap two out─of─order elements.*/
end      /*�*m*/                         /*�* [↑]  use a simple  bubble  sort.    */
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen:   $=    1.3.6.1.4.1.11.2.17.19.3.4.0.10 ,   /*�* ◄──┐                                */
1.3.6.1.4.1.11.2.17.5.2.0.79    ,   /*�* ◄──┤                                */
1.3.6.1.4.1.11.2.17.19.3.4.0.4  ,   /*�* ◄──┼─◄─ six OID numbers (as a list).*/
1.3.6.1.4.1.11150.3.4.0.1       ,   /*�* ◄──┤                                */
1.3.6.1.4.1.11.2.17.19.3.4.0.1  ,   /*�* ◄──┤                                */
1.3.6.1.4.1.11150.3.4.0             /*�* ◄──┘                                */
w= 0                                                      /*�*W: max length of #'s.*/
newV3= words($);     do i=1  for newV3;    newV1.i= word($, i);    w= max(w, length(newV1.i) )
end   /*�*i*/                              /*�*W: max length of #'s.*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
adj:   arg LZ;  do j=1  for newV3;       x= translate(newV1.j, , .);  y= /*�*construct X version. */
do k=1  for words(x);           newV2= word(x, k) /*�*get a number in  X.  */
if LZ  then y= y right(newV2, w, 0)               /*�*(prepend) leading 0's*/
else y= y    (newV2   +   0)               /*�* (elide)     "     " */
end   /*�*k*/
newV1.j = translate( space(y), ., ' ')               /*�*reconstitute number. */
end      /*�*j*/                                   /*�*LZ:  Leading Zero(s).*/
return                                                    /*�*──   ─       ─       */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show:  do a=1 for newV3; say right("OID number",20) right(a,length(newV3)) arg(1) newV1.a; end; return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sort-a-list-of-object-identifiers\sort-a-list-of-object-identifiers.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
