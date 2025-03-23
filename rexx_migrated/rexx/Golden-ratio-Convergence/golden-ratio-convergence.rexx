/*ª* REXX
* Compute the Golden Ratio using iteration
* 20230604 Walter Pachl
*/
Numeric Digits 16
Parse Value '1 1 1e-5' With oldPhi phi limit
Do iterations=1 By 1 Until delta<=limit
phi=1+1/oldPhi                      /*ª* next approximation        */
delta=abs(phi-oldPhi)               /*ª* difference to previous    */
If delta>limit Then                 /*ª* not small enough          */
oldPhi=phi                        /*ª* proceed with new value    */
End
actualPhi=(1+sqrt(5,16))/2            /*ª* compute the real value    */
Say 'Final value of phi  : ' phi      /*ª* our approximation         */
Say 'Actual value        : ' actualPhi      /*ª* the real value      */
Say 'Error (approx)      :' (phi-actualPhi) /*ª* the difference      */
Say 'Number of iterations:' iterations
Exit

sqrt: Procedure
/*ª* REXX *************************************************************
* Return sqrt(x,precision) -- with the specified precision
********************************************************************/
Parse Arg x,xprec
If x<0 Then                         /*ª* a negative argument       */
Return 'nan'                      /*ª* has no real square root   */
iprec=xprec+10                      /*ª* increase precision        */
Numeric Digits iprec                /*ª* for very safe results     */
r0= x
r = 1                               /*ª* start value               */
Do Until r=r0                       /*ª* loop until no change of r */
r0 = r                            /*ª* previous value            */
r = (r + x/r) / 2                 /*ª* next approximation        */
End
Numeric Digits xprec                /*ª* reset to desired precision*/
Return (r+0)                        /*ª* normalize the result      */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Golden-ratio-Convergence\golden-ratio-convergence.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
