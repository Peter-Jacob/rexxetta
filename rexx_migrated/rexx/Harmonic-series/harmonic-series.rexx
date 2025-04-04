/*ͺ*REXX pgm to calculate N numbers (sums) in the harmonic series and also when they > X. */
parse arg digs sums high ints                    /*ͺ*obtain optional arguments from the CL*/
if digs='' | digs=","  then digs= 80             /*ͺ*Not specified?  Then use the default.*/
if sums='' | sums=","  then sums= 20             /*ͺ* "      "         "   "   "      "   */
if high='' | high=","  then high= 10             /*ͺ* "      "         "   "   "      "   */
if ints='' | ints=","  then ints= 1 2 3 4 5 6 7 8 9 10  /*ͺ*Not specified? "   "      "   */
w= length(sums) + 2                              /*ͺ*width of Nth harmonic index + suffix.*/
numeric digits digs                              /*ͺ*have REXX use more numeric dec. digs.*/
s= 0                    /*ͺ*initialize harmonic series sum to 0. */
do j=1  for sums;  s= s + 1/j              /*ͺ*calc  "sums" of harmonic series nums.*/
newV1= right((j)th(j), w)                  /*ͺ*obtain a nicely formatted sum index. */
say right(newV1, w)  'harmonic sum βββΊ'  s /*ͺ*indent the output to the terminal.   */
end   /*ͺ*j*/
say                                              /*ͺ*have a blank line between output sets*/
many= words(ints)                                /*ͺ*obtain number of limits to be used.  */
z= word(ints, 1)                                 /*ͺ*   "   the first   "     "  "   "    */
lastInt= word(ints, many)                        /*ͺ*   "    "  last    "     "  "   "    */
w= length(lastInt)                               /*ͺ*W:  is the maximum width of any limit*/
newV2= 1                                             /*ͺ*a pointer to a list of integer limits*/
s= 0                         /*ͺ*initialize harmonic series sum to 0. */
do j=1;       s= s + 1/j                   /*ͺ*calculate sums of harmonic sum index.*/
if s<=z  then iterate                      /*ͺ*Is sum <= a limit?  Then keep going. */
iter= commas(j)th(j)                       /*ͺ*obtain a nicely formatted sum index. */
L= length(iter)                            /*ͺ*obtain length so as to align output. */
newV1= right(iter, max(L, 25) )            /*ͺ*indent the output to the terminal.   */
say newV1 " iteration of the harmonic series, the sum is greater than "  right(z, w)
newV2= newV2 + 1                                   /*ͺ*bump the pointer to the next limit.  */
if newV2>many  then leave                      /*ͺ*Are at the end of the limits?  Done. */
z= word(ints, newV2)                           /*ͺ*point to the next limit to be used.  */
end   /*ͺ*j*/                                /*ͺ* [β]  above indices are unityβbased. */
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
commas: parse arg newV3;  do jc=length(newV3)-3  to 1  by -3; newV3=insert(',', newV3, jc); end;  return newV3
th:     parse arg x;  return word('th st nd rd', 1 + (x//10) *(x//100%10\==1) *(x//10<4))
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Harmonic-series\harmonic-series.rexx was migrated on 23 Mar 2025 at 10:43:16
 * -------------------------------------------------------------------------
*/ 
