/*�*REXX program demonstrates removal of  1st/last/1st-and-last  characters from a string.*/
newV1 = 'abcdefghijk'
say '                  the original string ='  newV1
say 'string first        character removed ='  substr(newV1, 2)
say 'string         last character removed ='  left(newV1, length(newV1) -1)
say 'string first & last character removed ='  substr(newV1, 2, length(newV1) -2)
/*�*stick a fork in it,  we're all done. */
/*�* ╔═══════════════════════════════════════════════════════════════════════════════╗
║  However, the original string may be null or exactly one byte in length which ║
║  will cause the  BIFs to fail because of  either zero  or  a negative length. ║
╚═══════════════════════════════════════════════════════════════════════════════╝ */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Substring-Top-and-tail\substring-top-and-tail-1.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
