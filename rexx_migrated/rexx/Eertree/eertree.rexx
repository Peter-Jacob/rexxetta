/*�*REXX program creates a list of (unique) sub─palindromes that exist in an input string.*/
parse arg x .                                    /*�*obtain optional input string from CL.*/
if x=='' | x==","  then x= 'eertree'             /*�*Not specified?  Then use the default.*/
L= length(x)                                     /*�*the length (in chars) of input string*/
newV3.= .                                            /*�*@ tree indicates uniqueness of pals. */
newV4=                                               /*�*list of unsorted & unique palindromes*/
do     j=1  for L                             /*�*start at the left side of the string.*/
do k=1  for L                             /*�*traverse from left to right of string*/
parse var  x   newV1  y   newV2             /*�*extract a substring from the string. */
if reverse(y)\==y | newV3.y\==.  then iterate /*�*Partial string a palindrome?  Skip it*/
newV3.y= y                                    /*�*indicate a sub─palindrome was found. */
newV4= newV4' '  y                                /*�*append the sub─palindrome to the list*/
end   /*�*k*/                               /*�* [↑]  an extra blank is inserted.    */
end       /*�*j*/

say '──────── The input string that is being used: '     space(x)
say '──────── The number of sub─palindromes found: '     words(newV4)
say '──────── The  list  of sub─palindromes found: '     strip(newV4)
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Eertree\eertree.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
