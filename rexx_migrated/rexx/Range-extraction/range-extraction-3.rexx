/*ª*REXX program to test range extraction. ******************************
* 07.08.2012 Walter Pachl
**********************************************************************/
aaa='0 1 2 4 6 7 8 11 12 14 15 16 17 18 19 20 21 22 23 24 25 27 28 29',
'30 31 32 33 35 36 37 38 39'
say 'old='aaa;
aaa=aaa 1e99                        /*ª* artificial number at the end  */
i=0                                 /*ª* initialize index              */
ol=''                               /*ª* initialize output string      */
comma=''                            /*ª* will become a ',' lateron     */
inrange=0
Do While i<=words(aaa)              /*ª* loop for all numbers          */
i=i+1                             /*ª* index of next number          */
n=word(aaa,i)                     /*ª* the now current number        */
If n=1e99 Then Leave              /*ª* we are at the end             */
If inrange Then Do                /*ª* range was opened              */
If word(aaa,i+1)<>n+1 Then Do   /*ª* following word not in range   */
ol=ol||n                      /*ª* so this number is the end     */
inrange=0                     /*ª* and the range is over         */
End                           /*ª* else ignore current number    */
End
Else Do                           /*ª* not in a range                */
ol=ol||comma||n                 /*ª* add number (with comma)       */
comma=','                       /*ª* to the output string          */
If word(aaa,i+2)=n+2 Then Do    /*ª* if the nr after the next fits */
inrange=1                     /*ª* open a range                  */
ol=ol'-'                      /*ª* append the range connector    */
End
End
End
Say 'new='ol
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Range-extraction\range-extraction-3.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
