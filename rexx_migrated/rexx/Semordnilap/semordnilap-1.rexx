/*ª* REXX ***************************************************************
* 07.09.2012 Walter Pachl
**********************************************************************/
fid='unixdict.txt'                     /*ª* the test dictionary        */
have.=''                               /*ª* words encountered          */
pi=0                                   /*ª* number of palindromes      */
Do li=1 By 1 While lines(fid)>0        /*ª* as long there is input     */
w=linein(fid)                        /*ª* read a word                */
If w>'' Then Do                      /*ª* not a blank line           */
r=reverse(w)                       /*ª* reverse it                 */
If have.r>'' Then Do               /*ª* was already encountered    */
pi=pi+1                          /*ª* increment number of pal's  */
If pi<=5 Then                    /*ª* the first 5 ale listed     */
Say have.r w
End
have.w=w                           /*ª* remember the word          */
End
End
Say pi 'words in' fid 'have a palindrome' /*ª* total number found      */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Semordnilap\semordnilap-1.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
