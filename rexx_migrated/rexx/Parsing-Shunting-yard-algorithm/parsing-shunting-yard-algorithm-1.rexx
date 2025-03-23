/*ª*REXX pgm converts infix arith. expressions to Reverse Polish notation (shuntingâ”€yard).*/
parse arg x                                      /*ª*obtain optional argument from the CL.*/
if x=''  then x= '3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3' /*ª*Not specified?  Then use the default.*/
ox=x
x='(' space(x) ") "                              /*ª*force stacking for the expression.   */
newV2=words(x)                                       /*ª*get number of tokens in expression.  */
do i=1  for newV2;   newV1.i=word(x, i)    /*ª*assign the input tokens to an array. */
end   /*ª*i*/
tell=1                                           /*ª*set to 0 if working steps not wanted.*/
L=max( 20, length(x) )                           /*ª*use twenty for the minimum show width*/

say  'token'  center("input" , L, 'â”€')     center("stack" , L%2, 'â”€'),
center("output", L, 'â”€')     center("action", L,   'â”€')
op= ")(-+/*ª*^¢»   Òïð½óõâóôò¨ïð¬³©»   ð®½»  î½ìåîçôè¨ïð©»  ÒÐÎ½  /*ªóïíå èáîäù­äáîäù öáòó®*/
s.=
do i=1  for n;  _=substr(op,i,1);  s._=(i+1)%2;   p._=s._+(i==n);  end  /*ª*i*/
$=                                               /*ª* [â†‘]  assign the operator priorities.*/
do k=1  for #;              ?=@.k             /*ª*process each token from the  @. list.*/
select                                      /*ª*@.k is:  (,  operator,   ),   operand*/
when ?=='('   then do; $="(" $;    call show 'moving'   ?   "â”€â”€â–º stack";    end
when isOp(?)  then do;              !=word($, 1)             /*ª*get token from stack*/
do  while ! \==')'  &  s.!>=p.?
RPN=RPN !                          /*ª*add token  to   RPN.*/
$=subword($, 2)                    /*ª*del token from stack*/
call show 'unstacking:'  !
!=word($, 1)                       /*ª*get token from stack*/
end   /*ª*while*/
$=? $                                     /*ª*add token  to  stack*/
call show 'moving'   ?   "â”€â”€â–º stack"
end
when ?==')'   then do;             !=word($, 1)              /*ª*get token from stack*/
do  while  !\=='(';     RPN=RPN !    /*ª*add token  to  RPN. */
$=subword($, 2)                      /*ª*del token from stack*/
!=   word($, 1)                      /*ª*get token from stack*/
call show 'moving stack' ! "â”€â”€â–º RPN"
end   /*ª*while*/
$=subword($, 2)                           /*ª*del token from stack*/
call show 'deleting ( from the stack'
end
otherwise  RPN=RPN ?                                         /*ª*add operand to RPN. */
call show 'moving'     ?     "â”€â”€â–º RPN"
end   /*ª*select*/
end    /*ª*k*/
say
RPN=space(RPN $)                                 /*ª*elide any superfluous blanks in RPN. */
say ' input:'  ox;     say " RPNâ”€â”€â–º"    RPN      /*ª*display the input  and  the RPN.     */
parse source upper . y .                         /*ª*invoked via the  C.L.  or  REXX pgm? */
if y=='COMMAND'  then  exit                      /*ª*stick a fork in it,  we're all done. */
else  return RPN                /*ª*return RPN to invoker  (the RESULT). */
/*ª*â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€*/
isOp: return pos(arg(1),rOp) \== 0               /*ª*is the first argument a "real" operator? */
show: if tell then say center(?,5) left(subword(x,k),L) left($,L%2) left(RPN,L) arg(1); return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Parsing-Shunting-yard-algorithm\parsing-shunting-yard-algorithm-1.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
