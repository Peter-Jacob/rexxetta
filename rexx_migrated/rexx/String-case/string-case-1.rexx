abc  = "abcdefghijklmnopqrstuvwxyz"              /*�*define all  lowercase  Latin letters.*/
abcU = translate(abc)                            /*�*   "    "   uppercase    "      "    */

x = 'alphaBETA'                                  /*�*define a string to a REXX variable.  */
y = translate(x)                                 /*�*uppercase  X  and store it ───►  Y   */
z = translate(x, abc, abcU)                      /*�*translate uppercase──►lowercase chars*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\String-case\string-case-1.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
