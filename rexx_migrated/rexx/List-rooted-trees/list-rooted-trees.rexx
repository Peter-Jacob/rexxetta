/*ª*REXX program lists  nâ”€node  rooted trees  (by enumerating all ways of nesting N bags).*/
parse arg N .                                    /*ª*obtain optional argument from the CL.*/
if N=='' | N==","  then N=5                      /*ª*Not specified?  Then use the default.*/
if N>5  then do;  say N  "isn't supported for this program at this time.";   exit 13;  end
nn= N + N - 1                                    /*ª*power of 2 that is used for dec start*/
numeric digits 200                               /*ª*use enough digs for next calculation.*/
numeric digits max(9, 1 + length( x2b( d2x(2**(nn+1) - 1) ) ) )  /*ª*limit decimal digits.*/
start= 2**nn    +    (2**nn) % 2                 /*ª*calculate the starting decimal number*/
if N==1  then start= 2**1                        /*ª*treat the start for unity as special.*/
newV1= copies('â”€', 20)"â–º ";    o = 'o'               /*ª*demonstrative literal for solutions. */
newV2= 0                                             /*ª*count of ways to nest bags (so far). */
newV3=                                               /*ª*string holds possible duplicious strs*/
do j=start + start//2  to 2**(nn+1)-1  by 2  /*ª*limit the search, smart start and end*/
t= x2b( d2x(j) )   +   0                     /*ª*convert dec number to a binary string*/
z= length( space( translate(t, , 0), 0) )    /*ª*count the number of zeros in bit str.*/
if z\==n  then iterate                       /*ª*Not enough zeroes?  Then skip this T.*/
if N>1  then if  left(t, N)==right(t, N)  then iterate     /*ª*left side â‰¡ right side?*/
if N>2  then if right(t, 2)==    10  then iterate  /*ª*has a rightâ”€most isolated bag ?*/
if N>3  then if right(t, 4)==  1100  then iterate  /*ª* "  "      "         "     "   */
if N>4  then if right(t, 6)==111000  then iterate  /*ª* "  "      "         "     "   */
if N>4  then if right(t, 6)==110100  then iterate  /*ª* "  "      "         "     "   */
if N>4  then if right(t, 6)==100100  then iterate  /*ª* "  "      "         "     "   */
if wordpos(t, newV3)\==0                 then iterate  /*ª*this a duplicate bag stuffing? */
say newV1 changestr('()', translate(t, "()", 10),  o)  /*ª*show a compact display with oh.*/
newV2= newV2 + 1                                     /*ª*bump count of ways of nesting bags.  */
newV3= newV3  translate( reverse(t), 01, 10)         /*ª*save a (possible) duplicious string. */
end   /*ª*j*/
say                                              /*ª*separate numberâ”€ofâ”€ways with a blank.*/
say newV2 ' is the number of ways to nest' n "bags." /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\List-rooted-trees\list-rooted-trees.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
