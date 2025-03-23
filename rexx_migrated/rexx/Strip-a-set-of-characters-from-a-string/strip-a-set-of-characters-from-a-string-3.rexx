/*ª* REXX ***************************************************************
* If source and stripchars don't contain a hex 00 character, this works
* 06.07.2012 Walter Pachl
* 19.06.2013 -"- space(result,0) -> space(result,0,' ')
*                space(result,0) removes WHITESPACE not only blanks
**********************************************************************/
Say 'Sh ws  soul strppr. Sh took my hrt! -- expected'
Say stripchars("She was a soul stripper. She took my heart!","aei")
Exit
stripchars: Parse Arg string,stripchars
result=translate(string,'00'x,' ')      /*ª* turn blanks into '00'x   */
result=translate(result,' ',stripchars) /*ª* turn stripchars into ' ' */
result=space(result,0,' ')              /*ª* remove all blanks        */
Return translate(result,' ','00'x)      /*ª* '00'x back to blanks     */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Strip-a-set-of-characters-from-a-string\strip-a-set-of-characters-from-a-string-3.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
