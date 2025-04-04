/*ͺ*REXX pgm converts & displays a base ten integer to a negative base number (up to -10).*/
newV1=' converted to base ';      numeric digits 300 /*ͺ*be able to handle ginormous numbers. */
n=  10;  b=  -2;   q= nBase(n, b);   say right(n, 20)   newV1   right(b, 3)  'βββββΊ'  q   ok()
n= 146;  b=  -3;   q= nBase(n, b);   say right(n, 20)   newV1   right(b, 3)  'βββββΊ'  q   ok()
n=  15;  b= -10;   q= nBase(n, b);   say right(n, 20)   newV1   right(b, 3)  'βββββΊ'  q   ok()
n= -15;  b= -10;   q= nBase(n, b);   say right(n, 20)   newV1   right(b, 3)  'βββββΊ'  q   ok()
n=   0;  b=  -5;   q= nBase(n, b);   say right(n, 20)   newV1   right(b, 3)  'βββββΊ'  q   ok()
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
nBase: procedure; parse arg x,r;             newV2=  /*ͺ*obtain args; $ is the integer result.*/
if r<-10 | r>-2 then do; say 'base' r "must be in range: -2 ββββΊ -10"; exit 13; end
do  while x\==0              /*ͺ*keep processing while  X  isn't zero.*/
z= x // r;        x= x % r   /*ͺ*calculate remainder; calculate int Γ·.*/
if z<0  then do;  z= z - r   /*ͺ*subtract a negative  R  from  Z ββββ */
x= x + 1   /*ͺ*bump  X  by one.                   β */
end             /*ͺ*                   Funny "add" βΊββββ */
newV2= z || newV2                    /*ͺ*prepend new digit (numeral) to result*/
end   /*ͺ*while*/
return word(newV2 0, 1)                       /*ͺ*possibly adjust for a  zero  value.  */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
ok:    newV3=;  if pBase(q, b)\=n  then newV3= ' βββerror in negative base calculation';  return newV3
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
pBase: procedure; parse arg x,r;   p= 0;   newV2= 0  /*ͺ*obtain args; $ is the integer result.*/
if r<-10 | r>-2 then do; say 'base' r "must be in range: -2 ββββΊ -10"; exit 13; end
do j=length(x)  by -1  for length(x) /*ͺ*process each of the numerals in  X.  */
newV2= newV2 + substr(x,j,1) *    r ** p     /*ͺ*add value of a numeral to $ (result).*/
p= p + 1                             /*ͺ*bump the power by 1.                 */
end   /*ͺ*j*/                          /*ͺ* [β]  process the number "bottom-up".*/
return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Negative-base-numbers\negative-base-numbers-1.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
