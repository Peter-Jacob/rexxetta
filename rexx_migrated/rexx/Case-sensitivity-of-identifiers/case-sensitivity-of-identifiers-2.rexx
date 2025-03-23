/*�*REXX program demonstrate case sensitive REXX  index  names  (for compound variables). */

/*�*  ┌──◄── all 3 indices (for an array variable)  are unique  (as far as array index). */
/*�*  │                                                                                  */
/*�*  ↓                                                                                  */
x= 'dog';  dogname.x= "Gunner"                   /*�*assign an array index,  lowercase dog*/
x= 'Dog';  dogname.x= "Thor"                     /*�*   "    "   "     "   capitalized Dog*/
x= 'DOG';  dogname.x= "Jax"                      /*�*   "    "   "     "     uppercase DOG*/
x= 'doG';  dogname.x= "Rex"                      /*�*   "    "   "     "       mixed   doG*/

say center('using compound variables', 35, "═")   /*�*title.*/
say

newV1= 'dog';  say "dogname.dog="  dogname.newV1         /*�*display an array index, lowercase dog*/
newV1= 'Dog';  say "dogname.Dog="  dogname.newV1         /*�*   "     "   "     "  capitalized Dog*/
newV1= 'DOG';  say "dogname.DOG="  dogname.newV1         /*�*   "     "   "     "    uppercase DOG*/
newV1= 'doG';  say "dogname.doG="  dogname.newV1         /*�*   "     "   "     "      mixed   doG*/

/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Case-sensitivity-of-identifiers\case-sensitivity-of-identifiers-2.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
