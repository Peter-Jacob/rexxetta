/*�*REXX pgm calculates the  de Bruijn  sequence for all pin numbers  (4 digit decimals). */
newV5=                                               /*�*initialize the  de Bruijn  sequence. */
do j=0  for 10;  newV5= newV5 j;   jj= j || j          /*�*compose the left half of the numbers.*/
newV3= space(newV5, 0)                                /*�* [↓]     "  right  "   "  "     "    */
do k=jj+1  to 99;      z= jj || right(k, 2, 0)
if pos(z, newV3)\==0  then iterate /*�*# in sequence? Skip it*/
newV5= newV5 z           /*�* ◄─────────────────────────────────┐ */
end   /*�*k*/      /*�*append a number to the sequence──◄─┘ */
newV3= space(newV5, 0)
do r= jj  to (j || 9);  b= right(r, 2, 0)   /*�*compose the left half of the numbers.*/
if b==jj  then iterate
newV5= newV5 right(b, 2, 0)                         /*�* [↓]     "  right  "   "  "     "    */
newV3= space(newV5, 0);           do k= b+1  to 99;      z= right(b, 2, 0) || right(k, 2, 0)
if pos(z, newV3)\==0  then iterate /*�*# in sequence? Skip it*/
newV5= newV5 z           /*�* ◄─────────────────────────────────┐ */
end   /*�*k*/      /*�*append a number to the sequence──◄─┘ */
newV3= space(newV5, 0)
end   /*�*r*/
end      /*�*j*/

newV5= delword(newV5, words(newV5)-4, 1)                     /*�*delete 5th from the last word in $.  */
newV5= space(newV5, 0)
newV1= 'de Bruijn sequence' /*�*literal used in some SAY instructions*/
newV5= newV5 || left(newV5, 3)        /*�*append 000*/         /*�*simulate "wrap-around" de Bruijn seq.*/
say 'length of the' newV1 " is " length(newV5) /*�*display the length of  de Bruijn seq.*/
say;   say 'first 130 digits of the' newV1":"     /*�*display the title for the next line. */
say left(newV5, 130)                          /*�*display 130 left-most digits of seq. */
say;   say ' last 130 digits of the' newV1":"     /*�*display the title for the next line. */
say right(newV5, 130)                         /*�*display 130 right-most digits of seq.*/
call val newV5                                       /*�*call the  VAL  sub for verification. */
newV1= 'reversed'   newV1           /*�*next,  we'll check on a reversed seq.*/
newV4= reverse(newV5)                                   /*�*do what a mirror does,  reversify it.*/
call val newV4                                      /*�*call the  VAL  sub for verification. */
newV5= overlay(., newV5, 4444)                           /*�*replace 4,444th digit with a period. */
newV1= 'overlaid' subword(newV1, 2) /*�* [↑] this'll cause a validation barf.*/
call val newV5                                       /*�*call the  VAL  sub for verification. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
val: parse arg newV2;    e= 0;    newV6= copies('─',8) /*�*count of errors (missing PINs) so far*/
say;      say newV6 'validating the'    newV1"." /*�*display what's happening in the pgm. */
do pin=0  for 1e4; pin4= right(pin,4,0) /*�* [↓]  maybe add leading zeros to pin.*/
if pos(pin4, newV2)\==0  then iterate     /*�*Was number found?  Just as expected. */
say 'PIN number '      pin       " wasn't found in"         @deb'.'
e= e + 1                                /*�*bump the counter for number of errors*/
end   /*�*pin*/                           /*�* [↑]  validate all 10,000 pin numbers*/
if e==0  then e= 'No'                       /*�*Gooder English (sic) the error count.*/
say newV6   e   'errors found.'                 /*�*display the number of errors found.  */
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\De-Bruijn-sequences\de-bruijn-sequences-2.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
