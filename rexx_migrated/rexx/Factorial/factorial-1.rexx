/*ͺ*REXX pgm computes & shows the factorial of a nonβnegative integer, and also its length*/
numeric digits 100000                            /*ͺ*100k digits:  handles  N  up to  25k.*/
parse arg n                                      /*ͺ*obtain optional argument from the CL.*/
if n=''                   then call er  'no argument specified.'
if arg()>1 | words(n)>1   then call er  'too many arguments specified.'
if \datatype(n,'N')       then call er  "argument isn't numeric: "          n
if \datatype(n,'W')       then call er  "argument isn't a whole number: "   n
if n<0                    then call er  "argument can't be negative: "      n
newV1= 1                                             /*ͺ*define the factorial product (so far)*/
do j=2  to n;       newV1=newV1*j                  /*ͺ*compute the factorial the hard way.  */
end   /*ͺ*j*/                                /*ͺ* [β]  where da rubber meets da road. */

say n'!  is  ['length(newV1) "digits]:"              /*ͺ*display number of digits in factorial*/
say                                              /*ͺ*add some whitespace to the output.   */
say newV1                                            /*ͺ*display the factorial productβββΊterm.*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
er:    say;       say '***error***';      say;      say arg(1);      say;          exit 13
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Factorial\factorial-1.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
