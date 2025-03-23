/*�*REXX program implements the   Brainf*ck   (self─censored)  language.                  */
newV2.=0                                             /*�*initialize the infinite  "tape".     */
p =0                                             /*�*the  "tape"  cell  pointer.          */
newV3 =0                                             /*�* !   is the instruction pointer (IP).*/
parse arg newV4                                      /*�*allow user to specify a BrainF*ck pgm*/
/*�* ┌──◄── No program? Then use default;*/
if newV4=''  then newV4=,                                /*�* ↓      it displays:  Hello, World!  */
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
/*�* [↑]   note the  Brainf*ck  comments.*/
do newV3=1  while  newV3\==0  &  newV3<=length(newV4)       /*�*keep executing  BF  as long as IP ¬ 0*/
parse var  newV4  newV1  x  +1                   /*�*obtain a  Brainf*ck instruction  (x),*/
/*�*···it's the same as  x=substr($,!,1) */
select                                    /*�*examine the current instruction.     */
when x=='+'  then newV2.p=newV2.p + 1             /*�*increment the   "tape" cell    by  1 */
when x=='-'  then newV2.p=newV2.p - 1             /*�*decrement  "       "     "      "  " */
when x=='>'  then   p=  p + 1             /*�*increment  "  instruction ptr   "  " */
when x=='<'  then   p=  p - 1             /*�*decrement  "       "       "    "  " */
when x=='['  then newV3= forward()            /*�*go  forward to   ]+1   if  @.P = 0.  */
when x==']'  then newV3=backward()            /*�* " backward  "   [+1    "   "  ¬ "   */
when x== .   then call charout , d2c(newV2.p) /*�*display a  "tape"  cell to terminal. */
when x==','  then do;  say 'input a value:';  parse pull newV2.p;  end
otherwise    iterate
end   /*�*select*/
end     /*�*forever*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
forward:  if newV2.p\==0  then return newV3;  c=1        /*�*C: ◄───  is the   [   nested counter.*/
do k=newV3+1  to length(newV4);        newV5=substr(newV4, k, 1)
if newV5=='['  then do; c=c+1;     iterate;                   end
if newV5==']'  then do; c=c-1;     if c==0  then leave;       end
end   /*�*k*/
return k
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
backward: if newV2.p==0   then return newV3;  c=1        /*�*C: ◄───  is the   ]   nested counter.*/
do k=newV3-1  to 1  by -1;         newV5=substr(newV4, k, 1)
if newV5==']'  then do; c=c+1;     iterate;                   end
if newV5=='['  then do; c=c-1;     if c==0  then return k+1;  end
end   /*�*k*/
return k
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Execute-Brain-\execute-brain-.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
