/*ª* REXX ***************************************************************
* 01.1.2012 Walter Pachl taking care of all non-printable chars
**********************************************************************/
pc='abcdefghijklmnopqrstuvwxyz'
pc=pc||translate(pc)'Ã¤Ã¶Ã¼Ã„Ã–ÃœÃŸ1234567890!"Â'¦¯¨©½¿ª«''£»ºß¬®­¼¾Ş¡'
x01='01'x
s=x01||'  Hi  '||x01||' there!  '||x01
say pc                                 /*ª* all printable characters   */
s=x01||'  Hi  '||x01||' there!  '||x01 /*ª* my source string           */
Say 's >'s'<'                          /*ª* show it                    */
p1=verify(s,pc,'M')                    /*ª* find first printable char  */
sl=substr(s,p1)                        /*ª* start with it              */
Say 'sl>'sl'<'
sr=reverse(s)
p2=verify(sr,pc,'M')                   /*ª* find last printable char   */
sr=left(s,length(s)-p2+1)              /*ª* end with it                */
Say 'sr>'sr'<'
sb=substr(s,p1,length(s)-p1-p2+1)      /*ª* remove leading & trailing  */
Say 'sb>'space(sb)'!'                  /*ª* whitespace                 */
sa=translate(s,pc,pc!!xrange('00'x,'FF'x)) /*ª* all nonprintable chars */
/*ª* are translated to blanks */
sa=space(sa)                           /*ª* eliminate them except 1    */
Say 'sa>'sa'<'<'                       /*ª* between words              */
s0=space(sa,0)                         /*ª* remove all whitespace      */
Say 's0>'s0'<'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Strip-whitespace-from-a-string-Top-and-tail\strip-whitespace-from-a-string-top-and-tail-2.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
