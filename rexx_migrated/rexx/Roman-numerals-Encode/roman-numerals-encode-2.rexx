/*�*REXX program converts (Arabic) non─negative decimal integers (≥0) ───► Roman numerals.*/
numeric digits 10000                             /*�*decimal digs can be higher if wanted.*/
parse arg newV2                                      /*�*obtain optional integers from the CL.*/
newV1= "argument isn't a non-negative integer: "   /*�*literal used when issuing error msg. */
if newV2=''  then                                    /*�*Nothing specified?  Then generate #s.*/
do
do j= 0  by  11  to  111; newV2=newV2 j;     end
newV2=newV2 49;                                       do k=88  by 100  to 1200; newV2=newV2 k;     end
newV2=newV2 1000 2000 3000 4000 5000 6000;            do m=88  by 200  to 1200; newV2=newV2 m;     end
newV2=newV2 1304 1405 1506 1607 1708 1809 1910 2011;  do p= 4          to   50; newV2=newV2 10**p; end
end                                          /*�*finished with generation of numbers. */

do i=1  for words(newV2);         x=word(newV2, i)     /*�*convert each of the numbers───►Roman.*/
if \datatype(x, 'W') | x<0  then say "***error***"  newV1  x     /*�*¬ whole #?  negative?*/
say  right(x, 55)     dec2rom(x)
end   /*�*i*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
dec2rom: procedure;   parse arg n,newV2              /*�*obtain the number, assign # to a null*/
n=space(translate(n/1, , ','),  0)      /*�*remove commas from normalized integer*/
nulla= 'ZEPHIRUM NULLAE NULLA NIHIL'    /*�*Roman words for "nothing" or "none". */
if n==0  then return word(nulla, 1)     /*�*return a Roman word for  "zero".     */
maxnp=(length(n)-1)%3                   /*�*find max(+1) # of parenthesis to use.*/
highPos=(maxnp+1)*3                     /*�*highest position of number.          */
nn=reverse( right(n, highPos, 0) )      /*�*digits for Arabic──►Roman conversion.*/
do j=highPos  to 1  by -3
newV3=substr(nn, j,   1);  select     /*�*════════════════════hundreds.*/
when newV3==9  then hx='CM'
when newV3>=5  then hx='D'copies("C", newV3-5)
when newV3==4  then hx='CD'
otherwise       hx=   copies('C', newV3)
end  /*�*select hundreds*/
newV3=substr(nn, j-1, 1);  select     /*�*════════════════════════tens.*/
when newV3==9  then tx='XC'
when newV3>=5  then tx='L'copies("X", newV3-5)
when newV3==4  then tx='XL'
otherwise       tx=   copies('X', newV3)
end  /*�*select tens*/
newV3=substr(nn, j-2, 1);  select     /*�*═══════════════════════units.*/
when newV3==9  then ux='IX'
when newV3>=5  then ux='V'copies("I", newV3-5)
when newV3==4  then ux='IV'
otherwise       ux=   copies('I', newV3)
end  /*�*select units*/
newV4=hx || tx || ux
if newV4\==''  then newV2=newV2 || copies("(", (j-1)%3)newV4 ||copies(')', (j-1)%3)
end   /*�*j*/
if pos('(I',newV2)\==0  then do i=1  for 4           /*�*special case: M,MM,MMM,MMMM.*/
if i==4  then newV3 = '(IV)'
else newV3 = '('copies("I", i)')'
if pos(newV3, newV2)\==0  then newV2=changestr(newV3, newV2, copies('M', i))
end   /*�*i*/
return newV2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Roman-numerals-Encode\roman-numerals-encode-2.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
