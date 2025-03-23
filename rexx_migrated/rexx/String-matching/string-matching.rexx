/*ª*REXX program  demonstrates  some  basic   character string   testing  (for matching). */
parse arg A B                                    /*ª*obtain A and B from the command line.*/
say 'string  A  = '    A                         /*ª*display string   A   to the terminal.*/
say 'string  B  = '    B                         /*ª*   "       "     B    "  "      "    */
say copies('â–‘', 70)                              /*ª*display a line separator  (fence).   */
LB= length(B)                                    /*ª*get the length of string  B  in bytes*/
if left(A, LB)==B  then say  'string  A  starts with string  B'
else say  "string  A  doesn't start with string  B"
say                                              /*ª* [â†“] another method using COMPARE BIF*/
p= pos(B, A)
if p==0  then say  "string  A  doesn't contain string  B"
else say  'string  A  contains string  B  (starting in position'   p")"
say
if right(A, LB)==B  then say 'string  A  ends with string  B'
else say "string  A  doesn't end with string  B"
say
newV1=;   p= 0;                       do  until p==0;          p= pos(B, A, p+1)
if p\==0  then newV1= newV1','   p
end   /*ª*until*/

newV1= space( strip(newV1, 'L', ",") )                   /*ª*elide extra blanks and leading comma.*/
newV2= words(newV1)                                      /*ª*obtain number of words in  $  string.*/

if newV2==0  then say "string  A  doesn't contain string  B"
else say 'string  A  contains string  B '    newV2    " time"left('s', newV2>1),
"(at position"left('s', newV2>1)  newV1")" /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\String-matching\string-matching.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
