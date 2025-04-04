newV1=ฎ*/
numeric digits 20                                /*ช*the default decimal digit precision=9*/
parse arg n seed .                               /*ช*allow specification of N and the seed*/
if n==''  |  n==","    then n=1000               /*ช*N:    is the size of the array.      */
if datatype(seed,'W')  then call random ,,seed   /*ช*SEED: for repeatable random numbers. */
newMean=1                                        /*ช*the desired new mean (arithmetic avg)*/
sd=1/2                                           /*ช*the desired new standard deviation.  */
do g=1  for n                             /*ช*generate  N uniform random #'s (0,1].*/
newV2.g = random(1, 1e5)  /  1e5              /*ช*REXX's RANDOM BIF generates integers.*/
end   /*ช*g*/                               /*ช* [โ]  random integers โโโบ fractions. */
say '              old mean='   mean()
say 'old standard deviation='   stdDev()
call pi;       pi2=pi * 2                        /*ช*define   pi    and also    2 * pi.   */
say
do j=1  to n-1  by 2;    m=j+1            /*ช*step through the iterations by two.  */
newV3=sd *  sqrt(ln(newV2.j) * -2)            /*ช*calculate the  used-twice expression.*/
newV2.j=newV3 * cos(pi2 * newV2.m)  +  newMean        /*ช*utilize the  BoxโMuller method.      */
newV2.m=newV3 * sin(pi2 * newV2.m)  +  newMean        /*ช*random number must be:      (0,1]    */
end   /*ช*j*/
say '              new mean='     mean()
say 'new standard deviation='     stdDev()
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
mean:   newV3=0;                   do k=1  for n;  newV3=newV3 + newV2.k;              end;                return      newV3/n
stdDev: newV3avg=mean();  newV3=0;     do k=1  for n;  newV3=newV3 + (newV2.k - newV3avg)**2;  end;                return sqrt(newV3/n)
e:      e =2.7182818284590452353602874713526624977572470936999595749669676277240766303535; return e   /*ช*digs overkill*/
pi:     pi=3.1415926535897932384626433832795028841971693993751058209749445923078164062862; return pi  /*ช*  "      "   */
r2r:    return arg(1)  //  (pi() * 2)                                                                 /*ช*normalize ang*/
sin:    procedure; parse arg x;x=r2r(x);numeric fuzz min(5,digits()-3);if abs(x)=pi then return 0;return .sincos(x,x,1)
.sincos:parse arg z,newV3,i; x=x*x; p=z;    do k=2 by 2; newV3=-newV3*x/(k*(k+i)); z=z+newV3; if z=p then leave; p=z; end;     return z
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
ln:     procedure; parse arg x,f;   call e;   ig= x>1.5;     is=1 - 2 * (ig\==1);           ii=0;             xx=x
do while ig&xx>1.5|\ig&xx<.5;newV3=e;do k=-1;iz=xx*newV3**-is;if k>=0&(ig&iz<1|\ig&iz>.5) then leave;newV3=newV3*newV3;izz=iz;end
xx=izz;ii=ii+is*2**k;end;x=x*e**-ii-1;z=0;newV3=-1;p=z;do k=1;newV3=-newV3*x;z=z+newV3/k;if z=p then leave;p=z;end; return z+ii
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
cos:    procedure; parse arg x;       x=r2r(x);        a=abs(x);               hpi=pi * .5
numeric fuzz min(6, digits() - 3);      if a=pi    then return -1
if a=hpi | a=hpi*3  then return 0;      if a=pi/3  then return .5
if a=pi * 2/3       then return -.5;                    return .sinCos(1,1,-1)
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
sqrt:   procedure; parse arg x; if x=0  then return 0;  d=digits();  numeric digits; h=d+6
numeric form; parse value format(x,2,1,,0) 'E0'  with  g 'E' newV3 .;  g=g * .5'e'newV3 %2
m.=9;     do j=0  while h>9;       m.j=h;                h=h%2 + 1;      end /*ช*j*/
do k=j+5  to 0  by -1;   numeric digits m.k;   g=(g+x/g)*.5;   end /*ช*k*/
numeric digits d;     return g/1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Random-numbers\random-numbers.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
