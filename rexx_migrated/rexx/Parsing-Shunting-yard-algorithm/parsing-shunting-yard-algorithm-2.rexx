/*ช*REXX pgm converts infix arith. expressions to Reverse Polish notation (shuntingโyard).*/
parse arg x                                      /*ช*obtain optional argument from the CL.*/
if x=''  then x= '3 + 4 * 2 / ( 1 - 5 ) ^ 2 ^ 3' /*ช*Not specified?  Then use the default.*/
g=0                                              /*ช* G   is a counter of   (  and  )     */
do p=1 for words(x);       newV2=word(x,p)    /*ช*catches unbalanced   ( )  and  ) (   */
if newV2=='('  then g=g+1
else if newV2==')'  then do;    g=g-1;    if g<0  then g=-1e8;     end
end   /*ช*p*/
ox=x
x='(' space(x) ") "                              /*ช*force stacking for the expression.   */
newV3=words(x)                                       /*ช*get number of tokens in expression.  */
good= (g==0)                                     /*ช*indicate expression is  good  or bad.*/
do i=1  for newV3;   newV1.i=word(x, i)    /*ช*assign the input tokens to an array. */
end   /*ช*i*/
tell=1                                           /*ช*set to 0 if working steps not wanted.*/
L=max( 20, length(x) )                           /*ช*use twenty for the minimum show width*/
if good  then say  'token'  center("input" , L, 'โ')     center("stack" , L%2, 'โ'),
center("output", L, 'โ')     center("action", L,   'โ')
op= ")(-+/*ช*^ขป   า๏๐ฝ๓๕โ๓๔๒จ๏๐ฌณฉป   ๐ฎฝป  ๎ฝ์ๅ๎็๔่จ๏๐ฉป  าะฮฝ  /*ช๓๏ํๅ ่แ๎ไ๙ญไแ๎ไ๙ ๖แ๒๓ฎ*/
s.=
do i=1  for n;  _=substr(op,i,1);   s._=(i+1)%2;   p._=s._+(i==n);  end  /*ช*i*/
$=                                               /*ช* [โ]  assign the operator priorities.*/
do k=1  for #*good;         ?=@.k             /*ช*process each token from the  @. list.*/
select                                      /*ช*@.k is:   (   operator   )   operand.*/
when ?=='('   then do; $="(" $;    call show 'moving'   ?   "โโโบ stack";    end
when isOp(?)  then do;              !=word($, 1)             /*ช*get token from stack*/
do  while ! \==')'  &  s.!>=p.?
RPN=RPN !                          /*ช*add token  to   RPN.*/
$=subword($, 2)                    /*ช*del token from stack*/
call show 'unstacking:'  !
!=word($, 1)                       /*ช*get token from stack*/
end   /*ช*while*/
$=? $                                     /*ช*add token  to  stack*/
call show 'moving'   ?   "โโโบ stack"
end
when ?==')'   then do;             !=word($, 1)              /*ช*get token from stack*/
do  while  !\=='(';     RPN=RPN !    /*ช*add token   to  RPN.*/
$=subword($, 2)                      /*ช*del token from stack*/
!=   word($, 1)                      /*ช*get token from stack*/
call show 'moving stack' ! "โโโบ RPN"
end   /*ช*while*/
$=subword($, 2)                           /*ช*del token from stack*/
call show 'deleting ( from the stack'
end
otherwise  RPN=RPN ?                                         /*ช*add operand to  RPN.*/
call show 'moving'    ?    "โโโบ RPN"
end   /*ช*select*/
end     /*ช*k*/
say
RPN=space(RPN $);  if \good  then RPN= 'โโโโโโโ error in expression โโโโโโโ'   /*ช*error? */
say ' input:'  ox;     say " RPNโโโบ"    RPN      /*ช*display the input  and  the RPN.     */
parse source upper . y .                         /*ช*invoked via the  C.L.  or  REXX pgm? */
if y=='COMMAND'  then  exit                      /*ช*stick a fork in it,  we're all done. */
else  return RPN                /*ช*return RPN to invoker  (the RESULT). */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
isOp: return pos(arg(1), Rop) \== 0              /*ช*is the first argument a "real" operator? */
show: if tell then say center(?,5) left(subword(x,k),L) left($,L%2) left(RPN,L) arg(1); return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Parsing-Shunting-yard-algorithm\parsing-shunting-yard-algorithm-2.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
