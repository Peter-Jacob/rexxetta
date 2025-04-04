/*ͺ*REXX program demonstrate  case insensitivity  for  simple  REXX  variable names.      */

/*ͺ*  ββββββ all 3 leftβhand side REXX variables are identical (as far as assignments). */
/*ͺ*  β                                                                                 */
/*ͺ*  β                                                                                 */
dog= 'Benjamin'                             /*ͺ*assign a   lowercase   variable (dog)*/
Dog= 'Samba'                                /*ͺ*   "   "  capitalized     "      Dog */
DOG= 'Bernie'                               /*ͺ*   "   an  uppercase      "      DOG */

say center('using simple variables', 35, "β")     /*ͺ*title.*/
say

if dog\==Dog | DOG\==dog  then say 'The three dogs are named:'     dog"," Dog 'and' DOG"."
else say 'There is just one dog named:'  dog"."

/*ͺ*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Case-sensitivity-of-identifiers\case-sensitivity-of-identifiers-1.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
