/*�*REXX program converts an integer (or a range)  ──►  a Van der Corput number in base 2.*/
numeric digits 1000                              /*�*handle almost anything the user wants*/
parse arg a b .                                  /*�*obtain the optional arguments from CL*/
if a==''  then parse value  0  10   with   a  b  /*�*Not specified?  Then use the defaults*/
if b==''  then b= a                              /*�*assume a  range  for a single number.*/

do j=a  to b                               /*�*traipse through the range of numbers.*/
newV1= VdC( abs(j) )                           /*�*convert absolute value of an integer.*/
leading= substr('-',   2 + sign(j) )       /*�*if needed,  elide the leading sign.  */
say leading  ||  newV1                         /*�*show number, with leading minus sign?*/
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
VdC: procedure;    y= x2b( d2x( arg(1) ) )  + 0  /*�*convert to  hexadecimal, then binary.*/
if y==0  then return 0                      /*�*handle the special case of zero.     */
return '.'reverse(y)          /*�*heavy lifting is performed by REXX.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Van-der-Corput-sequence\van-der-corput-sequence-1.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
