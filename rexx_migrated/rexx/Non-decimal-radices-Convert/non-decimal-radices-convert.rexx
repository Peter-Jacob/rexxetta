/*ช*REXX program converts integers from  one base  to  another   (using bases  2 โโโบ 90). */
newV2 = 'abcdefghijklmnopqrstuvwxyz'              /*ช*lowercase (Latin or English) alphabet*/
parse  upper  var  newV2    newV1                 /*ช*uppercase a version of   @abc.       */
newV3 = 0123456789 || newV2 || newV1                 /*ช*prefix them with all numeric digits. */
newV3 = newV3'<>[]{}()?~!@#$%^&*_=|\/;:ยขยฌโ'            /*ช*add some special characters as well. */
/*ช* [โ]  all characters must be viewable*/
numeric digits 3000                              /*ช*what da hey, support gihugeic numbers*/
maxB= length(newV3)                                 /*ช*max base/radix supported in this code*/
parse arg x toB inB 1 ox . 1 sigX 2 x2 .         /*ช*obtain:  three args, origX, sign ยทยทยท */
if pos(sigX, "+-")\==0  then    x= x2            /*ช*does X have a leading sign (+ or -) ?*/
else sigX=               /*ช*Nope. No leading sign for the X value*/
if   x==''             then call erm             /*ช*if no  X  number, issue an error msg.*/
if toB=='' | toB==","  then toB= 10              /*ช*if skipped, assume the default (10). */
if inB=='' | inB==","  then inB= 10              /*ช* "    "        "    "     "      "   */
if inB<2   | inB>maxB  | \datatype(inB, 'W')  then call erb  "inBase "  inB
if toB<2   | toB>maxB  | \datatype(toB, 'W')  then call erb  "toBase "  toB
newV4=0                                              /*ช*result of converted  X  (in base 10).*/
do j=1  for length(x)                      /*ช*convert  X:   base inB  โโโบ base 10. */
newV5= substr(x,j,1)                           /*ช*pick off a numeral/digit from  X.    */
newV6= pos(newV5, newV3)                              /*ช*calculate the value of this numeral. */
if newV6==0 | newV6>inB  then call erd x           /*ช*is  _  character an illegal numeral? */
newV4= newV4 * inB   +   newV6   -   1                 /*ช*build a new number,  digit by digit. */
end    /*ช*j*/                               /*ช* [โ]  this also verifies digits.     */
y=                                               /*ช*the value of   X   in   base  B.     */
do  while  newV4 >= toB                        /*ช*convert #:    base 10  โโโบ  base toB.*/
y= substr(newV3, (newV4//toB) + 1, 1)y            /*ช*construct the output number.         */
newV4= newV4 % toB                                 /*ช*      ยทยทยท and whittle  #  down also. */
end    /*ช*while*/                           /*ช* [โ]  algorithm may leave a residual.*/
/*ช* [โ]         Y  is the residual.     */
y= sigX || substr(newV3, newV4+1, 1)y                   /*ช*prepend the sign  if  it existed.    */
say ox  "(base"       inB')'       center("is", 20)       y       '(base'       toB")"
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
erb:  call ser  'illegal'   arg(1)",  it must be in the range:  2โโโบ"maxB
erd:  call ser  'illegal digit/numeral  ['newV5"]  in:  "       x
erm:  call ser  'no argument specified.'
ser:  say; say  '***error!***';         say arg(1);             exit 13
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Non-decimal-radices-Convert\non-decimal-radices-convert.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
