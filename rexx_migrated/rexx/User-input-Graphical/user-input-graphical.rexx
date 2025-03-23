/*ª*REXX pgm prompts (using the OS GUI) for a string & then prompts for a specific number.*/
newV1= 75000                                         /*ª*the number that   must be   entered. */
x=
N=
do while x=' ';       say                   /*ª*string can't be blanks or null string*/
say 'Please enter a string: '
parse pull x
if x=''  then say '***error***  No string entered.'
end   /*ª*while xÂ·Â·Â·*/

do while N\=newV1;        say                   /*ª*the number (below) may be ill formed.*/
say 'Please enter the number:'   newV1
parse pull N
if datatype(N, 'N')  then N= N / 1          /*ª*normalize the number:  007  4.0  +2  */
if N\=newV1  then say '***error***  The number is not correct: '   N.
end   /*ª*while NÂ·Â·Â·*/
say
say 'The string entered is:'  x                  /*ª*echo the values  (string and number. */
say 'The number entered is:'  N                  /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\User-input-Graphical\user-input-graphical.rexx was migrated on 23 Mar 2025 at 10:43:34
 * -------------------------------------------------------------------------
*/ 
