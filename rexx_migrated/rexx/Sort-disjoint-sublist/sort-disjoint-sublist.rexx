/*�*REXX program uses a   disjointed sublist   to  sort  a  random list  of values.       */
parse arg old ',' idx                            /*�*obtain the optional lists from the CL*/
if old=''  then old= 7 6 5 4 3 2 1 0             /*�*Not specified:  Then use the default.*/
if idx=''  then idx= 7 2 8                       /*�* "      "         "   "   "     "    */
say '  list of indices:'  idx;   say             /*�*    [↑]  is for one─based lists.     */
say '    unsorted list:'  old                    /*�*display the  old  list of numbers.   */
say '      sorted list:'  disjoint_sort(old,idx) /*�*sort 1st list using 2nd list indices.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
disjoint_sort: procedure;    parse arg x,ix;   y=;    z=;    p= 0
ix= sortL(ix)                           /*�*ensure the index list is sorted*/
do i=1  for  words(ix)             /*�*extract indexed values from  X.*/
z= z   word(x, word(ix, i) )       /*�*pick the correct value from  X.*/
end   /*�*j*/
z= sortL(z)                             /*�*sort extracted (indexed) values*/
do m=1  for words(x)               /*�*re─build (re-populate)  X list.*/
if wordpos(m, ix)==0  then y=y  word(x,m)    /*�*is the same  or  new?*/
else do;  p= p + 1;        y= y word(z, p)
end
end   /*�*m*/
return strip(y)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sortL: procedure; parse arg L;    n= words(L);       do j=1  for n;        newV1.j= word(L,j)
end   /*�*j*/
do k=1  for n-1                               /*�*sort a list using a slow method*/
do m=k+1  to n;   if newV1.m<newV1.k  then parse value   newV1.k  newV1.m    with  newV1.m  newV1.k
end   /*�*m*/
end     /*�*k*/                                 /*�* [↑]  use  PARSE  for swapping.*/
newV2= newV1.1;               do j=2  to n;   newV2= newV2 newV1.j
end   /*�*j*/
return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sort-disjoint-sublist\sort-disjoint-sublist.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
