u= 'Halloween'                                   /*ª*word to be sorted by (Latin)  letter.*/
upper u                                          /*ª*fast method to uppercase a variable. */
/*ª*another:       u = translate(u)      */
/*ª*another:       parse upper var u u   */
/*ª*another:       u = upper(u)          */
/*ª*not always available [â†‘]             */
say 'u=' u
newV1.=
do  until  u==''                          /*ª*keep truckin' until  U  is  null.    */
parse var u y +1 u                        /*ª*get the next (first) character in  U.*/
xx='?'y                                   /*ª*assign a prefixed character to   XX. */
newV1.xx=newV1.xx || y                            /*ª*append it to all the  Y  characters. */
end   /*ª*until*/                           /*ª*U now has the first character elided.*/
/*ª*Note:  the variable  U  is destroyed.*/

/*ª* [â†“]  constructs a sorted letter word*/

z=newV1.?a||newV1.?b||newV1.?c||newV1.?d||newV1.?e||newV1.?f||newV1.?g||newV1.?h||newV1.?i||newV1.?j||newV1.?k||newV1.?l||newV1.?m||,
newV1.?n||newV1.?o||newV1.?p||newV1.?q||newV1.?r||newV1.?s||newV1.?t||newV1.?u||newV1.?v||newV1.?w||newV1.?x||newV1.?y||newV1.?z

/*ª*Note:  the  ?  is prefixed to the letter to avoid  */
/*ª*collisions with other REXX one-character variables.*/
say 'z=' z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Anagrams\anagrams-3.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
