/*ª*REXX program supports the Caesar cipher for most keyboard characters  */
/*ª*                                                     including blanks.*/
Parse Arg key text                /*ª* get key and the text to be ciph  */
Say 'Caesar cipher key:' key      /*ª* echo the Caesar cipher key       */
Say '       plain text:' text     /*ª* "   "       plain text           */
code=caesar(text,key)
Say '         ciphered:' code     /*ª* "   "    ciphered text           */
back=caesar(code,-key)
Say '       unciphered:' back     /*ª* "   "  unciphered text           */
If back\==text Then
Say "plain text doesn't match unciphered ciphered text."
Exit                           /*ª* stick a fork in it,  we're all done */
/*ª*----------------------------------------------------------------------*/
caesar: Procedure
Parse Arg txt,ky
abcx='abcdefghijklmnopqrstuvwxyz'
abcx=translate(abcx)abcx"0123456789(){}[]<>'" /*ª*add uppercase, digits */
abcx=abcx'~!@#$%^&*_+:";?,./`-= ' /*ª* also add other characters     */
l=length(abcx)                       /*ª* obtain the length of abcx     */
aky=abs(ky)                          /*ª* absolute value of the key     */
If aky>length(abcx)-1|ky==0 Then
Call err ky 'key is invalid.'
badpos=verify(txt,abcx)              /*ª* any illegal character in txt  */
If badpos\==0 Then
Call err 'unsupported character:' substr(txt,badpos,1)
If ky>0 Then                          /*ª* cipher                        */
ky=ky+1
Else                                 /*ª* decipher                      */
ky=l+1-aky
/*ª* return translated input       */
Return translate(txt,substr(abcx||abcx,ky,l),abcx)
/*ª*----------------------------------------------------------------------*/
err:
Say
Say '***error***'
Say
Say arg(1)
Say
Exit 13
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Caesar-cipher\caesar-cipher-2.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
