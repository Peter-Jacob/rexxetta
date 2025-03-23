/*ª*REXX program demonstrates removal of  1st/last/1st-and-last  characters from a string.*/
newV1 = 'abcdefghijk'
say '                  the original string ='  newV1
say 'string first        character removed ='  substr(newV1, 2)
say 'string         last character removed ='  left(newV1, max(0, length(newV1) -1))
say 'string first & last character removed ='  substr(newV1, 2, max(0, length(newV1) -2))
exit                                             /*ª*stick a fork in it,  we're all done. */

/*ª* [â†“]  an easier to read version using a length variable.*/
newV1 = 'abcdefghijk'
L=length(newV1)
say '                  the original string ='  newV1
say 'string first        character removed ='  substr(newV1, 2)
say 'string         last character removed ='  left(newV1, max(0, L-1) )
say 'string first & last character removed ='  substr(newV1, 2, max(0, L-2) )
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Substring-Top-and-tail\substring-top-and-tail-2.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
