/*�*REXX program demonstrates various ways to extract substrings from a  string  of characters.*/
newV4='abcdefghijk';  n=4;  m=3        /*�*define some constants: string, index, length of string. */
say 'original string='newV4            /*�* [↑]   M   can be zero  (which indicates a null string).*/
L=length(newV4)                        /*�*the length of the  $  string   (in bytes or characters).*/
say center(1,30,'═') /*�*show a centered title for the  1st  task requirement.   */
u=substr(newV4, n, m)                  /*�*start from  N  characters in  and of  M  length.        */
say u
parse var newV4 newV2 a newV3            /*�*an alternate method by using the  PARSE  instruction.   */
say a
say center(2,30,'═') /*�*show a centered title for the  2nd  task requirement.   */
u=substr(newV4,n)                      /*�*start from  N  characters in,  up to the end-of-string. */
say u
parse var newV4 newV2 a                 /*�*an alternate method by using the  PARSE  instruction.   */
say a
say center(3,30,'═') /*�*show a centered title for the  3rd  task requirement.   */
u=substr(newV4, 1, L-1)                /*�*OK:     the entire string  except  the last character.  */
say u
v=substr(newV4, 1, max(0, L-1) )       /*�*better: this version handles the case of a null string. */
say v
lm=L-1
parse var newV4 a newV1                /*�*an alternate method by using the  PARSE  instruction.   */
say a
say center(4,30,'═') /*�*show a centered title for the  4th  task requirement.   */
u=substr(newV4,pos('g',newV4), m)          /*�*start from a known char within the string of length  M. */
say u
parse var newV4 'g' a newV3             /*�*an alternate method by using the  PARSE  instruction.   */
say a
say center(5,30,'═') /*�*show a centered title for the  5th  task requirement.   */
u=substr(newV4,pos('def',newV4),m)         /*�*start from a known substr within the string of length M.*/
say u
parse var newV4 'def' a newV3           /*�*an alternate method by using the  PARSE  instruction.   */
say a                              /*�*stick a fork in it, we're all done and Bob's your uncle.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Substring\substring.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
