/*ͺ*REXX pgm converts an integer (or a range) βββΊ a Van der Corput number,  in base 2, or */
/*ͺ*ββββββββββββββββββββββββββββββ optionally, any other base up to and including base 90.*/
numeric digits 1000                              /*ͺ*handle almost anything the user wants*/
parse arg a b r .                                /*ͺ*obtain optional arguments from the CL*/
if a=='' | a=="," then parse value 0 10 with a b /*ͺ*Not specified?  Then use the defaults*/
if b=='' | b=="," then b= a                      /*ͺ* "      "         "   "   "      "   */
if r=='' | r=="," then r= 2                      /*ͺ* "      "         "   "   "      "   */
z=                                               /*ͺ*a placeholder for a list of numbers. */
do j=a  to b                     /*ͺ*traipse through the range of integers*/
newV4= VdC( abs(j), abs(r) )         /*ͺ*convert the ABSolute value of integer*/
newV4= substr('-',  2 + sign(j) )newV4   /*ͺ*if needed, keep the leading  -  sign.*/
if r>0  then say newV4               /*ͺ*if positive base, then just show it. */
else z=z newV4               /*ͺ*     Β·Β·Β· else append (build) a list. */
end   /*ͺ*j*/

if z\==''  then say strip(z)                     /*ͺ*if a list is wanted, then display it.*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
base: procedure; parse arg x, toB, inB           /*ͺ*get a number,  toBase,  and  inBase. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
β Input to this function:    x       (X   is required  and it must be an integer). β
β                          toBase    the base to convert   X   to    (default=10). β
β                          inBase    the base  X  is expressed in    (default=10). β
β                                                                                  β
β                                    toBase & inBase  have a limit of:   2 βββΊ 90  β
ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
newV2= 'abcdefghijklmnopqrstuvwxyz'         /*ͺ*the lowercase Latin alphabet letters.*/
newV1= newV2;         upper newV1           /*ͺ*go whole hog & extend with uppercase.*/
newV3= 0123456789 || newV2 || newV1           /*ͺ*prefix them with the decimal digits. */
newV3= newV3'<>[]{}()?~!@#$%^&*_+-=|\/;:`'     /*ͺ*add some special characters as well, */
/*ͺ*ββthose chars should all be viewable.*/
numeric digits 1000                        /*ͺ*what the hey, support bigun' numbers.*/
maxB= length(newV3)                          /*ͺ*maximum base (radix) supported here. */
if toB==''  then toB= 10                   /*ͺ*if omitted,  then assume default (10)*/
if inB==''  then inB= 10                   /*ͺ* "    "        "     "      "      " */
newV5=0                                        /*ͺ* [β] convert base inB  X  βββΊ base 10*/
do j=1  for length(x)               /*ͺ*process each "numeral" in the string.*/
newV4= substr(x, j, 1)                  /*ͺ*pick off a "digit" (numeral) from  X.*/
v= pos(newV4, newV3)                      /*ͺ*get the value of this "digit"/numeral*/
if v==0 | v>inB  then call erd      /*ͺ*is it an illegal "digit" (numeral) ? */
newV5= newV5 * inB    + v  - 1              /*ͺ*construct new number, digit by digit.*/
end   /*ͺ*j*/
y=                                         /*ͺ* [β] convert base 10  # βββΊ base toB.*/
do  while  newV5>=toB                   /*ͺ*deconstruct the  new   number (#).   */
y= substr(newV3, newV5 // toB  + 1,  1)y  /*ͺ*  construct the output number,  Β·Β·Β·  */
newV5= newV5 % toB                          /*ͺ*  Β·Β·Β·  and also whittle down  #.     */
end   /*ͺ*while*/

return substr(newV3,  newV5 + 1,  1)y            /*ͺ*return a constructed "numeric" string*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
erd:  say 'the character '   v    " isn't a legal numeral for base "    inB'.';    exit 13
VdC:  return '.'reverse( base( arg(1), arg(2) )) /*ͺ*convert the #, reverse the #, append.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Van-der-Corput-sequence\van-der-corput-sequence-2.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
