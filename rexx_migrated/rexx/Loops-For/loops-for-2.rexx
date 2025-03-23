/*ª*REXX program demonstrates an outer DO loop controlling the inner DO loop with a "FOR".*/

do j=1  for 5                             /*ª*this is the same as:   do j=1  to 5  */
newV1=                                        /*ª*initialize the value to a null string*/
do k=1  for j                      /*ª*only loop for a   J   number of times*/
newV1= newV1'*'                            /*ª*using abutment for the construction. */
end   /*ª*k*/
say newV1                                     /*ª*display character string being built.*/
end          /*ª*j*/                        /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-For\loops-for-2.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
