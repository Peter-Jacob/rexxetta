/*ª*REXX program to add a  (either metric or "binary" metric)  suffix to a decimal number.*/
newV2.=                                              /*ª*default value for the stemmed array. */
parse arg newV2.1                                    /*ª*obtain optional arguments from the CL*/
if newV2.1==''  then do;   newV2.1=   '   87,654,321                              '
newV2.2=   '  -998,877,665,544,332,211,000    3        '
newV2.3=   '  +112,233                        0        '
newV2.4=   '   16,777,216                     1        '

newV2.5=   '   456,789,100,000,000            2        '
newV2.5=   '   456,789,100,000,000                     '

newV2.6=   '   456,789,100,000,000            2    10  '
newV2.7=   '   456,789,100,000,000            5     2  '
newV2.8=   '   456,789,100,000.000e+00        0    10  '
newV2.9=   '   +16777216                      ,     2  '
newV2.10=  '   1.2e101                                 '
newV2.11=  '   134,112,411,648                1        '    /*ª*via DIR*/
end                             /*ª*@.11â¡  amount of free space on my C: */

do i=1  while newV2.i\==''; say copies("â", 60) /*ª*display a separator betweenst values.*/
parse var  newV2.i  x  f  r  .                  /*ª*get optional arguments from the list.*/
say '     input number='          x         /*ª*show original number     to the term.*/
say '    fraction digs='             f      /*ª*  "  specified fracDigs   "  "    "  */
say '  specified radix='                r   /*ª*  "  specified radix      "  "    "  */
say '       new number='  suffize(x, f, r)  /*ª*maybe append an "alphabetic" suffix. */
end   /*ª*i*/
exit                                             /*ª*stick a fork in it,  we're all done. */
/*ª*ââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââââ*/
suffize: procedure; arg s 2 1 n,  f,  b          /*ª*obtain:  sign, N, fractionDigs, base.*/
if digits()<99  then numeric digits 500 /*ª*use enough dec. digs for arithmetic. */
newV1 = '***error*** (from SUFFIZE)  '   /*ª*literal used when returning err msg. */
if b==''  then b= 10;              o= b /*ª*assume a base  (ten)  if omitted.    */
n= space( translate(n,,','), 0);   m= n /*ª*elide commas from the  1st  argument.*/
f= space( translate(f,,','), 0)         /*ª*elide commas from the  2nd  argument.*/
if \datatype(n, 'N')  then return newV1 "1st argument isn't numeric."
if f==''  then f= length(space(translate(n,,.), 0)) /*ª*F omitted?  Use full len.*/
if \datatype(f, 'W')  then return newV1 "2nd argument isn't an integer: "     f
if f<0                then return newV1 "2nd argument can't be negative. "    f
if \datatype(b, 'W')  then return newV1 "3rd argument isn't an integer. "     b
if b\==10  &  b\==2   then return newV1 "3rd argument isn't a  10  or  2."    b
if arg()>3            then return newV1 "too many arguments were specified."
newV4=  ' KMGTPEZYXWVU'                     /*ª*metric uppercase suffixes, with blank*/
newV3.=;    newV3.2= 'i'                        /*ª*set default suffix;  "binary" suffix.*/
i= 3;   b= abs(b);  if b==2  then i= 10 /*ª*a power of ten; or a power of  2**10 */
if \datatype(n, 'N') | pos('E', n/1)\==0  then return m   /*ª* Â¬num or has an "E"*/
sig=;    if s=='-' | s=="+"  then sig=s /*ª*preserve the number's sign if present*/
n= abs(n)                               /*ª*possibly round number, & remove sign.*/

do while n>=1e100 & b==10;  x=n/1e100 /*ª*is N â¥ googol and base=10?  A googol?*/
if pos(., x)\==0 & o<0  then leave    /*ª*does # have a dec. point  or is B<0? */
return sig  ||  x'googol'             /*ª*maybe prepend the sign,  add GOOGOL. */
end   /*ª*while*/

do j=length(newV4)-1  to 1  by -1  while n>0  /*ª*see if #  is a multiple of 1024. */
newV5= b ** (i*j)                             /*ª*compute base raised to a power.  */
if n<newV5  then iterate                      /*ª*N not big enough?   Keep trying. */
n= format(n/newV5, , min( digits(), f) ) / 1  /*ª*reformat number with a fraction. */
if pos(., n)\==0 & o<0  then return m     /*ª*has a decimal point  or  is B<0? */
leave                                     /*ª*leave this DO loop at this point.*/
end   /*ª*j*/

if n=0  then j=0                            /*ª*N = 0?    Don't use any suffix.  */
return sig||strip(n||substr(newV4, j+1,1))newV3.b   /*ª*add sign, suffixes, strip blanks.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Suffixation-of-decimal-numbers\suffixation-of-decimal-numbers.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
