s = "hello"
say s "literal"
t = s "literal"         /*ª*whitespace between the two strings causes a space in the output.*/
say t
/*ª*the above method works without spaces too.*/

genus= "straw"
say genus"berry"        /*ª*this outputs strawberry.*/
say genus || "berry"    /*ª*concatenation using a double-pipe does not cause spaces.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\String-concatenation\string-concatenation.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
