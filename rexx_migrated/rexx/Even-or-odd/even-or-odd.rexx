/*ͺ*REXX program tests and displays if an integer is  even or odd  using different styles.*/
newV1.=0;   do j=0  by 2  to 8;   newV1.j=1;   end       /*ͺ*assign  0,2,4,6,8  to a "true" value.*/
/*ͺ* [β]  assigns even digits to  "true".*/
numeric digits 1000                              /*ͺ*handle most huge numbers from the CL.*/
parse arg x newV2 .                                  /*ͺ*get an argument from the command line*/
if x==''               then call terr "no integer input (argument)."
if newV2\=='' | arg()\==1  then call terr "too many arguments: "          newV2  arg(2)
if \datatype(x, 'N')   then call terr "argument isn't numeric: "      x
if \datatype(x, 'W')   then call terr "argument isn't an integer: "   x
y=abs(x)/1                                       /*ͺ*in case  X  is negative or malformed,*/
/*ͺ* [β]  remainder of neg # might be -1.*/
/*ͺ*malformed #s: 007  9.0  4.8e1  .21e2 */
call tell 'remainder method (oddness)'
if y//2  then say  x  'is odd'
else say  x  'is even'
/*ͺ* [β]  uses division to get remainder.*/

call tell 'rightmost digit using BIF (not evenness)'
newV2=right(y, 1)
if pos(newV2, 86420)==0  then say x 'is odd'
else say x 'is even'
/*ͺ* [β]  uses 2 BIF (builtβin functions)*/

call tell 'rightmost digit using BIF (evenness)'
newV2=right(y, 1)
if pos(newV2, 86420)\==0  then say x 'is even'
else say x 'is odd'
/*ͺ* [β]  uses 2 BIF (builtβin functions)*/

call tell 'even rightmost digit using array (evenness)'
newV2=right(y, 1)
if newV1.newV2  then say x 'is even'
else say x 'is odd'
/*ͺ* [β]  uses a BIF (builtβin function).*/

call tell 'remainder of division via function invoke (evenness)'
if even(y)  then say x 'is even'
else say x 'is odd'
/*ͺ* [β]  uses (even) function invocation*/

call tell 'remainder of division via function invoke (oddness)'
if odd(y)  then say x 'is odd'
else say x 'is even'
/*ͺ* [β]  uses (odd)  function invocation*/

call tell 'rightmost digit using BIF (not oddness)'
newV2=right(y, 1)
if pos(newV2, 13579)==0  then say x 'is even'
else say x 'is odd'
/*ͺ* [β]  uses 2 BIF (builtβin functions)*/

call tell 'rightmost (binary) bit (oddness)'
if right(x2b(d2x(y)), 1)  then say x 'is odd'
else say x 'is even'
/*ͺ* [β]  requires extra numeric digits. */

call tell 'parse statement using BIF (not oddness)'
parse var  y   ''  -1  newV2                         /*ͺ*obtain last decimal digit of the Y #.*/
if pos(newV2, 02468)==0  then say x 'is odd'
else say x 'is even'
/*ͺ* [β]  uses a BIF (builtβin function).*/

call tell 'parse statement using array (evenness)'
parse var  y   ''  -1  newV2                         /*ͺ*obtain last decimal digit of the Y #.*/
if newV1.newV2  then say  x  'is even'
else say  x  'is odd'
/*ͺ* [β]  this is the fastest algorithm. */
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
even:                     return \( arg(1)//2 )  /*ͺ*returns "evenness" of arg, version 1.*/
even:                     return    arg(1)//2==0 /*ͺ*   "         "      "  "      "    2.*/
even: parse arg '' -1 newV2;  return newV1.newV2             /*ͺ*   "         "      "  "      "    3.*/
/*ͺ*last version shown is the fastest.   */
odd:                      return   arg(1)//2     /*ͺ*returns  "oddness" of the argument.  */
tell: say;   say center('using the' arg(1), 79, "β");                    return
terr: say;   say '***error***';     say;    say arg(1);    say;          exit 13
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Even-or-odd\even-or-odd.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
