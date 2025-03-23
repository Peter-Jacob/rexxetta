/*ª* REXX ****************************************************************
* 01.11.2012 Walter Pachl
***********************************************************************/
s='STRING'                             /*ª* Test input                  */
Say 's='s
ol=''                                  /*ª* initialize target           */
Do While s<>''                         /*ª* loop through input          */
Parse Var s c +1 s                   /*ª* pick a character            */
cx=c2x(c)                            /*ª* convert to hex              */
cb=x2b(cx)                           /*ª* convert to bits             */
ol=ol||substr(cb,2)                  /*ª* append to target            */
End
l=length(ol)                           /*ª* current length              */
lm=l//8
ol=ol||copies('0',8-lm)                /*ª* pad to multiple of 8        */
pd=copies(' ',l)||copies('0',8-lm)
Say 'b='ol                             /*ª* show target                 */
Say '  'pd 'padding'
r=''                                   /*ª* initialize result           */
Do While length(ol)>6                  /*ª* loop through target         */
Parse Var ol b +7 ol                 /*ª* pick 7 bits                 */
b='0'||b                             /*ª* add a leading '0'           */
x=b2x(b)                             /*ª* convert to hex              */
r=r||x2c(x)                          /*ª* convert to character        */
End                                  /*ª* and append to result        */
Say 'r='r                              /*ª* show result                 */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Bitwise-IO\bitwise-io-1.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
