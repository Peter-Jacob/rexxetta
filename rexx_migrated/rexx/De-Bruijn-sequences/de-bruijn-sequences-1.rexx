/*�*REXX pgm calculates the  de Bruijn  sequence for all pin numbers  (4 digit decimals). */
newV4=                                               /*�*initialize the  de Bruijn  sequence. */
newV5=10;   lastNode= (newV5-2)(newV5-2)(newV5-1)(newV5-2)           /*�*this number is formed when this # ···*/
/*�*  ··· is skipped near the cycle end. */
do j=0  for 10;  newV4= newV4 || j;  jj= j || j        /*�*compose the left half of the numbers.*/
/*�* [↓]     "  right  "   "  "     "    */
do k=jj+1  to 99;      z= jj || right(k, 2, 0)
if z==lastNode  then iterate    /*�*the last node skipped.*/
if pos(z, newV4)\==0  then iterate  /*�*# in sequence? Skip it*/
newV4= newV4 || z        /*�* ◄─────────────────────────────────┐ */
end   /*�*k*/      /*�*append a number to the sequence──◄─┘ */

do r= jj  to (j || 9);  b= right(r, 2, 0)   /*�*compose the left half of the numbers.*/
if b==jj  then iterate
newV4= newV4 || right(b, 2, 0)                      /*�* [↓]     "  right  "   "  "     "    */
do k= b+1  to 99;      z= right(b, 2, 0) || right(k, 2, 0)
if pos(z, newV4)\==0  then iterate  /*�*# in sequence? Skip it*/
newV4= newV4 || z        /*�* ◄─────────────────────────────────┐ */
end   /*�*k*/      /*�*append a number to the sequence──◄─┘ */
end   /*�*r*/
end      /*�*j*/
newV1= 'de Bruijn sequence' /*�*literal used in some SAY instructions*/
newV4= newV4 || left(newV4, 3)        /*�*append 000*/         /*�*simulate "wrap-around" de Bruijn seq.*/
say 'length of the' newV1 " is " length(newV4) /*�*display the length of  de Bruijn seq.*/
say;   say 'first 130 digits of the' newV1":"     /*�*display the title for the next line. */
say left(newV4, 130)                          /*�*display 130 left-most digits of seq. */
say;   say ' last 130 digits of the' newV1":"     /*�*display the title for the next line. */
say right(newV4, 130)                         /*�*display 130 right-most digits of seq.*/
say                                              /*�*display a blank line.                */
call val newV4                                       /*�*call the  VAL  sub for verification. */
newV1= 'reversed'   newV1           /*�*next,  we'll check on a reversed seq.*/
newV3= reverse(newV4)                                   /*�*do what a mirror does,  reversify it.*/
call val newV3                                      /*�*call the  VAL  sub for verification. */
newV4= overlay(., newV4, 4444)                           /*�*replace 4,444th digit with a period. */
newV1= 'overlaid' subword(newV1, 2) /*�* [↑] this'll cause a validation barf.*/
call val newV4                                       /*�*call the  VAL  sub for verification. */
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
 * REXX C:\Users\PeterJ\rexxetta\rexx\De-Bruijn-sequences\de-bruijn-sequences-1.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
