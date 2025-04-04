/*ͺ*REXX pgm calculates the  de Bruijn  sequence for all pin numbers  (4 digit decimals). */
newV4=                                               /*ͺ*initialize the  de Bruijn  sequence. */
newV5=10;   lastNode= (newV5-2)(newV5-2)(newV5-1)(newV5-2)           /*ͺ*this number is formed when this # Β·Β·Β·*/
/*ͺ*  Β·Β·Β· is skipped near the cycle end. */
do j=0  for 10;  newV4= newV4 || j;  jj= j || j        /*ͺ*compose the left half of the numbers.*/
/*ͺ* [β]     "  right  "   "  "     "    */
do k=jj+1  to 99;      z= jj || right(k, 2, 0)
if z==lastNode  then iterate    /*ͺ*the last node skipped.*/
if pos(z, newV4)\==0  then iterate  /*ͺ*# in sequence? Skip it*/
newV4= newV4 || z        /*ͺ* βββββββββββββββββββββββββββββββββββ */
end   /*ͺ*k*/      /*ͺ*append a number to the sequenceβββββ */

do r= jj  to (j || 9);  b= right(r, 2, 0)   /*ͺ*compose the left half of the numbers.*/
if b==jj  then iterate
newV4= newV4 || right(b, 2, 0)                      /*ͺ* [β]     "  right  "   "  "     "    */
do k= b+1  to 99;      z= right(b, 2, 0) || right(k, 2, 0)
if pos(z, newV4)\==0  then iterate  /*ͺ*# in sequence? Skip it*/
newV4= newV4 || z        /*ͺ* βββββββββββββββββββββββββββββββββββ */
end   /*ͺ*k*/      /*ͺ*append a number to the sequenceβββββ */
end   /*ͺ*r*/
end      /*ͺ*j*/
newV1= 'de Bruijn sequence' /*ͺ*literal used in some SAY instructions*/
newV4= newV4 || left(newV4, 3)        /*ͺ*append 000*/         /*ͺ*simulate "wrap-around" de Bruijn seq.*/
say 'length of the' newV1 " is " length(newV4) /*ͺ*display the length of  de Bruijn seq.*/
say;   say 'first 130 digits of the' newV1":"     /*ͺ*display the title for the next line. */
say left(newV4, 130)                          /*ͺ*display 130 left-most digits of seq. */
say;   say ' last 130 digits of the' newV1":"     /*ͺ*display the title for the next line. */
say right(newV4, 130)                         /*ͺ*display 130 right-most digits of seq.*/
say                                              /*ͺ*display a blank line.                */
call val newV4                                       /*ͺ*call the  VAL  sub for verification. */
newV1= 'reversed'   newV1           /*ͺ*next,  we'll check on a reversed seq.*/
newV3= reverse(newV4)                                   /*ͺ*do what a mirror does,  reversify it.*/
call val newV3                                      /*ͺ*call the  VAL  sub for verification. */
newV4= overlay(., newV4, 4444)                           /*ͺ*replace 4,444th digit with a period. */
newV1= 'overlaid' subword(newV1, 2) /*ͺ* [β] this'll cause a validation barf.*/
call val newV4                                       /*ͺ*call the  VAL  sub for verification. */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
val: parse arg newV2;    e= 0;    newV6= copies('β',8) /*ͺ*count of errors (missing PINs) so far*/
say;      say newV6 'validating the'    newV1"." /*ͺ*display what's happening in the pgm. */
do pin=0  for 1e4; pin4= right(pin,4,0) /*ͺ* [β]  maybe add leading zeros to pin.*/
if pos(pin4, newV2)\==0  then iterate     /*ͺ*Was number found?  Just as expected. */
say 'PIN number '      pin       " wasn't found in"         @deb'.'
e= e + 1                                /*ͺ*bump the counter for number of errors*/
end   /*ͺ*pin*/                           /*ͺ* [β]  validate all 10,000 pin numbers*/
if e==0  then e= 'No'                       /*ͺ*Gooder English (sic) the error count.*/
say newV6   e   'errors found.'                 /*ͺ*display the number of errors found.  */
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\De-Bruijn-sequences\de-bruijn-sequences-1.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
