/*ͺ*REXX program implements the   Brainf*ck   (selfβcensored)  language.                  */
newV2.=0                                             /*ͺ*initialize the infinite  "tape".     */
p =0                                             /*ͺ*the  "tape"  cell  pointer.          */
newV3 =0                                             /*ͺ* !   is the instruction pointer (IP).*/
parse arg newV4                                      /*ͺ*allow user to specify a BrainF*ck pgm*/
/*ͺ* ββββββ No program? Then use default;*/
if newV4=''  then newV4=,                                /*ͺ* β      it displays:  Hello, World!  */
"++++++++++             initialize cell #0  to 10;   then loop:         ",
"[   > +++++++              add  7 to cell #1;  final result:  70       ",
"    > ++++++++++           add 10 to cell #2;  final result: 100       ",
"    > +++                  add  3 to cell #3;  final result   30       ",
"    > +                    add  1 to cell #4;  final result   10       ",
"    <<<< -      ]      decrement  cell #0                              ",
"> ++ .                 display 'H'    which is  ASCII  72 (decimal)    ",
"> + .                  display 'e'    which is  ASCII 101 (decimal)    ",
"+++++++ ..             display 'll'   which is  ASCII 108 (decimal) {2}",
"+++ .                  display 'o'    which is  ASCII 111 (decimal)    ",
"> ++ .                 display ' '    which is  ASCII  32 (decimal)    ",
"<< +++++++++++++++ .   display 'W'    which is  ASCII  87 (decimal)    ",
"> .                    display 'o'    which is  ASCII 111 (decimal)    ",
"+++ .                  display 'r'    which is  ASCII 114 (decimal)    ",
"------ .               display 'l'    which is  ASCII 108 (decimal)    ",
"-------- .             display 'd'    which is  ASCII 100 (decimal)    ",
"> + .                  display '!'    which is  ASCII  33 (decimal)    "
/*ͺ* [β]   note the  Brainf*ck  comments.*/
do newV3=1  while  newV3\==0  &  newV3<=length(newV4)       /*ͺ*keep executing  BF  as long as IP Β¬ 0*/
parse var  newV4  newV1  x  +1                   /*ͺ*obtain a  Brainf*ck instruction  (x),*/
/*ͺ*Β·Β·Β·it's the same as  x=substr($,!,1) */
select                                    /*ͺ*examine the current instruction.     */
when x=='+'  then newV2.p=newV2.p + 1             /*ͺ*increment the   "tape" cell    by  1 */
when x=='-'  then newV2.p=newV2.p - 1             /*ͺ*decrement  "       "     "      "  " */
when x=='>'  then   p=  p + 1             /*ͺ*increment  "  instruction ptr   "  " */
when x=='<'  then   p=  p - 1             /*ͺ*decrement  "       "       "    "  " */
when x=='['  then newV3= forward()            /*ͺ*go  forward to   ]+1   if  @.P = 0.  */
when x==']'  then newV3=backward()            /*ͺ* " backward  "   [+1    "   "  Β¬ "   */
when x== .   then call charout , d2c(newV2.p) /*ͺ*display a  "tape"  cell to terminal. */
when x==','  then do;  say 'input a value:';  parse pull newV2.p;  end
otherwise    iterate
end   /*ͺ*select*/
end     /*ͺ*forever*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
forward:  if newV2.p\==0  then return newV3;  c=1        /*ͺ*C: ββββ  is the   [   nested counter.*/
do k=newV3+1  to length(newV4);        newV5=substr(newV4, k, 1)
if newV5=='['  then do; c=c+1;     iterate;                   end
if newV5==']'  then do; c=c-1;     if c==0  then leave;       end
end   /*ͺ*k*/
return k
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
backward: if newV2.p==0   then return newV3;  c=1        /*ͺ*C: ββββ  is the   ]   nested counter.*/
do k=newV3-1  to 1  by -1;         newV5=substr(newV4, k, 1)
if newV5==']'  then do; c=c+1;     iterate;                   end
if newV5=='['  then do; c=c-1;     if c==0  then return k+1;  end
end   /*ͺ*k*/
return k
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Execute-Brain-\execute-brain-.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
