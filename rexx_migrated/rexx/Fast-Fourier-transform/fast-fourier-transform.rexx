/*ͺ*REXX program performs a  fast Fourier transform  (FFT)  on a set of  complex numbers. */
numeric digits length( pi() )   -  length(.)     /*ͺ*limited by the  PI  function result. */
arg data                                         /*ͺ*ARG verb uppercases the DATA from CL.*/
if data=''  then data= 1 1 1 1 0                 /*ͺ*Not specified?  Then use the default.*/
size=words(data);       pad= left('', 5)         /*ͺ*PAD:  for indenting and padding SAYs.*/
do p=0  until  2**p>=size         ;   end      /*ͺ*number of args exactly a power of 2? */
do j=size+1 to 2**p;  data= data 0;   end      /*ͺ*add zeroes to DATA 'til a power of 2.*/
size= words(data);      ph= p % 2   ;   call hdr         /*ͺ*βββββββββββββββββββββββββββββ*/
/*ͺ* [β] TRANSLATE allows I & J*/  /*ͺ*β Numbers in data can be in β*/
do j=0  for size                                /*ͺ*β seven formats:  real      β*/
newV4= translate( word(data, j+1), 'J', "I")        /*ͺ*β                 real,imag β*/
parse  var  newV4    newV2.1.j  ''  newV5  1     "," newV2.2.j  /*ͺ*β                     ,imag β*/
if newV5=='J'  then parse var newV2.1.j newV1.j "J" newV2.1.j  /*ͺ*β                      nnnJ β*/
/*ͺ*β                      nnnj β*/
do m=1  for  2;      newV2.m.j= word(newV2.m.j 0, 1)  /*ͺ*β                      nnnI β*/
end   /*ͺ*m*/          /*ͺ*omitted part?  [β] */  /*ͺ*β                      nnni β*/
/*ͺ*βββββββββββββββββββββββββββββ*/
say pad ' FFT   in '     center(j+1, 7)     pad    fmt(newV2.1.j)     fmt(newV2.2.j, "i")
end     /*ͺ*j*/
say
tran= pi()*2 / 2**p;     newV3.=0;    hp= 2**p %2;       A= 2**(p-ph);      ptr= A;     dbl= 1
say
do p-ph;        halfPtr=ptr % 2
do i=halfPtr  by ptr  to A-halfPtr;  newV4= i - halfPtr;   newV3.i= newV3.newV4 + dbl
end   /*ͺ*i*/
ptr= halfPtr;                     dbl= dbl + dbl
end   /*ͺ*p-ph*/

do j=0  to 2**p%4;  cmp.j= cos(j*tran);      newV4= hp - j;            cmp.newV4= -cmp.j
newV4= hp + j;            cmp.newV4= -cmp.j
end  /*ͺ*j*/
B= 2**ph
do i=0      for A;            q= i * B
do j=0  for B;   h=q+j;   newV4= newV3.j*B+newV3.i;    if newV4<=h  then iterate
parse value  newV2.1.newV4  newV2.1.h  newV2.2.newV4  newV2.2.h    with    newV2.1.h  newV2.1.newV4  newV2.2.h  newV2.2.newV4
end   /*ͺ*j*/                              /*ͺ* [β]  swap  two sets of values. */
end       /*ͺ*i*/
dbl= 1
do p                    ;       w= hp % dbl
do k=0   for dbl      ;      Lb= w * k            ;          Lh= Lb + 2**p % 4
do j=0 for w        ;       a= j * dbl * 2 + k  ;           b=  a + dbl
r= newV2.1.a;  i= newV2.2.a ;      c1= cmp.Lb * newV2.1.b   ;          c4= cmp.Lb * newV2.2.b
c2= cmp.Lh * newV2.2.b   ;          c3= cmp.Lh * newV2.1.b
newV2.1.a= r + c1 - c2      ;       newV2.2.a= i + c3 + c4
newV2.1.b= r - c1 + c2      ;       newV2.2.b= i - c3 - c4
end     /*ͺ*j*/
end       /*ͺ*k*/
dbl= dbl + dbl
end         /*ͺ*p*/
call hdr
do z=0  for size
say pad     " FFT  out "     center(z+1,7)    pad    fmt(newV2.1.z)    fmt(newV2.2.z,'j')
end   /*ͺ*z*/                             /*ͺ*[β] #s are shown with β20 dec. digits*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
cos: procedure; parse arg x;  q= r2r(x)**2;      z=1;    newV4=1;   p=1   /*ͺ*bare bones COS. */
do k=2  by 2;  newV4=-newV4*q/(k*(k-1));  z=z+newV4;  if z=p  then return z;   p=z;  end  /*ͺ*k*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
fmt: procedure; parse arg y,j;          y= y/1   /*ͺ*prettifies complex numbers for output*/
if abs(y) < '1e-'digits() %4  then y= 0;    if y=0 & j\==''  then return ''
dp= digits()%3;  y= format(y, dp%6+1, dp);  if pos(.,y)\==0  then y= strip(y, 'T', 0)
y=  strip(y, 'T', .);                       return left(y || j, dp)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
hdr: newV4=pad 'Β Β Β dataΒ Β Β    num' pad "Β Β realβpartΒ Β " pad pad '  Β Β Β Β Β Β Β imaginaryβpartΒ Β Β Β Β Β Β '
say newV4;   say translate(newV4,  " "copies('β', 256),  " "xrange());                 return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
pi:  return 3.1415926535897932384626433832795028841971693993751058209749445923078164062862
r2r: return arg(1)  //  ( pi() * 2 )             /*ͺ*reduce the radians to a unit circle. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Fast-Fourier-transform\fast-fourier-transform.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
