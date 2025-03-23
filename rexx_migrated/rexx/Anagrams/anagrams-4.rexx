u= 'Halloween'                                   /*ª*word to be sorted by (Latin)  letter.*/
upper u                                          /*ª*fast method to uppercase a variable. */
L=length(u)                                      /*ª*get the length of the word (in bytes)*/
say 'u=' u
say 'L=' L
newV2.=
do k=1  for L                             /*ª*keep truckin'  for   L   characters. */
parse var u newV1 y +1                     /*ª*get the  Kth  character in  U string.*/
xx='?'y                                   /*ª*assign a prefixed character to   XX. */
newV2.xx=newV2.xx || y                            /*ª*append it to all the  Y  characters. */
end   /*ª*do k*/                            /*ª*U now has the first character elided.*/

/*ª* [â†“]  construct a sorted letter word.*/

z=newV2.?a||newV2.?b||newV2.?c||newV2.?d||newV2.?e||newV2.?f||newV2.?g||newV2.?h||newV2.?i||newV2.?j||newV2.?k||newV2.?l||newV2.?m||,
newV2.?n||newV2.?o||newV2.?p||newV2.?q||newV2.?r||newV2.?s||newV2.?t||newV2.?u||newV2.?v||newV2.?w||newV2.?x||newV2.?y||newV2.?z

say 'z=' z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Anagrams\anagrams-4.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
