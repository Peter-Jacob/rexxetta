/*�*REXX program demonstrates an outer DO loop controlling the inner DO loop with a "FOR".*/

do j=1  for 5                             /*�*this is the same as:   do j=1  to 5  */
newV1=                                        /*�*initialize the value to a null string*/
do k=1  for j                      /*�*only loop for a   J   number of times*/
newV1= newV1'*'                            /*�*using abutment for the construction. */
end   /*�*k*/
say newV1                                     /*�*display character string being built.*/
end          /*�*j*/                        /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Loops-For\loops-for-2.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
