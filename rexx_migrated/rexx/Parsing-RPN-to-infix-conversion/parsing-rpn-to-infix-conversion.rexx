/*�*REXX program  converts  Reverse Polish Notation  (RPN)    ───►    an infix notation.  */
showAction = 1                                   /*�*  0  if no   showActions   wanted.   */
newV2 = 0                                   /*�*initialize stack pointer to 0 (zero).*/
oS = '+ - / * ^'                         /*�*the operator symbols.                */
oP = '2 2 3 3 4'                         /*�*the operator priorities.             */
oA = '◄ ◄ ◄ ◄ ►'                         /*�*the operator associations.           */
say  "infix: "   toInfix( "3 4 2 * 1 5 - 2 3 ^ ^ / +" )
say  "infix: "   toInfix( "1 2 + 3 4 + ^ 5 6 + ^" )     /*�* [↓]  Sprechen Sie Deutsch?   */
say  "infix: "   toInfix( "Mond Sterne Schlamm + * Feur Suppe * ^" )
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
pop:       pop= newV2;                 newV2= newV2 - 1;                     return newV1.pop
push:      newV2= newV2 + 1;               newV1.newV2= arg(1);                  return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
stack2str: newV4=;             do j=1  for newV2;          newV3 = newV1.j;      y= left(newV3, 1)
if pos(' ', newV3)==0  then newV3 = '{'strip( substr(newV3, 2) )"}"
else newV3 =           substr(newV3, 2)
newV4=newV4  '{'strip(y newV3)"}"
end   /*�*j*/
return space(newV4)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
toInfix:   parse arg rpn;   say copies('─', 80 - 1);             say 'RPN: '  space(rpn)

do N=1  for words(RPN)                  /*�*process each of the RPN tokens.*/
newV5= word(RPN, N)                         /*�*obtain next item in the list.  */
if pos(newV5,oS)==0  then call push '¥' newV5   /*�*when in doubt, add a Yen to it.*/
else do;   g= pop();    gp= left(g, 1);    g= substr(g, 2)
h= pop();    hp= left(h, 1);    h= substr(h, 2)
tp= substr(oP, pos(newV5, oS),  1)
ta= substr(oA, pos(newV5, oS),  1)
if hp<tp  |  (hp==tp & ta=='►')  then h= "("h")"
if gp<tp  |  (gp==tp & ta=='◄')  then g= "("g")"
call  push   tp  ||  h  newV5  g
end
if showAction  then say   right(newV5, 25)    "──►"    stack2str()
end   /*�*N*/

return space( substr( pop(), 2) )
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Parsing-RPN-to-infix-conversion\parsing-rpn-to-infix-conversion.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
