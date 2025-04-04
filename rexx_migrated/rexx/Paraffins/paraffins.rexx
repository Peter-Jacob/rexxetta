/*ͺ*REXX pgm enumerates (without repetition) the number of paraffins with N carbon atoms. */
parse arg nodes .                                /*ͺ*obtain optional argument from the CL.*/
if nodes=='' | nodes==","  then nodes= 100       /*ͺ*Not specified?  Then use the default.*/
rooted. =  0;     rooted.0= 1;     rooted.1= 1 /*ͺ*define the  base     rooted  numbers.*/
unrooted. =  0;   unrooted.0= 1;   unrooted.1= 1 /*ͺ*  "     "     "    unrooted     "    */
numeric digits max(9, nodes % 2)                 /*ͺ*this program may use gihugeic numbers*/
w= length(nodes)                                 /*ͺ*W:  used for aligning formatted nodes*/
say  right(0, w)  unrooted.0                     /*ͺ*show enumerations of  0  carbon atoms*/
/*ͺ* [β]  process all nodes (up to NODES)*/
do C=1  for nodes;           h= C % 2  /*ͺ*C:   is the number of carbon atoms.  */
call  tree  0, C, C, 1, 1              /*ͺ* [β]  if # of carbon atoms is evenΒ·Β·Β·*/
if \(C//2)  then unrooted.C= unrooted.C    +    rooted.h * (rooted.h + 1)  %  2
say right(C, w)  unrooted.C            /*ͺ*display an aligned formatted number. */
end   /*ͺ*C*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
tree: procedure expose rooted. unrooted. nodes newV1.          /*ͺ*this function is recursive.*/
parse arg br,n,L,sum,cnt;             nm= n - 1;            LL= L + L
brp= br + 1
do b=brp  to 4;     sum= sum + n
if sum>nodes  then leave
if b==4       then if LL>=sum  then leave
if b==brp     then newV1.br= rooted.n * cnt
else newV1.br= newV1.br  *  (rooted.n + b - brp) % (b - br)
if LL<sum     then unrooted.sum= unrooted.sum  +  newV1.br
if b==4       then leave
rooted.sum= rooted.sum + newV1.br
do m=nm  by -1  for nm;            call tree b, m, L, sum, newV1.br
end   /*ͺ*m*/
end      /*ͺ*b*/                     /*ͺ* βββββββββ   recursive.    */
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Paraffins\paraffins.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
