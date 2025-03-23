/*ª*REXX program shows  test and substitute  (modeled after Perl example).*/
newV1 = "I am a string"
old = " am "
new = " was "
say 'The original string is:'  newV1
say 'old  word  is:'           old
say 'new  word  is:'           new

if wordpos(old,newV1)\==0  then
do
newV1 = changestr(old,newV1,new)
say 'I was able to find and replace ' old " with " new
end
/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Regular-expressions\regular-expressions-4.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
