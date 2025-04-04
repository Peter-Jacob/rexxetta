/*ͺ*REXX pgm converts & displays a base ten integer to a negative base number (up to -71).*/
newV1=' converted to base ';      numeric digits 300 /*ͺ*be able to handle ginormous numbers. */
n=      10;  b=  -2;   q= nBase(n, b);   say right(n, 20)  newV1  right(b,3)  'βββββΊ'  q  ok()
n=     146;  b=  -3;   q= nBase(n, b);   say right(n, 20)  newV1  right(b,3)  'βββββΊ'  q  ok()
n=      15;  b= -10;   q= nBase(n, b);   say right(n, 20)  newV1  right(b,3)  'βββββΊ'  q  ok()
n=     -15;  b= -10;   q= nBase(n, b);   say right(n, 20)  newV1  right(b,3)  'βββββΊ'  q  ok()
n=       0;  b=  -5;   q= nBase(n, b);   say right(n, 20)  newV1  right(b,3)  'βββββΊ'  q  ok()
n=-6284695;  b= -62;   q= nBase(n, b);   say right(n, 20)  newV1  right(b,3)  'βββββΊ'  q  ok()
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
_Base: !='0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz /*ͺ*+-!Γ©Γ‘Β΅§ /*ͺσων*/
parse arg $;        m= length(!);           L= length(x);             p= 0
if r<-m | r>-2 then do;  say 'base' r "must be in range: -2 ββββΊ -"m; exit 13;  end
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
nBase: procedure; parse arg x,r;   call _Base    /*ͺ*get args; $  will be integer result. */
do  while x\==0              /*ͺ*keep processing while  X  isn't zero.*/
z=x // r;         x= x % r   /*ͺ*calculate remainder; calculate int Γ·.*/
if z<0  then do;  z= z - r   /*ͺ*subtract a negative  R  from  Z ββββ */
x= x + 1   /*ͺ*bump  X  by one.                   β */
end             /*ͺ*                   Funny "add" βΊββββ */
$=substr(!, z+1, 1)$         /*ͺ*prepend the new numeral to the result*/
end   /*ͺ*while*/
if $==''  then return 0;    return $      /*ͺ*possibly adjust for a  zero  value.  */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
ok:    if pBase(q, b)\=n  then return ' βββerror in negative base calculation';  return ''
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
pBase: procedure; parse arg x,r;   call _Base 0  /*ͺ*get args; $  will be integer result. */
do j=L  by -1  for L         /*ͺ*process each of the numerals in  X.  */
v=pos( substr(x,j,1), !) - 1 /*ͺ*use base  R  for the numeral's value.*/
$= $ + v * r**p;    p= p + 1 /*ͺ*add it to $ (result); bump power by 1*/
end   /*ͺ*j*/                  /*ͺ* [β]  process the number "bottom-up".*/
return $
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Negative-base-numbers\negative-base-numbers-2.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
