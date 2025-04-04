/*ͺ*REXX pgm sorts an array of integers (can be negative) using the  countβsort algorithm.*/
newV3= '1 3 6 2 7 13 20 12 21 11 22 10 23 9 24 8 25 43 62 42 63 41 18 42 17 43 16 44 15 45 14 46 79 113 78 114 77 39 78 38'
newV4= words(newV3);          w= length(newV4);     newV1.= 0    /*ͺ* [β]  a list of some Recaman numbers.*/
m= 1;                 LO= word(newV3, newV4);   HI= LO   /*ͺ*M: max width of any integer in $ list*/
do j=1  for newV4;  z= word(newV3, j)+0;  newV2.j= z;  m= max(m, length(z) ) /*ͺ*get from $ list*/
newV1.z= newV1.z + 1;   LO= min(LO, z);   HI= max(HI, z)                 /*ͺ*find LO and HI.*/
end   /*ͺ*j*/
/*ͺ*W:  max index width for the @. array.*/
call show 'before sort: ';   say copies('β', 55) /*ͺ*show the   before   array elements.  */
call countSort   newV4                               /*ͺ*sort a number of entries of @. array.*/
call show ' after sort: '                        /*ͺ*show the    after   array elements.  */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
countSort: parse arg N;  x= 1;    do k=LO  to  HI;   do x=x  for newV1.k;  newV2.x= k;  end  /*ͺ*x*/
end   /*ͺ*k*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: do s=1  for newV4;  say right("element",20) right(s,w) arg(1) right(newV2.s,m); end;  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sorting-algorithms-Counting-sort\sorting-algorithms-counting-sort-1.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
