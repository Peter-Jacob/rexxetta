/*�*REXX program  fixes (changes)  depreciated  HTML  code tags  with  newer tags.        */
newV1="<";  old.=;        old.1 = newV1'%s>'         ;     new.1 = newV1"lang %s>"
old.2 = newV1'/%s>'        ;     new.2 = newV1"/lang>"
old.3 = newV1'code %s>'    ;     new.3 = newV1"lang %s>"
old.4 = newV1'/code>'      ;     new.4 = newV1"/lang>"

iFID = 'Wikisource.txt'                          /*�*the  Input File  IDentifier.         */
oFID = 'converted.txt'                           /*�*the Output   "      "                */

do  while lines(iFID)\==0                      /*�*keep reading the file until finished.*/
newV2= linein(iFID)                                /*�*read a record from the input file.   */
do j=1  while old.j \== ''  /*�*change old ──► new  until  finished. */
newV2= changestr(old.j,newV2,new.j) /*�*let REXX do the heavy lifting.       */
end   /*�*j*/
call lineout oFID,newV2                            /*�*write re-formatted record to output. */
end   /*�*while*/                                /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Rosetta-Code-Fix-code-tags\rosetta-code-fix-code-tags.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
