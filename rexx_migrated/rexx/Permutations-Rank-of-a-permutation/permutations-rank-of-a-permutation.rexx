/*ͺ*REXX program displays permutations of   N   number of  objects  (1, 2, 3,  Β·Β·Β·).      */
parse arg N y seed .                             /*ͺ*obtain optional arguments from the CL*/
if N=='' | N==","  then N=  4                    /*ͺ*Not specified?  Then use the default.*/
if y=='' | y==","  then y= 17                    /*ͺ* "      "         "   "   "     "    */
if datatype(seed,'W')  then call random ,,seed   /*ͺ*can make RANDOM numbers repeatable.  */
permutes= permSets(N)                            /*ͺ*returns  N! (number of permutations).*/
w= length(permutes)                              /*ͺ*used for aligning the  SAY  output.  */
newV1.=
do p=0  for permutes                       /*ͺ*traipse through each of the permutes.*/
z= permSets(N, p)                          /*ͺ*get which of the  permutation  it is.*/
say 'for'     N     "items, permute rank"      right(p,w)        'is: '        z
newV1.p= z                                     /*ͺ*define a rank permutation in @ array.*/
end   /*ͺ*p*/
say                                              /*ͺ* [β]  displays a particular perm rank*/
say '  the permutation rank of'  y  "is: "   newV1.y /*ͺ*display a particular permutation rank*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
permSets:   procedure expose newV1. newV2;     newV2= 0;   parse arg x,r,c;   c= space(c);    xm= x -1
do j=1  for x;     newV1.j= j-1;   end  /*ͺ*j*/
newV3=0;    do u=2  for xm;    newV3= newV3 newV1.u;   end  /*ͺ*u*/
if r==newV2  then return newV3;            if c==newV3  then return newV2
do  while .permSets(x,0);  newV2= newV2+1;            newV3= newV1.1
do v=2  for xm;    newV3= newV3  newV1.v;    end  /*ͺ*v*/
if r==newV2  then return  newV3;   if c==newV3  then return newV2
end   /*ͺ*whileΒ·Β·Β·*/
return newV2+1
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
.permSets:  procedure expose newV1.;       parse arg p,q;                  pm= p-1
do k=pm  by -1  for pm;   kp= k+1;  if newV1.k<newV1.kp  then do; q=k; leave; end
end   /*ͺ*k*/

do j=q+1  while j<p;  parse  value  newV1.j  newV1.p   with   newV1.p  newV1.j;    p= p-1
end   /*ͺ*j*/
if q==0  then return 0
do p=q+1  while newV1.p<newV1.q
end   /*ͺ*p*/
parse  value   newV1.p  newV1.q   with   newV1.q  newV1.p
return 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Permutations-Rank-of-a-permutation\permutations-rank-of-a-permutation.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
