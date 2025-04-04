/*ͺ*REXX program finds the longest sequence of consecutive primes where the differences   */
/*ͺ*ββββββββββββ between the primes are strictly ascending;  also for strictly descending.*/
parse arg hi cols .                              /*ͺ*obtain optional argument from the CL.*/
if   hi=='' |   hi==","  then   hi= 1000000      /*ͺ* "      "         "   "   "     "    */
if cols=='' | cols==","  then cols=      10      /*ͺ* "      "         "   "   "     "    */
call genP                                        /*ͺ*build array of semaphores for primes.*/
w= 10                                            /*ͺ*width of a number in any column.     */
call fRun 1;  call show 1                        /*ͺ*find runs with ascending prime diffs.*/
call fRun 0;  call show 0                        /*ͺ*  "    "    " descending   "     "   */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV2;  do jc=length(newV2)-3  to 1  by -3; newV2=insert(',', newV2, jc); end;  return newV2
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
fRun: parse arg newV2;    mxrun=0;     seq.=         /*ͺ*max run length;  lists of prime runs.*/
/*ͺ*search for consecutive primes  <  HI.*/
do j=2  for newV3-2;   cp= newV1.j;   jn= j+1    /*ͺ*CP: current prime;  JN:  next j      */
diff= newV1.jn - cp                          /*ͺ*get difference between last 2 primes.*/
cnt= 1;                       run=       /*ͺ*initialize the   CNT   and   RUN.    */
do k= jn+1  to newV3-2;    km= k-1    /*ͺ*look for more primes in this run.    */
if newV2  then if newV1.k-newV1.km<=diff  then leave  /*ͺ*Diff. too small? Stop looking*/
else nop
else if newV1.k-newV1.km>=diff  then leave  /*ͺ*  "    "  large?   "     "   */
run= run  newV1.k;         cnt= cnt+1 /*ͺ*append a prime to the run; bump count*/
diff= newV1.k - newV1.km                  /*ͺ*calculate difference for next prime. */
end   /*ͺ*k*/
if cnt<=mxrun  then iterate              /*ͺ*This run too short? Then keep looking*/
mxrun= max(mxrun, cnt)                   /*ͺ*define a new maximum run (seq) length*/
seq.mxrun= cp  newV1.jn  run                 /*ͺ*full populate the sequence (RUN).    */
end   /*ͺ*j*/;                   return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
genP: newV1.1=2; newV1.2=3; newV1.3=5; newV1.4=7; newV1.5=11; newV1.6=13; newV1.7=17; newV1.8=19    /*ͺ*define low primes.*/
newV3=8;   sq.newV3= newV1.newV3 ** 2 /*ͺ*number of primes so far; prime sqiare*/
/*ͺ* [β]  generate more  primes  βξεχΦ΅  high.*/
do j=newV1.newV3+2  by 2  to hi;  parse var j '' -1 newV4    /*ͺ*find odd primes from here on.*/
if     newV4==5  then iterate;  if j// 3==0  then iterate   /*ͺ*J Γ·  5?    J Γ· by  3? */
if j// 7==0  then iterate;  if j//11==0  then iterate   /*ͺ*" "  7?    " "  " 11? */
if j//13==0  then iterate;  if j//17==0  then iterate   /*ͺ*" " 13?    " " "  17? */
do k=8  while sq.k<=j             /*ͺ* [β]  divide by the known odd primes.*/
if j // newV1.k == 0  then iterate j  /*ͺ*Is  J Γ· X?  Then not prime.     ___  */
end   /*ͺ*k*/                       /*ͺ* [β]  only process numbers  βξεχΦ΅  β J   */
newV3= newV3+1;             newV1.newV3= j;    sq.newV3= j*j /*ͺ*bump # of Ps; assign next P; P square*/
end          /*ͺ*j*/;            return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: parse arg newV2;  if newV2  then AorD= 'ascending'     /*ͺ*choose which literal for display.*/
else AorD= 'descending'    /*ͺ*   "     "      "     "     "    */
title= ' longest run of consecutive primes whose differences between primes are'  ,
'strictly'         AorD         "and  < "         commas(hi)
say;    say;    say
if cols>0  then say ' index β'center(title,   1 + cols*(w+1)     )
if cols>0  then say 'ββββββββΌ'center(""   ,   1 + cols*(w+1), 'β')
found= 0;                idx= 1            /*ͺ*initialize # of consecutive primes.  */
newV5=                                         /*ͺ*a list of consecutive primes (so far)*/
do o=1  for words(seq.mxrun)            /*ͺ*show all consecutive primes in seq.  */
c= commas( word(seq.mxrun, o) )         /*ͺ*obtain the next prime in the sequence*/
found= found + 1                        /*ͺ*bump the number of consecutive primes*/
if cols<=0            then iterate      /*ͺ*build the list  (to be shown later)? */
newV5= newV5  right(c, max(w, length(c) ) )     /*ͺ*add a nice prime βββΊ list, allow big#*/
if found//cols\==0    then iterate      /*ͺ*have we populated a line of output?  */
say center(idx, 7)'β'  substr(newV5, 2)     /*ͺ*display what we have so far  (cols). */
idx= idx + cols;              newV5=        /*ͺ*bump the  index  count for the output*/
end   /*ͺ*o*/
if newV5\==''  then say center(idx, 7)"β"  substr(newV5, 2)   /*ͺ*maybe show residual output*/
if cols>0  then say 'ββββββββ΄'center(""   ,   1 + cols*(w+1), 'β')
say;            say commas(Cprimes)  ' was the'title;        return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Consecutive-primes-with-ascending-or-descending-differences\consecutive-primes-with-ascending-or-descending-differences.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
