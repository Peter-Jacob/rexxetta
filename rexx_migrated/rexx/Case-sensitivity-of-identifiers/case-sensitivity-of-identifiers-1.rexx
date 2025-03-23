/*ª*REXX program demonstrate  case insensitivity  for  simple  REXX  variable names.      */

/*ª*  â”Œâ”€â”€â—„â”€â”€ all 3 leftâ”€hand side REXX variables are identical (as far as assignments). */
/*ª*  â”‚                                                                                 */
/*ª*  â†“                                                                                 */
dog= 'Benjamin'                             /*ª*assign a   lowercase   variable (dog)*/
Dog= 'Samba'                                /*ª*   "   "  capitalized     "      Dog */
DOG= 'Bernie'                               /*ª*   "   an  uppercase      "      DOG */

say center('using simple variables', 35, "â”€")     /*ª*title.*/
say

if dog\==Dog | DOG\==dog  then say 'The three dogs are named:'     dog"," Dog 'and' DOG"."
else say 'There is just one dog named:'  dog"."

/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Case-sensitivity-of-identifiers\case-sensitivity-of-identifiers-1.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
