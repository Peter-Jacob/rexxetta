/*�*REXX program displays permutations of   N   number of  objects  (1, 2, 3,  ···).      */
parse arg N y seed .                             /*�*obtain optional arguments from the CL*/
if N=='' | N==","  then N=  4                    /*�*Not specified?  Then use the default.*/
if y=='' | y==","  then y= 17                    /*�* "      "         "   "   "     "    */
if datatype(seed,'W')  then call random ,,seed   /*�*can make RANDOM numbers repeatable.  */
permutes= permSets(N)                            /*�*returns  N! (number of permutations).*/
w= length(permutes)                              /*�*used for aligning the  SAY  output.  */
newV1.=
do p=0  for permutes                       /*�*traipse through each of the permutes.*/
z= permSets(N, p)                          /*�*get which of the  permutation  it is.*/
say 'for'     N     "items, permute rank"      right(p,w)        'is: '        z
newV1.p= z                                     /*�*define a rank permutation in @ array.*/
end   /*�*p*/
say                                              /*�* [↓]  displays a particular perm rank*/
say '  the permutation rank of'  y  "is: "   newV1.y /*�*display a particular permutation rank*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
permSets:   procedure expose newV1. newV2;     newV2= 0;   parse arg x,r,c;   c= space(c);    xm= x -1
do j=1  for x;     newV1.j= j-1;   end  /*�*j*/
newV3=0;    do u=2  for xm;    newV3= newV3 newV1.u;   end  /*�*u*/
if r==newV2  then return newV3;            if c==newV3  then return newV2
do  while .permSets(x,0);  newV2= newV2+1;            newV3= newV1.1
do v=2  for xm;    newV3= newV3  newV1.v;    end  /*�*v*/
if r==newV2  then return  newV3;   if c==newV3  then return newV2
end   /*�*while···*/
return newV2+1
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.permSets:  procedure expose newV1.;       parse arg p,q;                  pm= p-1
do k=pm  by -1  for pm;   kp= k+1;  if newV1.k<newV1.kp  then do; q=k; leave; end
end   /*�*k*/

do j=q+1  while j<p;  parse  value  newV1.j  newV1.p   with   newV1.p  newV1.j;    p= p-1
end   /*�*j*/
if q==0  then return 0
do p=q+1  while newV1.p<newV1.q
end   /*�*p*/
parse  value   newV1.p  newV1.q   with   newV1.q  newV1.p
return 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Permutations-Rank-of-a-permutation\permutations-rank-of-a-permutation.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
