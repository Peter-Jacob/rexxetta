/*ª*REXX program calculates/displays 20 pancake numbers (from 1 to 20,inclusive). */
/*ª* Gerard Schildberger's code reformatted and refurbished                       */
pad=copies(' ',10)                                               /*ª*indentation. */
Say pad center('pancakes',10    ) center('pancake flips',15)     /*ª*show the hdr.*/
Say pad center(''        ,10,"-") center('',15,"-")              /*ª*  "   "  sep.*/
Do pcn=1 To 20
Say pad center(pcn,10) center(pancake(pcn),15)                 /*ª*index,flips. */
End
Exit                                      /*ª*stick a fork in it, we're all done. */
/*ª*------------------------------------------------------------------------------*/
pancake: Procedure
Parse Arg n                            /*ª* obtain  N                           */
gap= 2                                 /*ª* initialize the GAP.                 */
sum= 2                                 /*ª* initialize the SUM.                 */
Do adj=0 While sum <n                  /*ª* perform while  SUM is less than  N. */
gap= gap*2 - 1                       /*ª* calculate the GAP.                  */
sum= sum + gap                       /*ª* add the  GAP  to the  SUM.          */
End   /*ª*adj*/
Return n +adj -1                       /*ª* return an adjusted adjustment sum.  */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Pancake-numbers\pancake-numbers-1.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
