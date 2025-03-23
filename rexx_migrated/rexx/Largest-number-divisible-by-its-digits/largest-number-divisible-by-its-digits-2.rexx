/*ª*REXX program finds the largest  hexadecimal  integer divisible by all its hex digits. */
numeric digits 20                                /*ª*be able to handle the large hex nums.*/
bigH= 'fedcba987654321'                          /*ª*biggest number possible, hexadecimal.*/
bigN= x2d(bigH)                                  /*ª*   "       "       "     decimal.    */
newV1= 15 * 14 * 13 * 12 * 11                        /*ª*a # that it must divide the found #. */
t= 0                                             /*ª*the number of divisibility trials.   */
do newV2=bigN % newV1 * newV1       by -newV1               /*ª*search from largest poss. # downwards*/
if newV2 // newV1    \==0  then iterate             /*ª*Not divisible?   Then keep searching.*/
h= d2x(newV2)                                   /*ª*convert decimal number to hexadecimal*/
if pos(0, h) \==0  then iterate             /*ª*does hexadecimal number contain a 0? */
t= t+1                                      /*ª*curiosity's sake, track # of trials. */
do j=1  for length(h) - 1            /*ª*look for a possible duplicated digit.*/
if pos( substr(h, j, 1),  h, j+1) \==0  then iterate newV2
end   /*ª*j*/                          /*ª* [â†‘]  Not unique? Then keep searching*/

do v=1  for length(h)                /*ª*verify the # is divisible by all digs*/
if newV2 // x2d(substr( h, v, 1)  )   \==0  then iterate newV2
end   /*ª*v*/                          /*ª* [â†‘]  Â¬divisible?  Then keep looking.*/
leave                                       /*ª*we found a number, so go display it. */
end          /*ª*#*/

say 'found '    h    "  (in "    t    ' trials)' /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Largest-number-divisible-by-its-digits\largest-number-divisible-by-its-digits-2.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
