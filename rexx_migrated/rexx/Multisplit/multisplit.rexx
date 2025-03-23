/*�*REXX program  splits  a (character) string  based on different  separator  delimiters.*/
parse arg newV1                                      /*�*obtain optional string from the C.L. */
if newV1=''   then newV1= "a!===b=!=c"                   /*�*None specified?  Then use the default*/
say 'old string:' newV1                              /*�*display the old string to the screen.*/
null= '0'x                                       /*�*null char.   It can be most anything.*/
seps= '== != ='                                  /*�*list of separator strings to be used.*/
/*�* [↓]   process the tokens in  SEPS.  */
do j=1  for words(seps)                        /*�*parse the string with all the seps.  */
sep=word(seps,j)                               /*�*pick a separator to use in below code*/
/*�* [↓]   process characters in the sep.*/
do k=1  for length(sep)                  /*�*parse for various separator versions.*/
sep=strip(insert(null, sep, k), , null)  /*�*allow imbedded "nulls" in separator, */
newV1=changestr(sep, newV1, null)                /*�*       ··· but not trailing "nulls". */
/*�* [↓]   process strings in the input. */
do  until newV1==old;      old=newV1        /*�*keep changing until no more changes. */
newV1=changestr(null || null, newV1, null)  /*�*reduce replicated "nulls" in string. */
end   /*�*until*/
/*�* [↓]  use  BIF  or  external program.*/
sep=changestr(null, sep, '')             /*�*remove true nulls from the separator.*/
end        /*�*k*/
end              /*�*j*/

showNull= ' {} '                                 /*�*just one more thing, display the ··· */
newV1=changestr(null, newV1, showNull)                   /*�*        ··· showing of "null" chars. */
say 'new string:' newV1                              /*�*now, display the new string to term. */
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Multisplit\multisplit.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
