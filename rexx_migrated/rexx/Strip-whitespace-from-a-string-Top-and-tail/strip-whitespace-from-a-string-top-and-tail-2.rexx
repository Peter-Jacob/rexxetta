/*�* REXX ***************************************************************
* 01.1.2012 Walter Pachl taking care of all non-printable chars
**********************************************************************/
pc='abcdefghijklmnopqrstuvwxyz'
pc=pc||translate(pc)'äöüÄÖÜß1234567890!"�'��������''���߬����ޡ'
x01='01'x
s=x01||'  Hi  '||x01||' there!  '||x01
say pc                                 /*�* all printable characters   */
s=x01||'  Hi  '||x01||' there!  '||x01 /*�* my source string           */
Say 's >'s'<'                          /*�* show it                    */
p1=verify(s,pc,'M')                    /*�* find first printable char  */
sl=substr(s,p1)                        /*�* start with it              */
Say 'sl>'sl'<'
sr=reverse(s)
p2=verify(sr,pc,'M')                   /*�* find last printable char   */
sr=left(s,length(s)-p2+1)              /*�* end with it                */
Say 'sr>'sr'<'
sb=substr(s,p1,length(s)-p1-p2+1)      /*�* remove leading & trailing  */
Say 'sb>'space(sb)'!'                  /*�* whitespace                 */
sa=translate(s,pc,pc!!xrange('00'x,'FF'x)) /*�* all nonprintable chars */
/*�* are translated to blanks */
sa=space(sa)                           /*�* eliminate them except 1    */
Say 'sa>'sa'<'<'                       /*�* between words              */
s0=space(sa,0)                         /*�* remove all whitespace      */
Say 's0>'s0'<'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Strip-whitespace-from-a-string-Top-and-tail\strip-whitespace-from-a-string-top-and-tail-2.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
