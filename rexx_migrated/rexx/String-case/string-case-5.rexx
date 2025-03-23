/*�*REXX program  capitalizes  each word in string, and maintains imbedded blanks.        */
x= "alef bet gimel dalet he vav zayin het tet yod kaf lamed mem nun samekh",
"ayin pe tzadi qof resh shin  tav."           /*�*the "old" spelling of Hebrew letters.*/
y= capitalize(x)                                 /*�*capitalize each word in the string.  */
say x                                            /*�*display the original string of words.*/
say y                                            /*�*   "     "    capitalized      words.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
capitalize: procedure;  parse arg z;   newV2=' 'z    /*�*prefix    $    string with a  blank. */
abc = "abcdefghijklmnopqrstuvwxyz"   /*�*define all  Latin  lowercase letters.*/

do j=1  for 26             /*�*process each letter in the alphabet. */
newV3=' 'substr(abc,j,1); newV1=newV3 /*�*get a  lowercase  (Latin) letter.    */
upper newV1                   /*�* "  "  uppercase     "       "       */
newV2=changestr(newV3, newV2, newV1)      /*�*maybe capitalize some word(s).       */
end   /*�*j*/

return substr(newV2, 2)                  /*�*return the capitalized words.        */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\String-case\string-case-5.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
