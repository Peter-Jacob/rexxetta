/*ª*REXX program splits a string based on change of character â”€â”€â”€â–º a comma delimited list.*/
parse arg str                                    /*ª*obtain optional arguments from the CL*/
if str==''  then str= 'gHHH5YY++///\'            /*ª*Not specified?  Then use the default.*/
p=left(str, 1)                                   /*ª*placeholder for the "previous" string*/
newV1=                                               /*ª*     "       "   "    output      "  */
do j=1  for length(str);  newV2=substr(str,j,1) /*ª*obtain a character from the string.  */
if newV2\==p  then newV1=newV1', '                      /*ª*Not replicated char? Append delimiter*/
p=newV2;           newV1=newV1 || newV2                     /*ª*append a character to the  $  string.*/
end   /*ª*j*/                                 /*ª* [â†“]  keep peeling chars until done. */
say '          input string: '      str          /*ª*display the original string & output.*/
say '         output string: '      newV1            /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Split-a-character-string-based-on-change-of-character\split-a-character-string-based-on-change-of-character-1.rexx was migrated on 23 Mar 2025 at 10:43:30
 * -------------------------------------------------------------------------
*/ 
