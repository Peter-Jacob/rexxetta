/*ช*REXX program  evaluates an  infixโtype arithmetic expression  and displays the result.*/
nchars = '0123456789.eEdDqQ'                     /*ช*possible parts of a number,  sans  ยฑ */
e='***error***';    newV3=" ";     doubleOps= '&|*/';      z=       /*ช*handyโdandy variables.*/
parse arg x 1 ox1;    if x=''  then call serr "no input was specified."
x=space(x);   L=length(x);     x=translate(x, '()()', "[]{}")
j=0
do forever;    j=j+1;     if j>L  then leave;    newV4=substr(x, j, 1);   newV1=getX()
newT=pos(newV4,' ()[]{}^รท')\==0;  if newT  then do;  z=z newV4 newV3;  iterate;   end
possDouble=pos(newV4,doubleOps)\==0             /*ช*is    _   a possible double operator?*/
if possDouble  then do                      /*ช* "  this  "     "       "       "    */
if newV1==newV4  then do       /*ช*yupper, it's one of a double operator*/
newV4=newV4 || newV4 /*ช*create and use a double char operator*/
x=overlay(newV3, x, Nj)      /*ช*blank out 2nd symbol.*/
end
z=z newV4 newV3;  iterate
end
if newV4=='+' | newV4=="-"  then do;  pnewV4=word(z, max(1,words(z)))   /*ช*last  Z  token.      */
if pnewV4=='('   then z=z 0       /*ช*handle a unary ยฑ     */
z=z newV4 newV3;     iterate
end
lets=0;  sigs=0;  newV5=newV4

do j=j+1  to L;   newV4=substr(x,j,1)                    /*ช*build a valid number.*/
if lets==1 & sigs==0 then if newV4=='+' | newV4=="-"  then do;  sigs=1
newV5=newV5 || newV4
iterate
end
if pos(newV4,nchars)==0  then leave
lets=lets+datatype(newV4,'M')            /*ช*keep track of the number of exponents*/
newV5=newV5 || translate(newV4,'EEEEE', "eDdQq") /*ช*keep building the number.            */
end   /*ช*j*/
j=j-1
if \datatype(newV5,'N')  then call  serr  "invalid number: "     newV5
z=z newV5 newV3
end   /*ช*forever*/

newV4=word(z,1);      if newV4=='+' | newV4=="-"  then z=0 z /*ช*handle the unary cases.              */
x='(' space(z) ")";    tokens=words(x)           /*ช*force stacking for the expression.   */
do i=1  for tokens;  newV2.i=word(x,i);  end /*ช*i*/ /*ช*assign input tokens.                 */
L=max(20,length(x))                              /*ช*use 20 for the minimum display width.*/
op= ')(-+/*ช*^งป    า๏๐ฝ๓๕โ๓๔๒จ๏๐ฌณฉป     ๐ฎฝป     ๓ฎฝป     ๎ฝ์ๅ๎็๔่จ๏๐ฉป    ๅ๐๒ฝป    ๓๔แใ๋ฝ

do i=1  for n;  _=substr(op,i,1);     s._=(i+1)%2;     p._=s._ + (i==n);      end  /*ช*i*/
/*ช* [โ]  assign the operator priorities.*/
do #=1  for tokens;   ?=@.#                    /*ช*process each token from the  @. list.*/
if ?=='**'      then ?="^"                     /*ช*convert to REXX-type exponentiation. */
select                                      /*ช*@.#  is:   (   operator   )   operand*/
when ?=='('  then stack="(" stack
when isOp(?) then do                        /*ช*is the token an operator ?           */
!=word(stack,1)           /*ช*get token from stack.*/
do  while !\==')' & s.!>=p.?;  epr=epr !            /*ช*addition.*/
stack=subword(stack, 2)                  /*ช*del token from stack*/
!=       word(stack, 1)                  /*ช*get token from stack*/
end   /*ช*while*/
stack=? stack                              /*ช*add token  to  stack*/
end
when ?==')' then do;   !=word(stack, 1)                      /*ช*get token from stack*/
do  while !\=='(';             epr=epr ! /*ช*append to expression*/
stack=subword(stack, 2)                  /*ช*del token from stack*/
!=       word(stack, 1)                  /*ช*get token from stack*/
end   /*ช*while*/
stack=subword(stack, 2)                     /*ช*del token from stack*/
end
otherwise  epr=epr ?                                          /*ช*add operand to  epr.*/
end   /*ช*select*/
end     /*ช*#*/

epr=space(epr stack);     tokens=words(epr);     x=epr;     z=;     stack=
do i=1  for tokens; @.i=word(epr,i);  end /*ช*i*/                 /*ช*assign input tokens.*/
Dop='/ // % รท';           Bop="& | &&"           /*ช*division   operands; binary operands.*/
Aop='- + * ^ **' Dop Bop; Lop=Aop "||"           /*ช*arithmetic operands; legal  operands.*/

do #=1  for tokens;   ?=@.#;   ??=?            /*ช*process each token from   @.  list.  */
w=words(stack);  b=word(stack, max(1, w  ) )   /*ช*stack count;  the last entry.        */
a=word(stack, max(1, w-1) )   /*ช*stack's  "first"  operand.           */
division  =wordpos(?, Dop)\==0                 /*ช*flag:  doing a division operation.   */
arith     =wordpos(?, Aop)\==0                 /*ช*flag:  doing arithmetic operation.   */
bitOp     =wordpos(?, Bop)\==0                 /*ช*flag:  doing binary mathematics.     */
if datatype(?, 'N')  then do; stack=stack ?;                iterate; end
if wordpos(?,Lop)==0 then do;  z=e  "illegal operator:" ?;        leave; end
if w<2               then do;  z=e  "illegal epr expression.";    leave; end
if ?=='^'            then ??="**"              /*ช*REXXify   ^ โโโบ **   (make it legal).*/
if ?=='รท'            then ??="/"               /*ช*REXXify   รท โโโบ /    (make it legal).*/
if division  &  b=0  then do;  z=e  "division by zero"        b;  leave; end
if bitOp & \isBit(a) then do;  z=e  "token isn't logical: "   a;  leave; end
if bitOp & \isBit(b) then do;  z=e  "token isn't logical: "   b;  leave; end
select                              /*ช*perform an arithmetic operation.     */
when ??=='+'             then y = a +  b
when ??=='-'             then y = a -  b
when ??=='*'             then y = a *  b
when ??=='/' | ??=="รท"   then y = a /  b
when ??=='//'            then y = a // b
when ??=='%'             then y = a %  b
when ??=='^' | ??=="**"  then y = a ** b
when ??=='||'            then y = a || b
otherwise              z=e 'invalid operator:' ?;         leave
end   /*ช*select*/
if datatype(y, 'W')   then y=y/1               /*ช*normalize the number with  รท  by  1. */
_=subword(stack, 1, w-2);  stack=_ y           /*ช*rebuild the stack with the answer.   */
end   /*ช*#*/

if word(z, 1)==e  then stack=                    /*ช*handle the special case of errors.   */
z=space(z stack)                                 /*ช*append any residual entries.         */
say 'answerโโโบ'   z                              /*ช*display the answer  (result).        */
parse source upper . how .                       /*ช*invoked via  C.L.  or REXX program ? */
if how=='COMMAND' | \datatype(z, 'W')  then exit /*ช*stick a fork in it,  we're all done. */
return z                                         /*ช*return  Z โโโบ invoker  (the RESULT). */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
isBit: return arg(1)==0 | arg(1) == 1            /*ช*returns  1  if 1st argument is binary*/
isOp:  return pos(arg(1), rOp) \== 0             /*ช*is argument 1 a  "real"  operator?   */
serr:  say;   say e arg(1);   say;   exit 13     /*ช*issue an error message with some text*/
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
getX:            do Nj=j+1  to length(x);   _n=substr(x, Nj, 1);    if _n==$  then iterate
return  substr(x, Nj, 1)        /*ช* [โ]  ignore any blanks in expression*/
end   /*ช*Nj*/
return $                                  /*ช*reached end-of-tokens,  return $.    */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Arithmetic-evaluation\arithmetic-evaluation.rexx was migrated on 23 Mar 2025 at 10:43:05
 * -------------------------------------------------------------------------
*/ 
