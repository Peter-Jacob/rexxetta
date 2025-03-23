/*ª*REXX program demonstrate case sensitive REXX  index  names  (for compound variables). */

/*ª*  â”Œâ”€â”€â—„â”€â”€ all 3 indices (for an array variable)  are unique  (as far as array index). */
/*ª*  â”‚                                                                                  */
/*ª*  â†“                                                                                  */
x= 'dog';  dogname.x= "Gunner"                   /*ª*assign an array index,  lowercase dog*/
x= 'Dog';  dogname.x= "Thor"                     /*ª*   "    "   "     "   capitalized Dog*/
x= 'DOG';  dogname.x= "Jax"                      /*ª*   "    "   "     "     uppercase DOG*/
x= 'doG';  dogname.x= "Rex"                      /*ª*   "    "   "     "       mixed   doG*/

say center('using compound variables', 35, "â•")   /*ª*title.*/
say

newV1= 'dog';  say "dogname.dog="  dogname.newV1         /*ª*display an array index, lowercase dog*/
newV1= 'Dog';  say "dogname.Dog="  dogname.newV1         /*ª*   "     "   "     "  capitalized Dog*/
newV1= 'DOG';  say "dogname.DOG="  dogname.newV1         /*ª*   "     "   "     "    uppercase DOG*/
newV1= 'doG';  say "dogname.doG="  dogname.newV1         /*ª*   "     "   "     "      mixed   doG*/

/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Case-sensitivity-of-identifiers\case-sensitivity-of-identifiers-2.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
