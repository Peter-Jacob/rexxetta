/*�*REXX pgm converts & displays a base ten integer to a negative base number (up to -10).*/
newV1=' converted to base ';      numeric digits 300 /*�*be able to handle ginormous numbers. */
n=  10;  b=  -2;   q= nBase(n, b);   say right(n, 20)   newV1   right(b, 3)  '────►'  q   ok()
n= 146;  b=  -3;   q= nBase(n, b);   say right(n, 20)   newV1   right(b, 3)  '────►'  q   ok()
n=  15;  b= -10;   q= nBase(n, b);   say right(n, 20)   newV1   right(b, 3)  '────►'  q   ok()
n= -15;  b= -10;   q= nBase(n, b);   say right(n, 20)   newV1   right(b, 3)  '────►'  q   ok()
n=   0;  b=  -5;   q= nBase(n, b);   say right(n, 20)   newV1   right(b, 3)  '────►'  q   ok()
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
nBase: procedure; parse arg x,r;             newV2=  /*�*obtain args; $ is the integer result.*/
if r<-10 | r>-2 then do; say 'base' r "must be in range: -2 ───► -10"; exit 13; end
do  while x\==0              /*�*keep processing while  X  isn't zero.*/
z= x // r;        x= x % r   /*�*calculate remainder; calculate int ÷.*/
if z<0  then do;  z= z - r   /*�*subtract a negative  R  from  Z ◄──┐ */
x= x + 1   /*�*bump  X  by one.                   │ */
end             /*�*                   Funny "add" ►───┘ */
newV2= z || newV2                    /*�*prepend new digit (numeral) to result*/
end   /*�*while*/
return word(newV2 0, 1)                       /*�*possibly adjust for a  zero  value.  */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
ok:    newV3=;  if pBase(q, b)\=n  then newV3= ' ◄──error in negative base calculation';  return newV3
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
pBase: procedure; parse arg x,r;   p= 0;   newV2= 0  /*�*obtain args; $ is the integer result.*/
if r<-10 | r>-2 then do; say 'base' r "must be in range: -2 ───► -10"; exit 13; end
do j=length(x)  by -1  for length(x) /*�*process each of the numerals in  X.  */
newV2= newV2 + substr(x,j,1) *    r ** p     /*�*add value of a numeral to $ (result).*/
p= p + 1                             /*�*bump the power by 1.                 */
end   /*�*j*/                          /*�* [↓]  process the number "bottom-up".*/
return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Negative-base-numbers\negative-base-numbers-1.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
