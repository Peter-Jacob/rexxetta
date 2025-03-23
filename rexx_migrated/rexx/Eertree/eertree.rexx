/*ª*REXX program creates a list of (unique) subâ”€palindromes that exist in an input string.*/
parse arg x .                                    /*ª*obtain optional input string from CL.*/
if x=='' | x==","  then x= 'eertree'             /*ª*Not specified?  Then use the default.*/
L= length(x)                                     /*ª*the length (in chars) of input string*/
newV3.= .                                            /*ª*@ tree indicates uniqueness of pals. */
newV4=                                               /*ª*list of unsorted & unique palindromes*/
do     j=1  for L                             /*ª*start at the left side of the string.*/
do k=1  for L                             /*ª*traverse from left to right of string*/
parse var  x   newV1  y   newV2             /*ª*extract a substring from the string. */
if reverse(y)\==y | newV3.y\==.  then iterate /*ª*Partial string a palindrome?  Skip it*/
newV3.y= y                                    /*ª*indicate a subâ”€palindrome was found. */
newV4= newV4' '  y                                /*ª*append the subâ”€palindrome to the list*/
end   /*ª*k*/                               /*ª* [â†‘]  an extra blank is inserted.    */
end       /*ª*j*/

say 'â”€â”€â”€â”€â”€â”€â”€â”€ The input string that is being used: '     space(x)
say 'â”€â”€â”€â”€â”€â”€â”€â”€ The number of subâ”€palindromes found: '     words(newV4)
say 'â”€â”€â”€â”€â”€â”€â”€â”€ The  list  of subâ”€palindromes found: '     strip(newV4)
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Eertree\eertree.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
