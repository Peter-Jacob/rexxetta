/*ͺ*REXX program tests the MD5 procedure (below) as per a test suite the  IETF RFC (1321).*/
msg.1 =                                          /*ͺ*βββββMD5 test suite [from above doc].*/
msg.2 = 'a'
msg.3 = 'abc'
msg.4 = 'message digest'
msg.5 = 'abcdefghijklmnopqrstuvwxyz'
msg.6 = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789'
msg.7 =  12345678901234567890123456789012345678901234567890123456789012345678901234567890
msg.0 = 7                                        /*ͺ* [β]  last value doesn't need quotes.*/
do m=1  for  msg.0;       say    /*ͺ*process each of the seven messages.  */
say ' in ='  msg.m               /*ͺ*display the      in      message.    */
say 'out ='  MD5(msg.m)          /*ͺ*   "     "       out        "        */
end   /*ͺ*m*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
MD5: procedure; parse arg newV2;  numeric digits 20  /*ͺ*insure there's enough decimal digits.*/
a='67452301'x;  b="efcdab89"x;  c='98badcfe'x;  d="10325476"x;   x00='0'x;  x80="80"x
newV3=length(newV2)                                 /*ͺ*length in bytes of the input message.*/
L=newV3*8//512;   if L<448  then plus=448 - L   /*ͺ*is the length  less   than  448 ?    */
if L>448  then plus=960 - L   /*ͺ* "  "     "   greater   "    "       */
if L=448  then plus=512       /*ͺ* "  "     "    equal    to   "       */
/*ͺ* [β]  a little of this, Β·Β·Β·          */
newV4=newV2 || x80 || copies(x00, plus%8 -1)reverse(right(d2c(8 * newV3), 4, x00)) || '00000000'x
/*ͺ* [β]       Β·Β·Β·  and a little of that.*/
do j=0  to length(newV4) % 64 - 1             /*ͺ*process the message  (lots of steps).*/
anewV5=a;       bnewV5=b;       cnewV5=c;       dnewV5=d  /*ͺ*save the  original values  for later.*/
chunk=j*64                                /*ͺ*calculate the  size  of the chunks.  */
do k=1  for 16            /*ͺ*process the message in chunks.       */
newV1.k=reverse( substr(newV4, chunk + 1 + 4*(k-1), 4) )   /*ͺ*magic stuff.*/
end   /*ͺ*k*/                                        /*ͺ*ββββstepββββ*/
a  =  .part1( a,   b,   c,   d,    0,    7,   3614090360)          /*ͺ*β β β β   1 β β β β */
d  =  .part1( d,   a,   b,   c,    1,   12,   3905402710)          /*ͺ*β β β β   2 β β β β */
c  =  .part1( c,   d,   a,   b,    2,   17,    606105819)          /*ͺ*β β β β   3 β β β β */
b  =  .part1( b,   c,   d,   a,    3,   22,   3250441966)          /*ͺ*β β β β   4 β β β β */
a  =  .part1( a,   b,   c,   d,    4,    7,   4118548399)          /*ͺ*β β β β   5 β β β β */
d  =  .part1( d,   a,   b,   c,    5,   12,   1200080426)          /*ͺ*β β β β   6 β β β β */
c  =  .part1( c,   d,   a,   b,    6,   17,   2821735955)          /*ͺ*β β β β   7 β β β β */
b  =  .part1( b,   c,   d,   a,    7,   22,   4249261313)          /*ͺ*β β β β   8 β β β β */
a  =  .part1( a,   b,   c,   d,    8,    7,   1770035416)          /*ͺ*β β β β   9 β β β β */
d  =  .part1( d,   a,   b,   c,    9,   12,   2336552879)          /*ͺ*β β β β  10 β β β β */
c  =  .part1( c,   d,   a,   b,   10,   17,   4294925233)          /*ͺ*β β β β  11 β β β β */
b  =  .part1( b,   c,   d,   a,   11,   22,   2304563134)          /*ͺ*β β β β  12 β β β β */
a  =  .part1( a,   b,   c,   d,   12,    7,   1804603682)          /*ͺ*β β β β  13 β β β β */
d  =  .part1( d,   a,   b,   c,   13,   12,   4254626195)          /*ͺ*β β β β  14 β β β β */
c  =  .part1( c,   d,   a,   b,   14,   17,   2792965006)          /*ͺ*β β β β  15 β β β β */
b  =  .part1( b,   c,   d,   a,   15,   22,   1236535329)          /*ͺ*β β β β  16 β β β β */
a  =  .part2( a,   b,   c,   d,    1,    5,   4129170786)          /*ͺ*β β β β  17 β β β β */
d  =  .part2( d,   a,   b,   c,    6,    9,   3225465664)          /*ͺ*β β β β  18 β β β β */
c  =  .part2( c,   d,   a,   b,   11,   14,    643717713)          /*ͺ*β β β β  19 β β β β */
b  =  .part2( b,   c,   d,   a,    0,   20,   3921069994)          /*ͺ*β β β β  20 β β β β */
a  =  .part2( a,   b,   c,   d,    5,    5,   3593408605)          /*ͺ*β β β β  21 β β β β */
d  =  .part2( d,   a,   b,   c,   10,    9,     38016083)          /*ͺ*β β β β  22 β β β β */
c  =  .part2( c,   d,   a,   b,   15,   14,   3634488961)          /*ͺ*β β β β  23 β β β β */
b  =  .part2( b,   c,   d,   a,    4,   20,   3889429448)          /*ͺ*β β β β  24 β β β β */
a  =  .part2( a,   b,   c,   d,    9,    5,    568446438)          /*ͺ*β β β β  25 β β β β */
d  =  .part2( d,   a,   b,   c,   14,    9,   3275163606)          /*ͺ*β β β β  26 β β β β */
c  =  .part2( c,   d,   a,   b,    3,   14,   4107603335)          /*ͺ*β β β β  27 β β β β */
b  =  .part2( b,   c,   d,   a,    8,   20,   1163531501)          /*ͺ*β β β β  28 β β β β */
a  =  .part2( a,   b,   c,   d,   13,    5,   2850285829)          /*ͺ*β β β β  29 β β β β */
d  =  .part2( d,   a,   b,   c,    2,    9,   4243563512)          /*ͺ*β β β β  30 β β β β */
c  =  .part2( c,   d,   a,   b,    7,   14,   1735328473)          /*ͺ*β β β β  31 β β β β */
b  =  .part2( b,   c,   d,   a,   12,   20,   2368359562)          /*ͺ*β β β β  32 β β β β */
a  =  .part3( a,   b,   c,   d,    5,    4,   4294588738)          /*ͺ*β β β β  33 β β β β */
d  =  .part3( d,   a,   b,   c,    8,   11,   2272392833)          /*ͺ*β β β β  34 β β β β */
c  =  .part3( c,   d,   a,   b,   11,   16,   1839030562)          /*ͺ*β β β β  35 β β β β */
b  =  .part3( b,   c,   d,   a,   14,   23,   4259657740)          /*ͺ*β β β β  36 β β β β */
a  =  .part3( a,   b,   c,   d,    1,    4,   2763975236)          /*ͺ*β β β β  37 β β β β */
d  =  .part3( d,   a,   b,   c,    4,   11,   1272893353)          /*ͺ*β β β β  38 β β β β */
c  =  .part3( c,   d,   a,   b,    7,   16,   4139469664)          /*ͺ*β β β β  39 β β β β */
b  =  .part3( b,   c,   d,   a,   10,   23,   3200236656)          /*ͺ*β β β β  40 β β β β */
a  =  .part3( a,   b,   c,   d,   13,    4,    681279174)          /*ͺ*β β β β  41 β β β β */
d  =  .part3( d,   a,   b,   c,    0,   11,   3936430074)          /*ͺ*β β β β  42 β β β β */
c  =  .part3( c,   d,   a,   b,    3,   16,   3572445317)          /*ͺ*β β β β  43 β β β β */
b  =  .part3( b,   c,   d,   a,    6,   23,     76029189)          /*ͺ*β β β β  44 β β β β */
a  =  .part3( a,   b,   c,   d,    9,    4,   3654602809)          /*ͺ*β β β β  45 β β β β */
d  =  .part3( d,   a,   b,   c,   12,   11,   3873151461)          /*ͺ*β β β β  46 β β β β */
c  =  .part3( c,   d,   a,   b,   15,   16,    530742520)          /*ͺ*β β β β  47 β β β β */
b  =  .part3( b,   c,   d,   a,    2,   23,   3299628645)          /*ͺ*β β β β  48 β β β β */
a  =  .part4( a,   b,   c,   d,    0,    6,   4096336452)          /*ͺ*β β β β  49 β β β β */
d  =  .part4( d,   a,   b,   c,    7,   10,   1126891415)          /*ͺ*β β β β  50 β β β β */
c  =  .part4( c,   d,   a,   b,   14,   15,   2878612391)          /*ͺ*β β β β  51 β β β β */
b  =  .part4( b,   c,   d,   a,    5,   21,   4237533241)          /*ͺ*β β β β  52 β β β β */
a  =  .part4( a,   b,   c,   d,   12,    6,   1700485571)          /*ͺ*β β β β  53 β β β β */
d  =  .part4( d,   a,   b,   c,    3,   10,   2399980690)          /*ͺ*β β β β  54 β β β β */
c  =  .part4( c,   d,   a,   b,   10,   15,   4293915773)          /*ͺ*β β β β  55 β β β β */
b  =  .part4( b,   c,   d,   a,    1,   21,   2240044497)          /*ͺ*β β β β  56 β β β β */
a  =  .part4( a,   b,   c,   d,    8,    6,   1873313359)          /*ͺ*β β β β  57 β β β β */
d  =  .part4( d,   a,   b,   c,   15,   10,   4264355552)          /*ͺ*β β β β  58 β β β β */
c  =  .part4( c,   d,   a,   b,    6,   15,   2734768916)          /*ͺ*β β β β  59 β β β β */
b  =  .part4( b,   c,   d,   a,   13,   21,   1309151649)          /*ͺ*β β β β  60 β β β β */
a  =  .part4( a,   b,   c,   d,    4,    6,   4149444226)          /*ͺ*β β β β  61 β β β β */
d  =  .part4( d,   a,   b,   c,   11,   10,   3174756917)          /*ͺ*β β β β  62 β β β β */
c  =  .part4( c,   d,   a,   b,    2,   15,    718787259)          /*ͺ*β β β β  63 β β β β */
b  =  .part4( b,   c,   d,   a,    9,   21,   3951481745)          /*ͺ*β β β β  64 β β β β */
a  =  .a(anewV5, a);     b=.a(bnewV5, b);      c=.a(cnewV5, c);    d=.a(dnewV5, d)
end   /*ͺ*j*/

return c2x( reverse(a) )c2x( reverse(b) )c2x( reverse(c) )c2x( reverse(d) )
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
.a:     return  right( d2c( c2d( arg(1) )   +   c2d( arg(2) ) ),  4, '0'x)
.h:     return  bitxor( bitxor( arg(1), arg(2) ), arg(3) )
.i:     return  bitxor( arg(2), bitor(arg(1), bitxor(arg(3),        'ffffffff'x)))
.f:     return  bitor( bitand(arg(1),arg(2)), bitand(bitxor(arg(1), 'ffffffff'x), arg(3)))
.g:     return  bitor( bitand(arg(1),arg(3)), bitand(arg(2), bitxor(arg(3), 'ffffffff'x)))
.Lr:    procedure;  parse arg newV5,newV3;           if newV3==0  then return newV5       /*ͺ*left rotate.*/
newV6=x2b(c2x(newV5));     return x2c( b2x( right(newV6 || left(newV6, newV3), length(newV6) )))
.part1: procedure expose newV1.;   parse arg w,x,y,z,n,m,newV5;        n=n+1
return .a(.Lr(right(d2c(newV5+c2d(w) +c2d(.f(x,y,z))+c2d(newV1.n)),4,'0'x),m),x)
.part2: procedure expose newV1.;   parse arg w,x,y,z,n,m,newV5;        n=n+1
return .a(.Lr(right(d2c(newV5+c2d(w) +c2d(.g(x,y,z))+c2d(newV1.n)),4,'0'x),m),x)
.part3: procedure expose newV1.;   parse arg w,x,y,z,n,m,newV5;        n=n+1
return .a(.Lr(right(d2c(newV5+c2d(w) +c2d(.h(x,y,z))+c2d(newV1.n)),4,'0'x),m),x)
.part4: procedure expose newV1.;   parse arg w,x,y,z,n,m,newV5;        n=n+1
return .a(.Lr(right(d2c(c2d(w) +c2d(.i(x,y,z))+c2d(newV1.n)+newV5),4,'0'x),m),x)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\MD5\md5.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
