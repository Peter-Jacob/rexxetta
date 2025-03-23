/*�*REXX program generates all  permutations  of   N   derangements  and  subfactorial #  */
numeric digits 1000                              /*�*be able to handle large subfactorials*/
parse arg N .;     if N=='' | N==","  then N=4   /*�*Not specified?  Then use the default.*/
d= derangeSet(N)                                 /*�*go and build the  derangements  set. */
say d  'derangements for'    N    "items are:"
say
do i=1  for  d                             /*�*display the derangements for N items.*/
say right('derangement', 22)       right(i, length(d) )        '───►'         newV1.i
end   /*�*i*/
say                                              /*�* [↓]  count and calculate subfact !L.*/
do L=0  to 2;  d= derangeSet(L)
say L 'items:  derangement count='right(d, 6)",  !"L'='right( !s(L), 6)
end   /*�*L*/
say
say right('!20=' , 22)     !s( 20)
say right('!200=', 22)     !s(200)
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
!s:         newV3=1;      do j=1  for arg(1);  if j//2  then newV3= j*newV3  -  1;     else newV3=j*newV3  + 1
end   /*�*j*/;                       return newV3
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
derangeSet: procedure expose newV1.;  parse arg x;   newV1.=;    newV4=0;   p=x-1
if x==0  then return 1;  if x==1  then return 0
newV2.1=2;  newV2.2=1                                    /*�*populate 1st derangement.*/
do i=3  to x;  newV2.i=i;  end  /*�*i*/              /*�*    "    the rest of 'em.*/
parse value  newV2.p  newV2.x   with   newV2.x  newV2.p;   call .buildD x    /*�*swap & build.*/
/*�*build others.*/
do while .nextD(x, 0);  call .buildD x;   end;                  return newV4
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.buildD:              do j=1  for arg(1);   if newV2.j==j  then return;  end
newV4=newV4+1;    do j=1  for arg(1);   newV1.newV4= newV1.newV4 newV2.j;            end;     return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
.nextD:     procedure expose newV2.;  parse arg n,i

do k=n-1  by -1  for n-1;  kp=k+1;     if newV2.k<newV2.kp  then do; i=k; leave; end
end   /*�*k*/

do j=i+1  while j<n;       parse value  newV2.j  newV2.n   with   newV2.n  newV2.j;   n=n-1
end   /*�*j*/
if i==0  then return 0
do m=i+1  while newV2.m<newV2.i;   end  /*�*m*/          /*�* [↓]  swap two values.   */
parse  value   newV2.m newV2.i   with   newV2.i newV2.m;                          return 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Permutations-Derangements\permutations-derangements.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
