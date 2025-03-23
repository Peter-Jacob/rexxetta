/*�*REXX pgm solves the  McNuggets problem:  the largest McNugget number for given meals. */
parse arg y                                      /*�*obtain optional arguments from the CL*/
if y='' | y=","  then y= 6 9 20                  /*�*Not specified?  Then use the defaults*/
say 'The number of McNuggets in the serving sizes of: '    space(y)
newV3=
newV4= 0                                             /*�*the Y list must be in ascending order*/
z=.
do j=1  for words(y);      newV5= word(y, j)  /*�*examine  Y  list for dups, neg, zeros*/
if newV5==1               then signal done    /*�*Value ≡ 1?  Then all values possible.*/
if newV5<1                then iterate        /*�*ignore zero and negative # of nuggets*/
if wordpos(newV5, newV3)\==0  then iterate        /*�*search for duplicate values.         */
do k=1  for newV4                        /*�*   "    "  multiple     "            */
if newV5//word(newV3,k)==0  then iterate j   /*�*a multiple of a previous value, skip.*/
end   /*�*k*/
newV3= newV3 newV5;      newV4= newV4 + 1;     newV1.newV4= newV5         /*�*add─►list; bump counter; assign value*/
end        /*�*j*/
if newV4<2                     then signal done      /*�*not possible, go and tell bad news.  */
newV5= gcd(newV3)        if newV5\==1  then signal done      /*�* "     "       "  "   "    "    "    */
if newV4==2   then z= newV1.1 * newV1.2  -  newV1.1  -  newV1.2      /*�*special case, construct the result.  */
if z\==.  then signal done
h= 0                                             /*�*construct a theoretical high limit H.*/
do j=2  for newV4-1;  newV5= j-1;       newV5= newV1.newV5;       h= max(h, newV5 * newV1.j  -  newV5  -  newV1.j)
end   /*�*j*/
newV2.=0
do j=1  for newV4;    newV5= newV1.j                  /*�*populate the  Jth + Kth   summand.   */
do a=newV5  by newV5  to h;           newV2.a= 1    /*�*populate every multiple as possible. */
end   /*�*s*/

do k=1  for h;  if \newV2.k  then iterate
s= k + newV5;       newV2.s= 1                  /*�*add two #s;   mark as being possible.*/
end   /*�*k*/
end     /*�*j*/

do z=h  by -1  for h  until \newV2.z          /*�*find largest integer not summed.     */
end     /*�*z*/
say
done:  if z==.  then say 'The largest McNuggets number not possible.'
else say 'The largest McNuggets number is: '          z
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gcd: procedure; newV3=;    do j=1  for arg();  newV3=newV3 arg(j);  end;  newV3= space(newV3)
parse var newV3 x newV3;     x= abs(x);
do  while newV3\=='';  parse var newV3 y newV3;  y= abs(y);  if y==0  then iterate
do  until y==0;  parse value  x//y  y   with   y  x;  end
end;              return x
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\McNuggets-problem\mcnuggets-problem.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
