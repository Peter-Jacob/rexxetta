/*�*REXX pgm validates the check digit of an ISBN─13 code  (it may have embedded minuses).*/
parse arg newV2                                      /*�*obtain optional arguments from the CL*/
if newV2='' | if newV2=","  then newV2= '978-0596528126 978-0596528120 978-1788399081 978-1788399083'
newV1= "ISBN─13 code isn't"                      /*�*a literal used when displaying msgs. */
/*�* [↓]  remove all minuses from X code.*/
do j=1  for words(newV2);  y= word(newV2,j)            /*�*obtain an ISBN─13 code from  $  list.*/
x= space( translate(y, , '-'),  0)             /*�*remove all minus signs from the code.*/
L= length(x)                                   /*�*obtain the length of the ISBN-13 code*/
if L \== 13                   then do;  say newV1  '13 characters: '  x;  exit 13;   end
if verify(x, 9876543210)\==0  then do;  say newV1  'numeric: '        x;  exit 10;   end
sum= 0
do k=1  for L;   newV3= substr(x, k, 1)    /*�*get a decimal digit from the X code. */
if \(k//2)  then newV3= newV3 * 3              /*�*multiply every other digit by three. */
sum= sum + newV3                           /*�*add the digit (or product) to the SUM*/
end   /*�*k*/

if right(sum, 1)==0  then say '     ISBN-13 code '      x      "    is valid."
else say '     ISBN-13 code '      x      " isn't valid."
end   /*�*j*/                                    /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\ISBN13-check-digit\isbn13-check-digit.rexx was migrated on 23 Mar 2025 at 10:43:17
 * -------------------------------------------------------------------------
*/ 
