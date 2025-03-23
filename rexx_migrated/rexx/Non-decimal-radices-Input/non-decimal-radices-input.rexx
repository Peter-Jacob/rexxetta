/*ª*REXX program demonstrates REXX's ability to handle non-decimal radices*/
a=123                        /*ª*all of these assignments are identical:  */
b='123'
c='1' || "2" || '3'
d= 1  ||  2  ||  3
e= 12        ||  3
f=120 + 3
g=substr(9912388,3,3)
h=left(123456,3)
i=right(777.123,3)
j=120 + '     3   '
k=0000000123.0000/1          /*ª*division "normalizes the number (â”€â”€â–º 123)*/

/*ª*parsing of a  decimal number  is no      */
/*ª*different then parsing a character string*/
/*ª*because decimal numbers  ARE  character  */
/*ª*strings.    As such, numbers may have    */
/*ª*leading and/or trailing blanks, and in   */
/*ª*some cases, imbedded blanks (after any   */
/*ª*leading sign).                           */

aa=' 123 '                   /*ª*AA's  exact value is different the  A,   */
/*ª*but it's   numerically equal    to  A.   */
bb=123.                      /*ª*the same can be said for the rest of 'em.*/
cc=+123
dd=' +  123'
ee=0000123
ff=1.23e+2
gg=001.23E0002
hh=1230e-1
ii=122.999999999999999999999999999999999    /*ª*assuming NUMERIC DIGITS 9 */
jj= +++123
kk= - -123

bingoA='10101'b               /*ª*stores a binary value. */
bingoB='10101'B               /*ª*  B  can be uppercase. */
bingoC='1 0101'b              /*ª*apostrophes may be used*/
bingoD="1 0101"b              /*ª*quotes may be used.    */

hyoidA='deadbeaf'x            /*ª*stores a hexadecimal value.*/
hyoidB="deadbeaf"X
hyoidC='dead beaf'X
hyoidD='de ad be af'X
hyoidE='dead be af'X
hyoidF='7abc'x
/*ª*REXX has several built-in functions     */
/*ª*(BIFs) to handle conversions of the     */
/*ª*above-mentioned "number" formats.       */

cyanA=d2x(a)                  /*ª*converts a decimal string to hexadecimal*/
cyanB=d2x(5612)               /*ª*converts a decimal string to hexadecimal*/

cyanD=b2x(101101)             /*ª*converts a binary  string to hexadecimal*/

cyanE=b2c(101101)             /*ª*some REXXes support this, others don't. */
cyanF=c2b('copernicium')      /*ª*some REXXes support this, others don't. */

cyanG=c2d('nilla')            /*ª*converts a character string to decimal. */
cyanH=d2c(251)                /*ª*converts a decimal number to character. */

cyanI=x2d(fab)                /*ª*converts a hexadecimal string to decimal*/
cyanJ=x2c(fab)                /*ª*converts a hexadecimal string to chars. */
cyanK=x2b(fab)                /*ª*converts a hexadecimal string to binary.*/

befog=d2b(144)                /*ª*there's no decâ”€â”€â–ºbinary,  but see below.*/
unfog=b2d(101)                /*ª*there's no binâ”€â”€â–ºdecimal, but see below.*/

do j=0  to 27               /*ª*show some simple low-value conversions. */
say right(j,2) 'in decimal is' d2b(j) "in binary and" d2x(j) 'in hex.'
end   /*ª*j*/
exit                                   /*ª*stick a fork in it, we're done.*/
/*ª*â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€add these subroutines to endâ”€ofâ”€program.  */
d2b: return word(strip(x2b(d2x(arg(1))),'L',0) 0,1)  /*ª*convert decâ”€â”€â–ºbin*/
b2d: return x2d(b2x(arg(1)))                         /*ª*convert binâ”€â”€â–ºdec*/
b2c: return x2c(b2x(arg(1)))                         /*ª*convert binâ”€â”€â–ºchr*/
c2b: return word(strip(x2b(c2x(arg(1))),'L',0) 0,1)  /*ª*convert chrâ”€â”€â–ºbin*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Non-decimal-radices-Input\non-decimal-radices-input.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
