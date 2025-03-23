/*�*REXX program tests and displays if an integer is  even or odd  using different styles.*/
newV1.=0;   do j=0  by 2  to 8;   newV1.j=1;   end       /*�*assign  0,2,4,6,8  to a "true" value.*/
/*�* [↑]  assigns even digits to  "true".*/
numeric digits 1000                              /*�*handle most huge numbers from the CL.*/
parse arg x newV2 .                                  /*�*get an argument from the command line*/
if x==''               then call terr "no integer input (argument)."
if newV2\=='' | arg()\==1  then call terr "too many arguments: "          newV2  arg(2)
if \datatype(x, 'N')   then call terr "argument isn't numeric: "      x
if \datatype(x, 'W')   then call terr "argument isn't an integer: "   x
y=abs(x)/1                                       /*�*in case  X  is negative or malformed,*/
/*�* [↑]  remainder of neg # might be -1.*/
/*�*malformed #s: 007  9.0  4.8e1  .21e2 */
call tell 'remainder method (oddness)'
if y//2  then say  x  'is odd'
else say  x  'is even'
/*�* [↑]  uses division to get remainder.*/

call tell 'rightmost digit using BIF (not evenness)'
newV2=right(y, 1)
if pos(newV2, 86420)==0  then say x 'is odd'
else say x 'is even'
/*�* [↑]  uses 2 BIF (built─in functions)*/

call tell 'rightmost digit using BIF (evenness)'
newV2=right(y, 1)
if pos(newV2, 86420)\==0  then say x 'is even'
else say x 'is odd'
/*�* [↑]  uses 2 BIF (built─in functions)*/

call tell 'even rightmost digit using array (evenness)'
newV2=right(y, 1)
if newV1.newV2  then say x 'is even'
else say x 'is odd'
/*�* [↑]  uses a BIF (built─in function).*/

call tell 'remainder of division via function invoke (evenness)'
if even(y)  then say x 'is even'
else say x 'is odd'
/*�* [↑]  uses (even) function invocation*/

call tell 'remainder of division via function invoke (oddness)'
if odd(y)  then say x 'is odd'
else say x 'is even'
/*�* [↑]  uses (odd)  function invocation*/

call tell 'rightmost digit using BIF (not oddness)'
newV2=right(y, 1)
if pos(newV2, 13579)==0  then say x 'is even'
else say x 'is odd'
/*�* [↑]  uses 2 BIF (built─in functions)*/

call tell 'rightmost (binary) bit (oddness)'
if right(x2b(d2x(y)), 1)  then say x 'is odd'
else say x 'is even'
/*�* [↑]  requires extra numeric digits. */

call tell 'parse statement using BIF (not oddness)'
parse var  y   ''  -1  newV2                         /*�*obtain last decimal digit of the Y #.*/
if pos(newV2, 02468)==0  then say x 'is odd'
else say x 'is even'
/*�* [↑]  uses a BIF (built─in function).*/

call tell 'parse statement using array (evenness)'
parse var  y   ''  -1  newV2                         /*�*obtain last decimal digit of the Y #.*/
if newV1.newV2  then say  x  'is even'
else say  x  'is odd'
/*�* [↑]  this is the fastest algorithm. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
even:                     return \( arg(1)//2 )  /*�*returns "evenness" of arg, version 1.*/
even:                     return    arg(1)//2==0 /*�*   "         "      "  "      "    2.*/
even: parse arg '' -1 newV2;  return newV1.newV2             /*�*   "         "      "  "      "    3.*/
/*�*last version shown is the fastest.   */
odd:                      return   arg(1)//2     /*�*returns  "oddness" of the argument.  */
tell: say;   say center('using the' arg(1), 79, "═");                    return
terr: say;   say '***error***';     say;    say arg(1);    say;          exit 13
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Even-or-odd\even-or-odd.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
