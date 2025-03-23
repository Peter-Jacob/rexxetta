/*ª*REXX pgm calculates e to nn of decimal digits             */
Parse Arg dig             /*ª* the desired precision          */
Numeric Digits (dig+3)    /*ª* increase precision             */
dig2=dig+2                /*ª* limit the loop                 */
e=1                       /*ª* first element of the series    */
q=1                       /*ª* next element of the series     */
Do n=1 By 1               /*ª* start adding the elements      */
old=e                   /*ª* current sum                    */
q=q/n                   /*ª* new element                    */
e=e+q                   /*ª* add the new element to the sum */
If left(e,dig2)=left(old,dig2) Then /*ª* no change          */
Leave                 /*ª* we are done                    */
End
Numeric Digits dig        /*ª* the desired precision          */
e=e/1                     /*ª* the desired approximation      */
Return left(e,dig+1) '('n 'iterations required)'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Calculating-the-value-of-e\calculating-the-value-of-e-2.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
