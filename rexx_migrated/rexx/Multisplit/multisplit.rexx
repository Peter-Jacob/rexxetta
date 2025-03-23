/*ª*REXX program  splits  a (character) string  based on different  separator  delimiters.*/
parse arg newV1                                      /*ª*obtain optional string from the C.L. */
if newV1=''   then newV1= "a!===b=!=c"                   /*ª*None specified?  Then use the default*/
say 'old string:' newV1                              /*ª*display the old string to the screen.*/
null= '0'x                                       /*ª*null char.   It can be most anything.*/
seps= '== != ='                                  /*ª*list of separator strings to be used.*/
/*ª* [â†“]   process the tokens in  SEPS.  */
do j=1  for words(seps)                        /*ª*parse the string with all the seps.  */
sep=word(seps,j)                               /*ª*pick a separator to use in below code*/
/*ª* [â†“]   process characters in the sep.*/
do k=1  for length(sep)                  /*ª*parse for various separator versions.*/
sep=strip(insert(null, sep, k), , null)  /*ª*allow imbedded "nulls" in separator, */
newV1=changestr(sep, newV1, null)                /*ª*       Â·Â·Â· but not trailing "nulls". */
/*ª* [â†“]   process strings in the input. */
do  until newV1==old;      old=newV1        /*ª*keep changing until no more changes. */
newV1=changestr(null || null, newV1, null)  /*ª*reduce replicated "nulls" in string. */
end   /*ª*until*/
/*ª* [â†“]  use  BIF  or  external program.*/
sep=changestr(null, sep, '')             /*ª*remove true nulls from the separator.*/
end        /*ª*k*/
end              /*ª*j*/

showNull= ' {} '                                 /*ª*just one more thing, display the Â·Â·Â· */
newV1=changestr(null, newV1, showNull)                   /*ª*        Â·Â·Â· showing of "null" chars. */
say 'new string:' newV1                              /*ª*now, display the new string to term. */
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Multisplit\multisplit.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
