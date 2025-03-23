/*ª*REXX program  displays the lyrics of the song "The Name Game" by Shirley Ellis.  */
/*ª* 20230526 Walter Pachl refurbished Gerald Schildberger's original program        */
Parse Arg namelist                          /*ª*obtain optional argument(s) from C.L.*/
If namelist='' Then                         /*ª*Not specified?                       */
namelist="gAry, eARL, billy, FeLix, MarY" /*ª*  Then use the default.              */
/*ª* [?]  names separated by commas.     */
Do While namelist>''
namelist=space(namelist)                  /*ª*elide superfluous blanks from list.  */
Parse Var namelist name',' namelist       /*ª*get name (could be 2 words) from list*/
call song name                            /*ª*invoke subroutine to display lyrics. */
End
Exit                                        /*ª*stick a fork in it,  we're all Done. */
/*ª*---------------------------------------------------------------------------------*/
song:
Parse Arg name
Parse Value 'b f m' With bb ff mm
lowercase='abcdefghijklmnopqrstuvwxyz'     /*ª*build 2 alphabets*/
uppercase=translate(lowercase)
name =translate(left(name,1),uppercase,lowercase)||,
translate(substr(name,2),lowercase,uppercase)
namel=translate(name,lowercase,uppercase)
Parse Var name first +1 rest
Select
When pos(first,'AEIOU')>0 Then Do
Say name','  name", bo-b"namel
Say 'Banana-fana fo-f'namel
Say 'Fee-fi-mo-m'namel
End
When pos(first,'BFM')>0 Then Do
Select
When first=='B' Then bb=''
When first=='F' Then ff=''
When first=='M' Then mm=''
End
Say name',' name', bo-'bb||rest
Say 'Banana-fana fo-'ff||rest
Say 'Fee-fi-mo-'mm||rest
End
Otherwise Do
Say name','  name', bo-b'rest
Say 'Banana-fana fo-f'rest
Say 'Fee-fi-mo-m'rest
End
End /*ª*select*/
Say name'!'
Say ''
Return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\The-Name-Game\the-name-game.rexx was migrated on 23 Mar 2025 at 10:43:33
 * -------------------------------------------------------------------------
*/ 
