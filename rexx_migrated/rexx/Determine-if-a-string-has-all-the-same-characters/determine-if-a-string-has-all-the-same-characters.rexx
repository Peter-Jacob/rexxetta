/*�*REXX program verifies that  all characters  in a string are all the same (character). */
newV1= '     [character'                               /*�* define a literal used for  SAY.*/
newV2= 'all the same character for string (length'     /*�*    "   "    "     "    "    "  */
newV3.=                                              /*�*define a default for the  @.  array. */
parse arg x                                      /*�*obtain optional argument from the CL.*/
if x\=''  then       newV3.1= x                      /*�*if user specified an arg, use that.  */
else do;   newV3.1=                        /*�*use this null string if no arg given.*/
newV3.2= '   '                  /*�* "    "          "    "  "  "    "   */
newV3.3= 2                      /*�* "    "          "    "  "  "    "   */
newV3.4= 333                    /*�* "    "          "    "  "  "    "   */
newV3.5= .55                    /*�* "    "          "    "  "  "    "   */
newV3.6= 'tttTTT'               /*�* "    "          "    "  "  "    "   */
newV3.7= 4444 444k              /*�* "    "          "    "  "  "    "   */
end                               /*�* [↑]  seventh value contains a blank.*/

do j=1;    L= length(newV3.j)                   /*�*obtain the length of an array element*/
if j>1  &  L==0     then leave              /*�*if arg is null and  J>1, then leave. */
r= allSame(newV3.j)                             /*�*R:  ≡0,  or the location of bad char.*/
if r\==0  then newV4= substr(newV3.j,r,1)           /*�*if  not  monolithic, obtain the char.*/
if r==0   then say '   ' newV2 L"):"  newV3.j
else say 'not' newV2 L"):"  newV3.j  newV1 newV4  "('"c2x(newV4)"'x)  at position"  r"]."
end   /*�*j*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
allSame: procedure; parse arg y                  /*�*get a value from the argument list.  */
if y==''  then return 0                 /*�*if  Y  is null,  then return 0 (zero)*/
return verify(y, left(y,1) )            /*�*All chars the same?   Return 0 (zero)*/
/*�*                else  return location*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Determine-if-a-string-has-all-the-same-characters\determine-if-a-string-has-all-the-same-characters.rexx was migrated on 23 Mar 2025 at 10:43:10
 * -------------------------------------------------------------------------
*/ 
