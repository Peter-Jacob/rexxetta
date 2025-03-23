/*ª*REXX program demonstrates   testing      (modeled after Perl example).*/
newV1="I am a string"
say 'The string is:'  newV1
x="string" ;  if right(newV1,length(x))=x  then say 'It ends with:'  x
y="You"    ;  if left(newV1,length(y))\=y  then say 'It does not start with:'  y
z="ring"   ;  if pos(z,newV1)\==0          then say 'It contains the string:'  z
z="ring"   ;  if wordpos(z,newV1)==0       then say 'It does not contain the word:'  z
/*ª*stick a fork in it, we're done.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Regular-expressions\regular-expressions-1.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
