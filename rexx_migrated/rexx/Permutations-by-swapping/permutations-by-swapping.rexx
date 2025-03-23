/*�*REXX program  generates all  permutations  of   N   different objects by  swapping.   */
parse arg things bunch .                         /*�*obtain optional arguments from the CL*/
if things=='' | things==","  then things=4       /*�*Not specified?  Then use the default.*/
if bunch =='' | bunch ==","  then bunch =things  /*�* "      "         "   "   "     "    */
call permSets things, bunch                      /*�*invoke permutations by swapping sub. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
newV2:        procedure;  newV2=1;        do j=2  to arg(1);    newV2=newV2*j;     end;           return newV2
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
permSets: procedure; parse arg x,y               /*�*take   X  things   Y   at a time.    */
newV1.=0;      pad=left('', x*y)           /*�*X can't be > length of below str (62)*/
z=left('123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', x);  q=z
newV3=1                                    /*�*the number of permutations  (so far).*/
newV1.z=1;    s=1;   times=newV2(x) % newV2(x-y)   /*�*calculate (#) TIMES  using factorial.*/
w=max(length(z), length('permute') )   /*�*maximum width of  Z and also PERMUTE.*/
say center('permutations for '   x   ' things taken '   y   " at a time",60,'═')
say
say   pad    'permutation'       center("permute", w, '─')         "sign"
say   pad    '───────────'       center("───────", w, '─')         "────"
say   pad    center(newV3, 11)       center(z        , w)              right(s, 4-1)

do newV4=1   until  newV3==times            /*�*perform permutation until # of times.*/
do   k=1    for x-1               /*�*step thru things for  things-1 times.*/
do m=k+1  to  x;      newV5=        /*�*this method doesn't use  adjacency.  */
do n=1  for x               /*�*build the new permutation by swapping*/
if n\==k & n\==m  then               newV5 =  newV5  ||  substr(z, n, 1)
else if n==k  then newV5 =  newV5  ||  substr(z, m, 1)
else newV5 =  newV5  ||  substr(z, k, 1)
end   /*�*n*/
z=newV5                             /*�*save this permutation for next swap. */
if newV1.newV5  then iterate m          /*�*if defined before, then try next one.*/
newV6=0                             /*�* [↓]  count number of swapped symbols*/
do d=1  for x  while newV4\==1;  newV6= newV6 + (substr(newV5,d,1)\==substr(prev,d,1))
end   /*�*d*/
if newV6>2  then do;        newV6=z
a=newV4//x+1;  q=q + newV6 /*�* [← ↓]  this swapping tries adjacency*/
b=q//x+1;  if b==a  then b=a + 1;       if b>x  then b=a - 1
z=overlay( substr(z,b,1), overlay( substr(z,a,1), newV6, b),  a)
iterate newV4          /*�*now, try this particular permutation.*/
end
newV3=newV3+1;  s= -s;   say pad   center(newV3, 11)    center(newV5, w)    right(s, 4-1)
newV1.newV5=1;  prev=newV5;      iterate newV4  /*�*now, try another swapped permutation.*/
end   /*�*m*/
end     /*�*k*/
end       /*�*$*/
return                                 /*�*we're all finished with permutating. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Permutations-by-swapping\permutations-by-swapping.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
