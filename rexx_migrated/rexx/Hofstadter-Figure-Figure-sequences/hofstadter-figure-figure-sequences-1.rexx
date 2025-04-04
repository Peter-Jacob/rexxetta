/*ͺ*REXX program  calculates and verifies  the  Hofstadter FigureβFigure sequences.       */
parse arg x top bot .                            /*ͺ*obtain optional arguments from the CL*/
if   x=='' |   x==","  then   x=  10             /*ͺ*Not specified?  Then use the default.*/
if top=='' | top==","  then top=1000             /*ͺ* "      "         "   "   "      "   */
if bot=='' | bot==","  then bot=  40             /*ͺ* "      "         "   "   "      "   */
low=1;         if x<0  then low=abs(x)           /*ͺ*only display a  single   βXβ  value? */
r.=0;  r.1=1;  rr.=r.;  rr.1=1;   s.=r.;  s.1=2  /*ͺ*initialize the  R, RR, and S  arrays.*/
errs=0                                           /*ͺ*the number of errors found  (so far).*/
do i=low  to abs(x)                 /*ͺ*display the 1st  X  values of  R & S.*/
say right('R('i") =",20) right(FFR(i),7) right('S('i") =",20) right(FFS(i),7)
end   /*ͺ*i*/
/*ͺ* [β]  list the 1st X FigβFig numbers.*/
if x<1  then exit                                /*ͺ*if X isn't positive, then we're done.*/
newV1.=0                                             /*ͺ*initialize the memoization ($) array.*/
do m=1  for  bot;  r=FFR(m);  newV1.r=1 /*ͺ*calculate the first forty  R  values.*/
end   /*ͺ*m*/                         /*ͺ* [β]  ($.)  is used for memoization. */
/*ͺ* [β]  check for duplicate #s in R & S*/
do n=1  for top-bot;     s=FFS(n)   /*ͺ*calculate the value of  FFS(n).      */
if newV1.s  then call ser 'duplicate number in R and S lists:' s;   newV1.s=1
end   /*ͺ*n*/                         /*ͺ* [β]  calculate the 1st 960 S values.*/
/*ͺ* [β]  check for missing values in RβS*/
do v=1  for top;  if \newV1.v  then  call ser     'missing R β S:'    v
end   /*ͺ*v*/                         /*ͺ* [β]  are all 1β€ numbers β€1k present?*/
say
if errs==0  then say 'verification completed for all numbers from  1 βββΊ' top "  [inclusive]."
else say 'verification failed with'      errs      "errors."
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
FFR: procedure expose r. rr. s.; parse arg n     /*ͺ*obtain the number from the arguments.*/
if r.n\==0  then return r.n                 /*ͺ*R.n  defined?  Then return the value.*/
newV2=FFR(n-1) + FFS(n-1)                       /*ͺ*calculate the  FFR  and  FFS  values.*/
r.n=newV2;       rr.newV2=1;        return newV2        /*ͺ*assign the value to R & RR;   return.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
FFS: procedure expose r. s. rr.; parse arg n     /*ͺ*search for not null  R or S  number. */
if s.n==0  then do k=1  for n               /*ͺ* [β]  1st  IF  is a  SHORT CIRCUIT.  */
if s.k\==0  then if r.k\==0  then iterate       /*ͺ*are both defined?*/
call FFR k                  /*ͺ*define  R.k  via the  FFR  subroutine*/
km=k-1;     newV2=s.km+1        /*ͺ*calc. the next  S  number,  possibly.*/
newV2=newV2+rr.newV2;   s.k=newV2           /*ͺ*define an element of  the  S  array. */
end   /*ͺ*k*/
return s.n                                  /*ͺ*return   S.n   value to the invoker. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
ser: errs=errs+1;    say  '***error***'  arg(1);                  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hofstadter-Figure-Figure-sequences\hofstadter-figure-figure-sequences-1.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
