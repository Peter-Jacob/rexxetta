/*ͺ*REXX program  calculates and displays  values of  various  continued fractions.       */
parse arg terms digs .
if terms=='' | terms==","  then terms=500
if  digs=='' |  digs==","  then  digs=100
numeric digits digs                              /*ͺ*use  100  decimal digits for display.*/
b.=1                                             /*ͺ*omitted Γ terms are assumed to be  1.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
a.=2;                                                           call tell 'β2',      cf(1)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
a.=1;  do N=2  by  2  to terms; a.N=2; end;                     call tell 'β3',      cf(1)     /*ͺ*also:  2βsin(Ο/3) */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
a.=2                  /*ͺ*              ___ */
do N=2  to 17   /*ͺ*generalized  β N  */
b.=N-1;                          NN=right(N, 2);          call tell 'gen β'NN, cf(1)
end   /*ͺ*N*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
a.=2;   b.=-1/2;                                                call tell 'gen β Β½', cf(1)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
do j=1 for terms; a.j=j;  if j>1   then b.j=a.p; p=j; end;    call tell 'e',       cf(2)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
a.=1;                                                           call tell 'Ο, phi',  cf(1)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
a.=1;    do j=1 for terms;  if j//2  then a.j=j;        end;    call tell 'tan(1)',  cf(1)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
do j=1 for terms;                a.j=2*j+1;    end;    call tell 'coth(1)', cf(1)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
do j=1 for terms;                a.j=4*j+2;    end;    call tell 'coth(Β½)', cf(2)    /*ͺ*also:  [e+1]Γ·[e-1] */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
terms=100000
a.=6;    do j=1  for terms;  b.j=(2*j-1)**2;            end;    call tell 'Ο, pi',   cf(3)
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
cf:      procedure expose a. b. terms;  parse arg C;     newV1=0;    numeric digits 9+digits()
do k=terms  by -1  for terms;  d=a.k+newV1;  newV1=b.k/d
end   /*ͺ*k*/
return newV1+C
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
tell:    parse arg newV2,v;   newV3=left(format(v)/1,1+digits());    w=50    /*ͺ*50 bytes of terms*/
aT=;     do k=1;  newV4=space(aT a.k);  if length(newV4)>w  then leave;  aT=newV4;  end /*ͺ*k*/
bT=;     do k=1;  newV4=space(bT b.k);  if length(newV4)>w  then leave;  bT=newV4;  end /*ͺ*k*/
say right(newV2,8)   "="    newV3     '  Ξ± terms='aT  ...
if b.1\==1  then say right("",12+digits())     '  Γ terms='bT  ...
a=;   b.=1;  return       /*ͺ*only 50 bytes of  Ξ± & Γ terms  β   are displayed.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Continued-fraction\continued-fraction-1.rexx was migrated on 23 Mar 2025 at 10:43:09
 * -------------------------------------------------------------------------
*/ 
