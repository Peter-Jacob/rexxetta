/*ª*REXX program demonstrates removal of  1st/last/1st-and-last  characters from a string.*/
newV3 = 'abcdefghijk'
say '                  the original string =' newV3

parse var newV3 2 z
say 'string first        character removed =' z

m=length(newV3) - 1
parse var newV3 z newV1
say 'string         last character removed =' z

n=length(newV3) - 2
parse var newV3 2 z newV2
if n==0  then z=                                /*ª*handle special case of a length of 2.*/
say 'string first & last character removed =' z /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Substring-Top-and-tail\substring-top-and-tail-3.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
