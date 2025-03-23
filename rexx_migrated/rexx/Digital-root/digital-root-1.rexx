/*ª* REXX ***************************************************************
* Test digroot
**********************************************************************/
/*ª*           n r p */
say right(7           ,12) digroot(7           ) /*ª*           7 7 0 */
say right(627615      ,12) digroot(627615      ) /*ª*      627615 9 2 */
say right(39390       ,12) digroot(39390       ) /*ª*       39390 6 2 */
say right(588225      ,12) digroot(588225      ) /*ª*      588225 3 2 */
say right(393900588225,12) digroot(393900588225) /*ª*393900588225 9 2 */
Exit
digroot: Procedure
/*ª**********************************************************************
* Compute the digital root and persistence of the given decimal number
* 25.07.2012 Walter Pachl
**************************** Bottom of Data **************************/
Parse Arg n                         /*ª* the number                    */
p=0                                 /*ª* persistence                   */
Do While length(n)>1                /*ª* more than one digit in n      */
s=0                               /*ª* initialize sum                */
p=p+1                             /*ª* increment persistence         */
Do while n<>''                    /*ª* as long as there are digits   */
Parse Var n c +1 n              /*ª* pick the first one            */
s=s+c                           /*ª* add to the new sum            */
End
n=s                               /*ª* the 'new' number              */
End
return n p                          /*ª* return root and persistence   */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Digital-root\digital-root-1.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
