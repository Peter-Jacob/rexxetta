/*�*REXX pgm to calculate N numbers (sums) in the harmonic series and also when they > X. */
parse arg digs sums high ints                    /*�*obtain optional arguments from the CL*/
if digs='' | digs=","  then digs= 80             /*�*Not specified?  Then use the default.*/
if sums='' | sums=","  then sums= 20             /*�* "      "         "   "   "      "   */
if high='' | high=","  then high= 10             /*�* "      "         "   "   "      "   */
if ints='' | ints=","  then ints= 1 2 3 4 5 6 7 8 9 10  /*�*Not specified? "   "      "   */
w= length(sums) + 2                              /*�*width of Nth harmonic index + suffix.*/
numeric digits digs                              /*�*have REXX use more numeric dec. digs.*/
s= 0                    /*�*initialize harmonic series sum to 0. */
do j=1  for sums;  s= s + 1/j              /*�*calc  "sums" of harmonic series nums.*/
newV1= right((j)th(j), w)                  /*�*obtain a nicely formatted sum index. */
say right(newV1, w)  'harmonic sum ──►'  s /*�*indent the output to the terminal.   */
end   /*�*j*/
say                                              /*�*have a blank line between output sets*/
many= words(ints)                                /*�*obtain number of limits to be used.  */
z= word(ints, 1)                                 /*�*   "   the first   "     "  "   "    */
lastInt= word(ints, many)                        /*�*   "    "  last    "     "  "   "    */
w= length(lastInt)                               /*�*W:  is the maximum width of any limit*/
newV2= 1                                             /*�*a pointer to a list of integer limits*/
s= 0                         /*�*initialize harmonic series sum to 0. */
do j=1;       s= s + 1/j                   /*�*calculate sums of harmonic sum index.*/
if s<=z  then iterate                      /*�*Is sum <= a limit?  Then keep going. */
iter= commas(j)th(j)                       /*�*obtain a nicely formatted sum index. */
L= length(iter)                            /*�*obtain length so as to align output. */
newV1= right(iter, max(L, 25) )            /*�*indent the output to the terminal.   */
say newV1 " iteration of the harmonic series, the sum is greater than "  right(z, w)
newV2= newV2 + 1                                   /*�*bump the pointer to the next limit.  */
if newV2>many  then leave                      /*�*Are at the end of the limits?  Done. */
z= word(ints, newV2)                           /*�*point to the next limit to be used.  */
end   /*�*j*/                                /*�* [↑]  above indices are unity─based. */
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
th:     parse arg x;  return word('th st nd rd', 1 + (x//10) *(x//100%10\==1) *(x//10<4))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Harmonic-series\harmonic-series.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
