/*ͺ*REXX program  evaluates  a   βββββ Reverse Polish notation  (RPN) βββββ   expression. */
parse arg x                                      /*ͺ*obtain optional arguments from the CL*/
if x=''  then x= "3 4 2 * 1 5 - 2 3 ^ ^ / +"     /*ͺ*Not specified?  Then use the default.*/
tokens=words(x)                                  /*ͺ*save the  number  of  tokens   "  ". */
showSteps=1                                      /*ͺ*set to 0 if working steps not wanted.*/
ox=x                                             /*ͺ*save the  original  value of  X.     */
do i=1  for tokens;   newV1.i=word(x,i)  /*ͺ*assign the input tokens to an array. */
end   /*ͺ*i*/
x=space(x)                                       /*ͺ*remove any superfluous blanks in  X. */
L=max(20, length(x))                             /*ͺ*use 20 for the minimum display width.*/
numeric digits L                                 /*ͺ*ensure enough decimal digits for ans.*/
say center('operand', L, "β")        center('stack', L+L, "β")           /*ͺ*display title*/
Dop= '/ // % Γ·';             Bop='& | &&'        /*ͺ*division operators;  binary operands.*/
Aop= '- + * ^ **'  Dop Bop;  Lop=Aop "||"        /*ͺ*arithmetic operators; legal operands.*/
newV3=                                               /*ͺ*nullify the stack (completely empty).*/
do k=1  for tokens;   newV4=newV1.k;   newV2=newV4       /*ͺ*process each token from the  @. list.*/
newV5=words(newV3);  b=word(newV3, max(1, newV5) )        /*ͺ*the stack count;  the last entry.    */
a=word(newV3, max(1, newV5-1) )      /*ͺ*stack's  "first"  operand.           */
division  =wordpos(newV4, Dop)\==0            /*ͺ*flag:  doing a some kind of division.*/
arith     =wordpos(newV4, Aop)\==0            /*ͺ*flag:  doing arithmetic.             */
bitOp     =wordpos(newV4, Bop)\==0            /*ͺ*flag:  doing some kind of binary oper*/
if datatype(newV4, 'N')   then do; newV3=newV3 newV4;  call show  "add toββββΊstack";  iterate;  end
if wordpos(newV4, Lop)==0 then do; newV3=e 'illegal operator:' newV4;      leave; end
if w<2                then do; newV3=e 'illegal RPN expression.';  leave; end
if newV4=='^'             then newV2= "**"       /*ͺ*REXXify  ^ βββΊ **   (make it legal). */
if newV4=='Γ·'             then newV2= "/"        /*ͺ*REXXify  Γ· βββΊ /    (make it legal). */
if division  &  b=0   then do; newV3=e 'division by zero.'      ;  leave; end
if bitOp & \isBit(a)  then do; newV3=e "token isn't logical: " a;  leave; end
if bitOp & \isBit(b)  then do; newV3=e "token isn't logical: " b;  leave; end
interpret 'y='   a   newV2   b               /*ͺ*compute with two stack operands*/
if datatype(y, 'W')   then y=y/1          /*ͺ*normalize the number with Γ· by unity.*/
newV6=subword(newV3, 1, newV5-2);      newV3=newV6 y          /*ͺ*rebuild the stack with the answer.   */
call show newV4                               /*ͺ*display (possibly)  a working step.  */
end   /*ͺ*k*/
say                                              /*ͺ*display a blank line, better perusing*/
if word(newV3,1)==e  then newV3=                         /*ͺ*handle the special case of errors.   */
say ' RPN input:'  ox;   say " answerββββΊ"newV3      /*ͺ*display original input;  display ans.*/
parse source upper . y .                         /*ͺ*invoked via  C.L.  or via a REXX pgm?*/
if y=='COMMAND' | \datatype(newV3,"W")  then exit    /*ͺ*stick a fork in it,  we're all done. */
else exit newV3  /*ͺ*return the answer  ββββΊ  the invoker.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isBit: return arg(1)==0 | arg(1)==1              /*ͺ*returns   1   if arg1 is a binary bit*/
show:  if showSteps  then say center(arg(1), L)           left(space(newV3), L);        return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Parsing-RPN-calculator-algorithm\parsing-rpn-calculator-algorithm-3.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
