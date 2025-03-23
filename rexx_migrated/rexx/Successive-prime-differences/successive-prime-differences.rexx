/*�*REXX program finds and displays  primes  with successive differences  (up to a limit).*/
parse arg H . 1 . difs                           /*�*allow the highest number be specified*/
if H=='' | H==","  then  H= 1000000              /*�*Not specified?  Then use the default.*/
if difs=''   then  difs= 2 1 2.2 2.4 4.2 6.4.2   /*�* "      "         "   "   "     "    */
call genP H

do j=1  for words(difs)                             /*�*traipse through the lists.*/
dif= translate( word(difs, j),,.);  dw= words(dif)  /*�*obtain true differences.  */
do i=1  for dw;  dif.i= word(dif, i)            /*�*build an array of diffs.  */
end   /*�*i*/                                     /*�* [↑]  for optimization.   */
say center('primes with differences of:'  dif,  50, '─')        /*�*display title.*/
p= 1;                        c= 0;        grp=      /*�*init. prime#,  count, grp.*/
do a=1;  p= nextP(p+1);  if p==0  then leave   /*�*find the next  DIF  primes*/
aa= p;   newV1.=                                   /*�*AA: nextP;  the group #'s.*/
newV1.1= p                                         /*�*assign 1st prime in group.*/
do g=2  for dw                          /*�*get the rest of the group.*/
aa= nextP(aa+1); if aa==0  then leave a /*�*obtain the next prime.    */
newV1.g= aa;         newV3= g-1                 /*�*prepare to add difference.*/
if newV1.newV3 + dif.newV3\==newV1.g  then iterate a    /*�*determine if fits criteria*/
end   /*�*g*/
c= c+1                                         /*�*bump count of # of groups.*/
grp= newV1.1;       do b=2  for dw;  grp= grp newV1.b  /*�*build a list of primes.   */
end   /*�*b*/
if c==1  then say '     first group: '   grp   /*�*display the first group.  */
end   /*�*a*/
/*�* [↓]  test if group found.*/
if grp==''   then say "         (none)"             /*�*display the  last group.  */
else say '      last group: '   grp    /*�*   "     "     "    "     */
say '           count: '   c      /*�*   "     "  group count.  */
say
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
nextP:    do nxt=arg(1)  to H;  if newV2.nxt==.  then return nxt;  end /*�*nxt*/;     return 0
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
genP: procedure expose newV2.; parse arg N;  newV4= 0;  newV2.=.;  newV2.1=      /*�*initialize the array.*/
do e=4  by 2  for (N-1)%2;  newV2.e=;  end /*�*treat the even integers > 2  special.*/
/*�*all primes are indicated with a  "." */
do j=1  by 2  for (N-1)%2                /*�*use odd integers up to  N  inclusive.*/
if newV2.j==.  then do;  if newV4  then iterate  /*�*Prime?   Should skip the top part ?  */
jj= j * j           /*�*compute the square of  J.        ___ */
if jj>N  then newV4= 1  /*�*indicate skip top part  if  j > √ N  */
do m=jj  to N  by j+j;  newV2.m=;  end       /*�*odd multiples.*/
end                      /*�* [↑]  strike odd multiples  ¬ prime. */
end   /*�*j*/;               return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Successive-prime-differences\successive-prime-differences.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
