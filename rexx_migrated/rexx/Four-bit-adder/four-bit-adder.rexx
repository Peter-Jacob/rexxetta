/*ͺ*REXX program displays (all) the  sums  of a  full  4βbit adder  (with carry).         */
call hdr1;    call hdr2                          /*ͺ*note the order of headers & trailers.*/
/*ͺ* [β]  traipse thru all possibilities.*/
do    j=0  for 16
do m=0  for 4;   a.m= bit(j, m)
end   /*ͺ*m*/
do k=0  for 16
do m=0  for 4;   b.m= bit(k, m)
end   /*ͺ*m*/
sc= 4bitAdder(a., b.)
z= a.3 a.2 a.1 a.0    '~+~'   b.3 b.2 b.1 b.0   "~=~"    sc   ','    s.3 s.2 s.1 s.0
say translate( space(z, 0), , '~')         /*ͺ*translate tildes (~) to blanks in Z. */
end   /*ͺ*k*/
end      /*ͺ*j*/

call hdr2;    call hdr1                          /*ͺ*display two trailers (note the order)*/
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
bit:       procedure;  parse arg x,y;    return  substr( reverse( x2b( d2x(x) ) ), y+1, 1)
halfAdder: procedure expose c;   parse arg x,y;          c= x & y;           return x && y
hdr1:      say 'aaaa + bbbb = c, sum     [c=carry]';                         return
hdr2:      say 'ββββ   ββββ   ββββββ'              ;                         return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
fullAdder: procedure expose c;   parse arg x,y,fc
newV1= halfAdder(fc, x);        c1= c
newV2= halfAdder(newV1, y);        c= c | c1;                           return newV2
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
4bitAdder: procedure expose s. a. b.;  carry.= 0
do j=0  for 4;                 n= j - 1
s.j= fullAdder(a.j, b.j, carry.n);        carry.j= c
end   /*ͺ*j*/;                                                  return c
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Four-bit-adder\four-bit-adder.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
