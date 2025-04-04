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
newV3=                                               /*ͺ*nullify the stack (completely empty).*/
do k=1  for tokens;   newV4=newV1.k;   newV2=newV4       /*ͺ*process each token from the  @. list.*/
newV5=words(newV3)                                /*ͺ*stack the count (the number entries).*/
if datatype(newV4,'N')  then do;  newV3=newV3 newV4;   call show  "add toββββΊstack";  iterate;  end
if newV4=='^'           then newV2= "**"         /*ͺ*REXXify    ^ ββββΊ **    (make legal).*/
interpret 'y='word(newV3,newV5-1)  newV2  word(newV3,newV5)  /*ͺ*compute via the famous REXX INTERPRET*/
if datatype(y,'N')  then y=y/1            /*ͺ*normalize the number with Γ· by unity.*/
newV3=subword(newV3, 1, newV5-2)     y                /*ͺ*rebuild the stack with the answer.   */
call show newV4                               /*ͺ*display steps (tracing into),  maybe.*/
end   /*ͺ*k*/
say                                              /*ͺ*display a blank line, better perusing*/
say ' RPN input:'  ox;   say "  answerβββΊ"newV3      /*ͺ*display original input;  display ans.*/
parse source upper . y .                         /*ͺ*invoked via  C.L.  or via a REXX pgm?*/
if y=='COMMAND' | \datatype(newV3,"W")  then exit    /*ͺ*stick a fork in it,  we're all done. */
else exit newV3  /*ͺ*return the answer  ββββΊ  the invoker.*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
show: if showSteps  then say center(arg(1), L)            left(space(newV3), L);        return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Parsing-RPN-calculator-algorithm\parsing-rpn-calculator-algorithm-2.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
