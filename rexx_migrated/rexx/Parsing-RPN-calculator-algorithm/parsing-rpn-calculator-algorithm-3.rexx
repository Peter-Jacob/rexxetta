/*�*REXX program  evaluates  a   ═════ Reverse Polish notation  (RPN) ═════   expression. */
parse arg x                                      /*�*obtain optional arguments from the CL*/
if x=''  then x= "3 4 2 * 1 5 - 2 3 ^ ^ / +"     /*�*Not specified?  Then use the default.*/
tokens=words(x)                                  /*�*save the  number  of  tokens   "  ". */
showSteps=1                                      /*�*set to 0 if working steps not wanted.*/
ox=x                                             /*�*save the  original  value of  X.     */
do i=1  for tokens;   newV1.i=word(x,i)  /*�*assign the input tokens to an array. */
end   /*�*i*/
x=space(x)                                       /*�*remove any superfluous blanks in  X. */
L=max(20, length(x))                             /*�*use 20 for the minimum display width.*/
numeric digits L                                 /*�*ensure enough decimal digits for ans.*/
say center('operand', L, "─")        center('stack', L+L, "─")           /*�*display title*/
Dop= '/ // % ÷';             Bop='& | &&'        /*�*division operators;  binary operands.*/
Aop= '- + * ^ **'  Dop Bop;  Lop=Aop "||"        /*�*arithmetic operators; legal operands.*/
newV3=                                               /*�*nullify the stack (completely empty).*/
do k=1  for tokens;   newV4=newV1.k;   newV2=newV4       /*�*process each token from the  @. list.*/
newV5=words(newV3);  b=word(newV3, max(1, newV5) )        /*�*the stack count;  the last entry.    */
a=word(newV3, max(1, newV5-1) )      /*�*stack's  "first"  operand.           */
division  =wordpos(newV4, Dop)\==0            /*�*flag:  doing a some kind of division.*/
arith     =wordpos(newV4, Aop)\==0            /*�*flag:  doing arithmetic.             */
bitOp     =wordpos(newV4, Bop)\==0            /*�*flag:  doing some kind of binary oper*/
if datatype(newV4, 'N')   then do; newV3=newV3 newV4;  call show  "add to───►stack";  iterate;  end
if wordpos(newV4, Lop)==0 then do; newV3=e 'illegal operator:' newV4;      leave; end
if w<2                then do; newV3=e 'illegal RPN expression.';  leave; end
if newV4=='^'             then newV2= "**"       /*�*REXXify  ^ ──► **   (make it legal). */
if newV4=='÷'             then newV2= "/"        /*�*REXXify  ÷ ──► /    (make it legal). */
if division  &  b=0   then do; newV3=e 'division by zero.'      ;  leave; end
if bitOp & \isBit(a)  then do; newV3=e "token isn't logical: " a;  leave; end
if bitOp & \isBit(b)  then do; newV3=e "token isn't logical: " b;  leave; end
interpret 'y='   a   newV2   b               /*�*compute with two stack operands*/
if datatype(y, 'W')   then y=y/1          /*�*normalize the number with ÷ by unity.*/
newV6=subword(newV3, 1, newV5-2);      newV3=newV6 y          /*�*rebuild the stack with the answer.   */
call show newV4                               /*�*display (possibly)  a working step.  */
end   /*�*k*/
say                                              /*�*display a blank line, better perusing*/
if word(newV3,1)==e  then newV3=                         /*�*handle the special case of errors.   */
say ' RPN input:'  ox;   say " answer───►"newV3      /*�*display original input;  display ans.*/
parse source upper . y .                         /*�*invoked via  C.L.  or via a REXX pgm?*/
if y=='COMMAND' | \datatype(newV3,"W")  then exit    /*�*stick a fork in it,  we're all done. */
else exit newV3  /*�*return the answer  ───►  the invoker.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
isBit: return arg(1)==0 | arg(1)==1              /*�*returns   1   if arg1 is a binary bit*/
show:  if showSteps  then say center(arg(1), L)           left(space(newV3), L);        return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Parsing-RPN-calculator-algorithm\parsing-rpn-calculator-algorithm-3.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
