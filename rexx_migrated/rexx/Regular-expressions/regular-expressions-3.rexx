/*ª*REXX program shows  non-destructive sub. (modeled after Perl example).*/
newV2 = "I am a string"
old = " a "
new = " another "
say 'The original string is:'  newV2
say 'old  word  is:'           old
say 'new  word  is:'           new
newV1 = changestr(old,newV2,new)
say 'The original string is:'  newV2
say 'The  changed string is:'  newV1
/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Regular-expressions\regular-expressions-3.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
