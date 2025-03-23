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
newV3=                                               /*�*nullify the stack (completely empty).*/
do k=1  for tokens;   newV4=newV1.k;   newV2=newV4       /*�*process each token from the  @. list.*/
newV5=words(newV3)                                /*�*stack the count (the number entries).*/
if datatype(newV4,'N')  then do;  newV3=newV3 newV4;   call show  "add to───►stack";  iterate;  end
if newV4=='^'           then newV2= "**"         /*�*REXXify    ^ ───► **    (make legal).*/
interpret 'y='word(newV3,newV5-1)  newV2  word(newV3,newV5)  /*�*compute via the famous REXX INTERPRET*/
if datatype(y,'N')  then y=y/1            /*�*normalize the number with ÷ by unity.*/
newV3=subword(newV3, 1, newV5-2)     y                /*�*rebuild the stack with the answer.   */
call show newV4                               /*�*display steps (tracing into),  maybe.*/
end   /*�*k*/
say                                              /*�*display a blank line, better perusing*/
say ' RPN input:'  ox;   say "  answer──►"newV3      /*�*display original input;  display ans.*/
parse source upper . y .                         /*�*invoked via  C.L.  or via a REXX pgm?*/
if y=='COMMAND' | \datatype(newV3,"W")  then exit    /*�*stick a fork in it,  we're all done. */
else exit newV3  /*�*return the answer  ───►  the invoker.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
show: if showSteps  then say center(arg(1), L)            left(space(newV3), L);        return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Parsing-RPN-calculator-algorithm\parsing-rpn-calculator-algorithm-2.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
