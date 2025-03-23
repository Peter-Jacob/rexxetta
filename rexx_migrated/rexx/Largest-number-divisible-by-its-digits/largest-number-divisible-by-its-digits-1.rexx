/*�*REXX program finds the largest (decimal) integer divisible by all its decimal digits. */
newV1= 7 * 8 * 9                                     /*�*a # that it must divide the found #. */
t= 0                                             /*�*the number of divisibility trials.   */
do newV2=9876432 % newV1 * newV1        by -newV1           /*�*search from largest number downwards.*/
if newV2 // newV1             \==0  then iterate    /*�*Not divisible?   Then keep searching.*/
if verify(50, newV2, 'M') \==0  then iterate    /*�*does it contain a  five  or a  zero? */
t= t+1                                      /*�*curiosity's sake, track # of trials. */
do j=1  for length(newV2) - 1            /*�*look for a possible duplicated digit.*/
if pos( substr( newV2, j, 1), newV2, j+1) \==0  then iterate newV2
end   /*�*j*/                          /*�* [↑]  Not unique? Then keep searching*/
/*�* [↓]  superfluous, but check anyways.*/
do v=1  for length(newV2)                /*�*verify the # is divisible by all digs*/
if newV2 // substr(newV2, v, 1)           \==0  then iterate newV2
end   /*�*v*/                          /*�* [↑]  ¬divisible?  Then keep looking.*/
leave                                       /*�*we found a number, so go display it. */
end         /*�*#*/

say 'found '   newV2    "  (in "   t   ' trials)'    /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Largest-number-divisible-by-its-digits\largest-number-divisible-by-its-digits-1.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
