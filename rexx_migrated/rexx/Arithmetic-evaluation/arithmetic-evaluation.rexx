/*ª*REXX program  evaluates an  infixâ”€type arithmetic expression  and displays the result.*/
nchars = '0123456789.eEdDqQ'                     /*ª*possible parts of a number,  sans  Â± */
e='***error***';    newV3=" ";     doubleOps= '&|*/';      z=       /*ª*handyâ”€dandy variables.*/
parse arg x 1 ox1;    if x=''  then call serr "no input was specified."
x=space(x);   L=length(x);     x=translate(x, '()()', "[]{}")
j=0
do forever;    j=j+1;     if j>L  then leave;    newV4=substr(x, j, 1);   newV1=getX()
newT=pos(newV4,' ()[]{}^Ã·')\==0;  if newT  then do;  z=z newV4 newV3;  iterate;   end
possDouble=pos(newV4,doubleOps)\==0             /*ª*is    _   a possible double operator?*/
if possDouble  then do                      /*ª* "  this  "     "       "       "    */
if newV1==newV4  then do       /*ª*yupper, it's one of a double operator*/
newV4=newV4 || newV4 /*ª*create and use a double char operator*/
x=overlay(newV3, x, Nj)      /*ª*blank out 2nd symbol.*/
end
z=z newV4 newV3;  iterate
end
if newV4=='+' | newV4=="-"  then do;  pnewV4=word(z, max(1,words(z)))   /*ª*last  Z  token.      */
if pnewV4=='('   then z=z 0       /*ª*handle a unary Â±     */
z=z newV4 newV3;     iterate
end
lets=0;  sigs=0;  newV5=newV4

do j=j+1  to L;   newV4=substr(x,j,1)                    /*ª*build a valid number.*/
if lets==1 & sigs==0 then if newV4=='+' | newV4=="-"  then do;  sigs=1
newV5=newV5 || newV4
iterate
end
if pos(newV4,nchars)==0  then leave
lets=lets+datatype(newV4,'M')            /*ª*keep track of the number of exponents*/
newV5=newV5 || translate(newV4,'EEEEE', "eDdQq") /*ª*keep building the number.            */
end   /*ª*j*/
j=j-1
if \datatype(newV5,'N')  then call  serr  "invalid number: "     newV5
z=z newV5 newV3
end   /*ª*forever*/

newV4=word(z,1);      if newV4=='+' | newV4=="-"  then z=0 z /*ª*handle the unary cases.              */
x='(' space(z) ")";    tokens=words(x)           /*ª*force stacking for the expression.   */
do i=1  for tokens;  newV2.i=word(x,i);  end /*ª*i*/ /*ª*assign input tokens.                 */
L=max(20,length(x))                              /*ª*use 20 for the minimum display width.*/
op= ')(-+/*ª*^§»    Òïð½óõâóôò¨ïð¬³©»     ð®½»     ó®½»     î½ìåîçôè¨ïð©»    åðò½»    óôáãë½

do i=1  for n;  _=substr(op,i,1);     s._=(i+1)%2;     p._=s._ + (i==n);      end  /*ª*i*/
/*ª* [â†‘]  assign the operator priorities.*/
do #=1  for tokens;   ?=@.#                    /*ª*process each token from the  @. list.*/
if ?=='**'      then ?="^"                     /*ª*convert to REXX-type exponentiation. */
select                                      /*ª*@.#  is:   (   operator   )   operand*/
when ?=='('  then stack="(" stack
when isOp(?) then do                        /*ª*is the token an operator ?           */
!=word(stack,1)           /*ª*get token from stack.*/
do  while !\==')' & s.!>=p.?;  epr=epr !            /*ª*addition.*/
stack=subword(stack, 2)                  /*ª*del token from stack*/
!=       word(stack, 1)                  /*ª*get token from stack*/
end   /*ª*while*/
stack=? stack                              /*ª*add token  to  stack*/
end
when ?==')' then do;   !=word(stack, 1)                      /*ª*get token from stack*/
do  while !\=='(';             epr=epr ! /*ª*append to expression*/
stack=subword(stack, 2)                  /*ª*del token from stack*/
!=       word(stack, 1)                  /*ª*get token from stack*/
end   /*ª*while*/
stack=subword(stack, 2)                     /*ª*del token from stack*/
end
otherwise  epr=epr ?                                          /*ª*add operand to  epr.*/
end   /*ª*select*/
end     /*ª*#*/

epr=space(epr stack);     tokens=words(epr);     x=epr;     z=;     stack=
do i=1  for tokens; @.i=word(epr,i);  end /*ª*i*/                 /*ª*assign input tokens.*/
Dop='/ // % Ã·';           Bop="& | &&"           /*ª*division   operands; binary operands.*/
Aop='- + * ^ **' Dop Bop; Lop=Aop "||"           /*ª*arithmetic operands; legal  operands.*/

do #=1  for tokens;   ?=@.#;   ??=?            /*ª*process each token from   @.  list.  */
w=words(stack);  b=word(stack, max(1, w  ) )   /*ª*stack count;  the last entry.        */
a=word(stack, max(1, w-1) )   /*ª*stack's  "first"  operand.           */
division  =wordpos(?, Dop)\==0                 /*ª*flag:  doing a division operation.   */
arith     =wordpos(?, Aop)\==0                 /*ª*flag:  doing arithmetic operation.   */
bitOp     =wordpos(?, Bop)\==0                 /*ª*flag:  doing binary mathematics.     */
if datatype(?, 'N')  then do; stack=stack ?;                iterate; end
if wordpos(?,Lop)==0 then do;  z=e  "illegal operator:" ?;        leave; end
if w<2               then do;  z=e  "illegal epr expression.";    leave; end
if ?=='^'            then ??="**"              /*ª*REXXify   ^ â”€â”€â–º **   (make it legal).*/
if ?=='Ã·'            then ??="/"               /*ª*REXXify   Ã· â”€â”€â–º /    (make it legal).*/
if division  &  b=0  then do;  z=e  "division by zero"        b;  leave; end
if bitOp & \isBit(a) then do;  z=e  "token isn't logical: "   a;  leave; end
if bitOp & \isBit(b) then do;  z=e  "token isn't logical: "   b;  leave; end
select                              /*ª*perform an arithmetic operation.     */
when ??=='+'             then y = a +  b
when ??=='-'             then y = a -  b
when ??=='*'             then y = a *  b
when ??=='/' | ??=="Ã·"   then y = a /  b
when ??=='//'            then y = a // b
when ??=='%'             then y = a %  b
when ??=='^' | ??=="**"  then y = a ** b
when ??=='||'            then y = a || b
otherwise              z=e 'invalid operator:' ?;         leave
end   /*ª*select*/
if datatype(y, 'W')   then y=y/1               /*ª*normalize the number with  Ã·  by  1. */
_=subword(stack, 1, w-2);  stack=_ y           /*ª*rebuild the stack with the answer.   */
end   /*ª*#*/

if word(z, 1)==e  then stack=                    /*ª*handle the special case of errors.   */
z=space(z stack)                                 /*ª*append any residual entries.         */
say 'answerâ”€â”€â–º'   z                              /*ª*display the answer  (result).        */
parse source upper . how .                       /*ª*invoked via  C.L.  or REXX program ? */
if how=='COMMAND' | \datatype(z, 'W')  then exit /*ª*stick a fork in it,  we're all done. */
return z                                         /*ª*return  Z â”€â”€â–º invoker  (the RESULT). */
/*ª*â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€*/
isBit: return arg(1)==0 | arg(1) == 1            /*ª*returns  1  if 1st argument is binary*/
isOp:  return pos(arg(1), rOp) \== 0             /*ª*is argument 1 a  "real"  operator?   */
serr:  say;   say e arg(1);   say;   exit 13     /*ª*issue an error message with some text*/
/*ª*â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€â”€*/
getX:            do Nj=j+1  to length(x);   _n=substr(x, Nj, 1);    if _n==$  then iterate
return  substr(x, Nj, 1)        /*ª* [â†‘]  ignore any blanks in expression*/
end   /*ª*Nj*/
return $                                  /*ª*reached end-of-tokens,  return $.    */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arithmetic-evaluation\arithmetic-evaluation.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
