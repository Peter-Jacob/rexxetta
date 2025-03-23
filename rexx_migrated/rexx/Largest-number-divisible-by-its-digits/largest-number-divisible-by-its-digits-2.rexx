/*�*REXX program finds the largest  hexadecimal  integer divisible by all its hex digits. */
numeric digits 20                                /*�*be able to handle the large hex nums.*/
bigH= 'fedcba987654321'                          /*�*biggest number possible, hexadecimal.*/
bigN= x2d(bigH)                                  /*�*   "       "       "     decimal.    */
newV1= 15 * 14 * 13 * 12 * 11                        /*�*a # that it must divide the found #. */
t= 0                                             /*�*the number of divisibility trials.   */
do newV2=bigN % newV1 * newV1       by -newV1               /*�*search from largest poss. # downwards*/
if newV2 // newV1    \==0  then iterate             /*�*Not divisible?   Then keep searching.*/
h= d2x(newV2)                                   /*�*convert decimal number to hexadecimal*/
if pos(0, h) \==0  then iterate             /*�*does hexadecimal number contain a 0? */
t= t+1                                      /*�*curiosity's sake, track # of trials. */
do j=1  for length(h) - 1            /*�*look for a possible duplicated digit.*/
if pos( substr(h, j, 1),  h, j+1) \==0  then iterate newV2
end   /*�*j*/                          /*�* [↑]  Not unique? Then keep searching*/

do v=1  for length(h)                /*�*verify the # is divisible by all digs*/
if newV2 // x2d(substr( h, v, 1)  )   \==0  then iterate newV2
end   /*�*v*/                          /*�* [↑]  ¬divisible?  Then keep looking.*/
leave                                       /*�*we found a number, so go display it. */
end          /*�*#*/

say 'found '    h    "  (in "    t    ' trials)' /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Largest-number-divisible-by-its-digits\largest-number-divisible-by-its-digits-2.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
