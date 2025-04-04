/*ͺ*REXX program implements a reasonably complete  rational arithmetic  (using fractions).*/
L=length(2**19 - 1)                              /*ͺ*saves time by checking even numbers. */
do j=2  by 2  to 2**19 - 1;       s=0       /*ͺ*ignore unity (which can't be perfect)*/
mostDivs=eDivs(j);                newV1=        /*ͺ*obtain divisors>1; zero sum; null @. */
do k=1  for  words(mostDivs)              /*ͺ*unity isn't return from  eDivs  here.*/
r='1/'word(mostDivs, k);        newV1=newV1 r;         s=$fun(r, , s)
end   /*ͺ*k*/
if s\==1  then iterate                      /*ͺ*Is sum not equal to unity?   Skip it.*/
say 'perfect number:'       right(j, L)       "   fractions:"            newV1
end   /*ͺ*j*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
$div: procedure;  parse arg x;   x=space(x,0);   f= 'fractional division'
parse var x n '/' d;       d=p(d 1)
if d=0               then call err  'division by zero:'            x
if \datatype(n,'N')  then call err  'a nonβnumeric numerator:'     x
if \datatype(d,'N')  then call err  'a nonβnumeric denominator:'   x
return n/d
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
$fun: procedure;  parse arg z.1,,z.2 1 zz.2;    arg ,op;  op=p(op '+')
F= 'fractionalFunction';        do j=1  for 2;  z.j=translate(z.j, '/', "_");   end  /*ͺ*j*/
if abbrev('ADD'      , op)                               then op= "+"
if abbrev('DIVIDE'   , op)                               then op= "/"
if abbrev('INTDIVIDE', op, 4)                            then op= "Γ·"
if abbrev('MODULUS'  , op, 3) | abbrev('MODULO', op, 3)  then op= "//"
if abbrev('MULTIPLY' , op)                               then op= "*"
if abbrev('POWER'    , op)                               then op= "^"
if abbrev('SUBTRACT' , op)                               then op= "-"
if z.1==''                                               then z.1= (op\=="+" & op\=='-')
if z.2==''                                               then z.2= (op\=="+" & op\=='-')
znewV2=z.2
/*ͺ* [β]  verification of both fractions.*/
do j=1  for 2
if pos('/', z.j)==0    then z.j=z.j"/1";         parse var  z.j  n.j  '/'  d.j
if \datatype(n.j,'N')  then call err  'a nonβnumeric numerator:'     n.j
if \datatype(d.j,'N')  then call err  'a nonβnumeric denominator:'   d.j
if d.j=0               then call err  'a denominator of zero:'       d.j
n.j=n.j/1;          d.j=d.j/1
do  while \datatype(n.j,'W');     n.j=(n.j*10)/1;     d.j=(d.j*10)/1
end  /*ͺ*while*/                      /*ͺ* [β]   {xxx/1}  normalizes a number. */
g=gcd(n.j, d.j);    if g=0  then iterate;  n.j=n.j/g;          d.j=d.j/g
end    /*ͺ*j*/

select
when op=='+' | op=='-' then do;  l=lcm(d.1,d.2);    do j=1  for 2;  n.j=l*n.j/d.j;  d.j=l
end   /*ͺ*j*/
if op=='-'  then n.2= -n.2;        t=n.1 + n.2;    u=l
end
when op=='**' | op=='β'  |,
op=='^'  then do;  if \datatype(znewV2,'W')  then call err 'a nonβinteger power:'  znewV2
t=1;  u=1;     do j=1  for abs(znewV2);  t=t*n.1;  u=u*d.1
end   /*ͺ*j*/
if znewV2<0  then parse value   t  u   with   u  t      /*ͺ*swap  U and T */
end
when op=='/'  then do;      if n.2=0   then call err  'a zero divisor:'   zz.2
t=n.1*d.2;    u=n.2*d.1
end
when op=='Γ·'  then do;      if n.2=0   then call err  'a zero divisor:'   zz.2
t=trunc($div(n.1 '/' d.1));    u=1
end                           /*ͺ* [β]  this is integer division.     */
when op=='//' then do;      if n.2=0   then call err  'a zero divisor:'   zz.2
newV2=trunc($div(n.1 '/' d.1));     t=newV2 - trunc(newV2) * d.1;            u=1
end                          /*ͺ* [β]  modulus division.              */
when op=='ABS'  then do;   t=abs(n.1);       u=abs(d.1);        end
when op=='*'    then do;   t=n.1 * n.2;      u=d.1 * d.2;       end
when op=='EQ' | op=='='                then return $div(n.1 '/' d.1)  = fDiv(n.2 '/' d.2)
when op=='NE' | op=='\=' | op=='βͺ' | ,
op=='Β¬='    then return $div(n.1 '/' d.1) \= fDiv(n.2 '/' d.2)
when op=='GT' | op=='>'                then return $div(n.1 '/' d.1) >  fDiv(n.2 '/' d.2)
when op=='LT' | op=='<'                then return $div(n.1 '/' d.1) <  fDiv(n.2 '/' d.2)
when op=='GE' | op=='β₯'  | op=='>='    then return $div(n.1 '/' d.1) >= fDiv(n.2 '/' d.2)
when op=='LE' | op=='β€'  | op=='<='    then return $div(n.1 '/' d.1) <= fDiv(n.2 '/' d.2)
otherwise       call err  'an illegal function:'   op
end   /*ͺ*select*/

if t==0  then return 0;            g=gcd(t, u);             t=t/g;                   u=u/g
if u==1  then return t
return t'/'u
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
eDivs: procedure; parse arg x 1 b,a
do j=2  while j*j<x;       if x//j\==0  then iterate;   a=a j;   b=x%j b;     end
if j*j==x  then return a j b;                                            return a b
/*ͺ*βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
err:   say;   say '***error*** '    f     " detected"   arg(1);    say;         exit 13
gcd:   procedure; parse arg x,y; if x=0  then return y;  do until newV2==0; newV2=x//y; x=y; y=newV2; end; return x
lcm:   procedure; parse arg x,y; if y=0  then return 0; x=x*y/gcd(x, y);        return x
p:     return word( arg(1), 1)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arithmetic-Rational\arithmetic-rational.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
