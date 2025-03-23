/*ª*REXX program to demonstrate string interpolation (string replacement).*/
/*ª*the string to be replaced is   */
replace   = "little"                   /*ª*usually a unique character(s)  */
/*ª*string and is  case  sensative.*/
original1 = "Mary had a X lamb."
new1      = changestr('X', original1, replace)
say 'original1 =' original1
say 'replaced  =' new1
say

original2 = "Mary had a % lamb."
new2      = changestr('%', original2, replace)
say 'original2 =' original2
say 'replaced  =' new2
say

original3 = "Mary had a $$$ lamb."
new3      = changestr('$$$',original3,replace)
say 'original3 =' original3
say 'replaced3 =' new3
say

original4 = "Mary had a someKindOf lamb."
new3      = changestr('someKindOf', original4, "little")
say 'original4 =' original4
say 'replaced4 =' new3
/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\String-interpolation-included-\string-interpolation-included-.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
