/*�*REXX program  calculates and verifies  the  Hofstadter Figure─Figure sequences.       */
parse arg x top bot .                            /*�*obtain optional arguments from the CL*/
if   x=='' |   x==","  then   x=  10             /*�*Not specified?  Then use the default.*/
if top=='' | top==","  then top=1000             /*�* "      "         "   "   "      "   */
if bot=='' | bot==","  then bot=  40             /*�* "      "         "   "   "      "   */
low=1;         if x<0  then low=abs(x)           /*�*only display a  single   │X│  value? */
r.=0;  r.1=1;  rr.=r.;  rr.1=1;   s.=r.;  s.1=2  /*�*initialize the  R, RR, and S  arrays.*/
errs=0                                           /*�*the number of errors found  (so far).*/
do i=low  to abs(x)                 /*�*display the 1st  X  values of  R & S.*/
say right('R('i") =",20) right(FFR(i),7) right('S('i") =",20) right(FFS(i),7)
end   /*�*i*/
/*�* [↑]  list the 1st X Fig─Fig numbers.*/
if x<1  then exit                                /*�*if X isn't positive, then we're done.*/
newV1.=0                                             /*�*initialize the memoization ($) array.*/
do m=1  for  bot;  r=FFR(m);  newV1.r=1 /*�*calculate the first forty  R  values.*/
end   /*�*m*/                         /*�* [↑]  ($.)  is used for memoization. */
/*�* [↓]  check for duplicate #s in R & S*/
do n=1  for top-bot;     s=FFS(n)   /*�*calculate the value of  FFS(n).      */
if newV1.s  then call ser 'duplicate number in R and S lists:' s;   newV1.s=1
end   /*�*n*/                         /*�* [↑]  calculate the 1st 960 S values.*/
/*�* [↓]  check for missing values in R│S*/
do v=1  for top;  if \newV1.v  then  call ser     'missing R │ S:'    v
end   /*�*v*/                         /*�* [↑]  are all 1≤ numbers ≤1k present?*/
say
if errs==0  then say 'verification completed for all numbers from  1 ──►' top "  [inclusive]."
else say 'verification failed with'      errs      "errors."
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
FFR: procedure expose r. rr. s.; parse arg n     /*�*obtain the number from the arguments.*/
if r.n\==0  then return r.n                 /*�*R.n  defined?  Then return the value.*/
newV2=FFR(n-1) + FFS(n-1)                       /*�*calculate the  FFR  and  FFS  values.*/
r.n=newV2;       rr.newV2=1;        return newV2        /*�*assign the value to R & RR;   return.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
FFS: procedure expose r. s. rr.; parse arg n     /*�*search for not null  R or S  number. */
if s.n==0  then do k=1  for n               /*�* [↓]  1st  IF  is a  SHORT CIRCUIT.  */
if s.k\==0  then if r.k\==0  then iterate       /*�*are both defined?*/
call FFR k                  /*�*define  R.k  via the  FFR  subroutine*/
km=k-1;     newV2=s.km+1        /*�*calc. the next  S  number,  possibly.*/
newV2=newV2+rr.newV2;   s.k=newV2           /*�*define an element of  the  S  array. */
end   /*�*k*/
return s.n                                  /*�*return   S.n   value to the invoker. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
ser: errs=errs+1;    say  '***error***'  arg(1);                  return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hofstadter-Figure-Figure-sequences\hofstadter-figure-figure-sequences-1.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
