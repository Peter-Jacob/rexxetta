/*ª* REXX ***************************************************************
* 11.10.2012 Walter Pachl
**********************************************************************/
fib='13 8 5 3 2 1'
Do i=6 To 1 By -1                   /*ª* Prepare Fibonacci Numbers     */
Parse Var fib f.i fib             /*ª* f.1 ... f.7                   */
End
Do n=0 To 20                        /*ª* for all numbers in the task   */
m=n                               /*ª* copy of number                */
r=''                              /*ª* result for n                  */
Do i=6 To 1 By -1                 /*ª* loop through numbers          */
If m>=f.i Then Do               /*ª* f.i must be used              */
r=r||1                        /*ª* 1 into result                 */
m=m-f.i                       /*ª* subtract                      */
End
Else                            /*ª* f.i is larger than the rest   */
r=r||0                        /*ª* 0 into result                 */
End
r=strip(r,'L','0')                /*ª* strip leading zeros           */
If r='' Then r='0'                /*ª* take care of 0                */
Say right(n,2)':  'right(r,6)     /*ª* show result                   */
End
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Zeckendorf-number-representation\zeckendorf-number-representation-1.rexx was migrated on 23 Mar 2025 at 10:43:36
 * -------------------------------------------------------------------------
*/ 
