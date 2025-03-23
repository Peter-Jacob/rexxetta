/*ª*REXX program counts the occurences of all characters in a file
* Adapted version 1 for TSO (EXECIO instead of linein)
* No translation to uppercase takes place
* There is no need for tails being hex
* 25.07.2012 Walter Pachl
***********************************************************************/

Parse arg dsn .                    /*ª*Data set to be processed       */
if dsn='' Then                     /*ª*none specified?                */
dsn='PRIV.V100(TEST)'            /*ª* Use default.                  */
c.=0                               /*ª* Character counts              */
"ALLOC   FI(IN) DA("dsn") SHR REUSE"
'EXECIO   * DISKR IN (STEM L. FINIS'
'FREE   FI(IN)'
totChars=0                         /*ª*count of the total num of chars*/
totLetters=0                       /*ª*count of the total num letters.*/
indent=left('',20)                 /*ª*used for indentation of output.*/

do j=1 to l.0                      /*ª*process all lines              */
rec=l.j                          /*ª*take line number j             */
Say '>'rec'<' length(rec)        /*ª*that's in PRIV.V100(TEST)      */
Say ' E8C44D8FF015674BCDEF'
Say ' 61100711200000000002'
do k=1 for length(rec)           /*ª*loop over characters           */
totChars=totChars+1            /*ª*Increment total number of chars*/
c=substr(rec,k,1)              /*ª*get character number k         */
c.c=c.c+1                      /*ª*increment the character's count*/
End
End                              /*ª*maybe we're Â½ done by now, or Â¬*/

w=length(totChars)                 /*ª*used for right-aligning counts.*/
say 'file -----' dsn "----- has" j-1 'records.'
say 'file -----' dsn "----- has" totChars 'characters.'

do L=0 to 255                      /*ª* display nonzero letter counts */
c=d2c(l)                         /*ª* the character in question     */
if c.c>0 &,                      /*ª* was found in the file         */
datatype(c,'M')>0 Then Do     /*ª* and is a Latin letter         */
say indent "(Latin) letter " c 'count:' right(c.c,w) /*ª* tell    */
totLetters=totLetters+c.c      /*ª* increment number of letters   */
End
End

say 'file -----' dsn "----- has" totLetters '(Latin) letters.'
say '                           other characters follow'
other=0
do m=0 to 255                      /*ª* now for non-letters           */
c=d2c(m)                         /*ª* the character in question     */
y=c2x(c)                         /*ª* the hex representation        */
if c.c>0 &,                      /*ª* was found in the file         */
datatype(c,'M')=0 Then Do     /*ª* and is not a Latin letter     */
other=other+c.c                /*ª* increment count               */
newV1=right(c.c,w)                 /*ª* prepare output of count       */
select                         /*ª*make the character viewable.   */
when c<<' ' | m==255 then say indent  "'"y"'x character count:" newV1
when c==' '          then say indent   "blank character count:" newV1
otherwise                 say indent "   " c 'character count:' newV1
end
end
end
say 'file -----' dsn "----- has" other 'other characters.'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Letter-frequency\letter-frequency-2.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
