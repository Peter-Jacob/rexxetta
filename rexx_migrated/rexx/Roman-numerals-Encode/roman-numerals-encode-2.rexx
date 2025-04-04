/*ͺ*REXX program converts (Arabic) nonβnegative decimal integers (β₯0) ββββΊ Roman numerals.*/
numeric digits 10000                             /*ͺ*decimal digs can be higher if wanted.*/
parse arg newV2                                      /*ͺ*obtain optional integers from the CL.*/
newV1= "argument isn't a non-negative integer: "   /*ͺ*literal used when issuing error msg. */
if newV2=''  then                                    /*ͺ*Nothing specified?  Then generate #s.*/
do
do j= 0  by  11  to  111; newV2=newV2 j;     end
newV2=newV2 49;                                       do k=88  by 100  to 1200; newV2=newV2 k;     end
newV2=newV2 1000 2000 3000 4000 5000 6000;            do m=88  by 200  to 1200; newV2=newV2 m;     end
newV2=newV2 1304 1405 1506 1607 1708 1809 1910 2011;  do p= 4          to   50; newV2=newV2 10**p; end
end                                          /*ͺ*finished with generation of numbers. */

do i=1  for words(newV2);         x=word(newV2, i)     /*ͺ*convert each of the numbersββββΊRoman.*/
if \datatype(x, 'W') | x<0  then say "***error***"  newV1  x     /*ͺ*Β¬ whole #?  negative?*/
say  right(x, 55)     dec2rom(x)
end   /*ͺ*i*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
dec2rom: procedure;   parse arg n,newV2              /*ͺ*obtain the number, assign # to a null*/
n=space(translate(n/1, , ','),  0)      /*ͺ*remove commas from normalized integer*/
nulla= 'ZEPHIRUM NULLAE NULLA NIHIL'    /*ͺ*Roman words for "nothing" or "none". */
if n==0  then return word(nulla, 1)     /*ͺ*return a Roman word for  "zero".     */
maxnp=(length(n)-1)%3                   /*ͺ*find max(+1) # of parenthesis to use.*/
highPos=(maxnp+1)*3                     /*ͺ*highest position of number.          */
nn=reverse( right(n, highPos, 0) )      /*ͺ*digits for ArabicβββΊRoman conversion.*/
do j=highPos  to 1  by -3
newV3=substr(nn, j,   1);  select     /*ͺ*ββββββββββββββββββββhundreds.*/
when newV3==9  then hx='CM'
when newV3>=5  then hx='D'copies("C", newV3-5)
when newV3==4  then hx='CD'
otherwise       hx=   copies('C', newV3)
end  /*ͺ*select hundreds*/
newV3=substr(nn, j-1, 1);  select     /*ͺ*ββββββββββββββββββββββββtens.*/
when newV3==9  then tx='XC'
when newV3>=5  then tx='L'copies("X", newV3-5)
when newV3==4  then tx='XL'
otherwise       tx=   copies('X', newV3)
end  /*ͺ*select tens*/
newV3=substr(nn, j-2, 1);  select     /*ͺ*βββββββββββββββββββββββunits.*/
when newV3==9  then ux='IX'
when newV3>=5  then ux='V'copies("I", newV3-5)
when newV3==4  then ux='IV'
otherwise       ux=   copies('I', newV3)
end  /*ͺ*select units*/
newV4=hx || tx || ux
if newV4\==''  then newV2=newV2 || copies("(", (j-1)%3)newV4 ||copies(')', (j-1)%3)
end   /*ͺ*j*/
if pos('(I',newV2)\==0  then do i=1  for 4           /*ͺ*special case: M,MM,MMM,MMMM.*/
if i==4  then newV3 = '(IV)'
else newV3 = '('copies("I", i)')'
if pos(newV3, newV2)\==0  then newV2=changestr(newV3, newV2, copies('M', i))
end   /*ͺ*i*/
return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Roman-numerals-Encode\roman-numerals-encode-2.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
