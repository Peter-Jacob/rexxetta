/*�*REXX program uses the Almkvist─Giullera formula for   1 / (pi**2)     [or  pi ** -2]. */
numeric digits length( pi() )  +  length(.);                                       w= 102
say $(   , 3)       $(              , w%2)       $('power', 5)       $(          , w)
say $('N', 3)       $('integer term', w%2)       $('of 10', 5)       $('Nth term', w)
say $(   , 3, "─")  $(              , w%2, "─")  $(       , 5, "─")  $(          , w, "─")
s= 0           /*�*initialize   S   (the sum)  to zero. */
do n=0  until old=s;    old= s              /*�*use the "older" value of  S  for OLD.*/
a= 2**5  *  newV3(6*n)  *  (532 * n**2  +  126*n  +  9)  /  (3 * newV3(n)**6)
z= 10 ** (- (6*n + 3) )
s= s     +   a * z
if n>10  then do;  do newV1==11);  say ' .';  end;  iterate;  end
say $(n, 3) right(a, w%2)  $(powX(z), 5)  right( lowE( format(a*z, 1, w-6, 2, 0)), w)
end   /*�*n*/
say
say 'The calculation of pi took '       n       " iterations with "         digits() ,
" decimal digits precision using"   subword( sourceLine(1), 4, 3).
say
numeric digits length( pi() ) - length(.);  d= digits() - length(.);          newV2= ' ↓↓↓ '
say center(newV2 'calculated pi to '  d   " fractional decimal digits (below) is "newV2, d+4, '─')
say ' 'sqrt(1/s);          say
say ' 'pi();  newV2= ' ↑↑↑ '
say center(newV2 'the  true  pi to '  d   " fractional decimal digits (above) is" newV2, d+4, '─')
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
$:    procedure; parse arg text,width,fill;     return center(text, width, left(fill, 1) )
newV3:    procedure; parse arg x; newV3=1;;      do j=2  to x;    newV3= newV3*j;    end;         return newV3
lowE: procedure; parse arg x; return translate(x, 'e', "E")
powX: procedure; parse arg p; return right( format( p, 1, 3, 2, 0),  3)   +   0
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
pi:   pi=3.141592653589793238462643383279502884197169399375105820974944592307816406286208,
||9986280348253421170679821480865132823066470938446095505822317253594081284811174503
return pi
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sqrt: procedure; parse arg x;  if x=0  then return 0;  d=digits();  numeric digits;  h=d+6
m.=9; numeric form; parse value format(x,2,1,,0) 'E0' with g 'E' newV4 .; g=g*.5'e'newV4 % 2
do j=0  while h>9;        m.j= h;                 h= h % 2  +  1;       end  /*�*j*/
do k=j+5  to 0  by -1;    numeric digits m.k;     g= (g + x/g) * .5;    end  /*�*k*/
numeric digits d;           return g/1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Almkvist-Giullera-formula-for-pi\almkvist-giullera-formula-for-pi.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
