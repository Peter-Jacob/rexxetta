/*ª*REXX program supports the Caesar cipher for the Latin alphabet only,  */
/*ª* no punctuation or blanks allowed, lowercase is treated as uppercase. */
Parse Upper Arg key text     /*ª* get key & uppercased text to be ciphered*/
text=space(text,0)           /*ª* elide any and blanks                    */
Say 'Caesar cipher key:' key      /*ª* echo the Caesar cipher key         */
Say '       plain text:' text     /*ª*   "   "       plain text           */
code=caesar(text,key)
Say '         ciphered:' code     /*ª*   "   "    ciphered text           */
back=caesar(code,-key)
Say '       unciphered:' back     /*ª*   "   "  unciphered text           */
If back\==text Then
Say "unciphered text doesn't match plain text."
Exit                              /*ª* stick a fork in it,  we're all done*/
/*ª*----------------------------------------------------------------------*/
caesar: Procedure
Parse Arg text,key
abc='ABCDEFGHIJKLMNOPQRSTUVWXYZ'
If abs(key)>length(abc)-1|key==0 Then
Call err 'key ('key') is invalid.'
badpos=verify(text,abc)          /*ª* any illegal character in the text */
If badpos\==0 Then
Call err 'unsupported character:' substr(text,badpos,1)
If key>0 Then                        /*ª* cipher                        */
key2=key+1
Else                                 /*ª* decipher                      */
key2=length(abc)+key+1
Return translate(text,substr(abc||abc,key2,length(abc)),abc)
/*ª*----------------------------------------------------------------------*/
err:
Say
Say '***error***'
Say
Say arg(1)
Say
Exit 13
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Caesar-cipher\caesar-cipher-1.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
