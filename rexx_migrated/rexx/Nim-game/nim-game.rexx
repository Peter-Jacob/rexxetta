/*�*REXX program plays the NIM game with a human opponent; the pot size can be specified. */
parse arg pot newV2 . 1 newV1                           /*�*obtain optional argument from the CL.*/
if pot=='' | pot==","  then pot= 12              /*�*Not specified?  Then use the default.*/
if newV2\==''       then do; call ser "Too many arguments entered: "    newV1;     exit 13;   end
if \isNum(pot)  then do; call ser "argument isn't numeric: "       pot;     exit 13;   end
if \isInt(pot)  then do; call ser "argument isn't an integer: "    pot;     exit 13;   end
if pot<4        then do; call ser "The pot number is too small: "  pot;     exit 13;   end
if pot>100      then do; call ser "The pot number is too large: "  pot;     exit 13;   end
pad= copies('─', 8)                              /*�*literal used as an eyecatcher in msgs*/
pot= pot/1                                       /*�*normalize the pot  (number).         */
t= pot//4
if pot>12 & t\==0  then do;        say pad 'The computer takes '      t      " token"s(t).
pot= pot - t
end

do forever;   call show pot
do  until ok;                   ok= 1;              say
say pad "How many tokens do you want to take away  (1, 2, or 3)    (or QUIT)?"
parse pull t newV2 . 1 q 1 newV1;      upper q;            say
if abbrev('QUIT',q,1)  then do;  say pad 'Quitting.';         exit 1;      end
if t=''                then call ser "No arguments entered."
if newV2\==''              then call ser "Too many arguments entered: "        newV1
if \isNum(t)           then call ser "Argument isn't numeric: "             t
if \isInt(t)           then call ser "Argument isn't an integer: "          t
if t<1                 then call ser "Argument can't be less than 1: "      t
if t>3                 then call ser "Argument can't be greater than 3: "   t
end   /*�*while*/
t= t/1                                      /*�*Normalize the number:  001   2.  +3  */
newV3= max(1, 4-t)                              /*�*calculate the computer's take─away.  */
say pad 'The computer takes '    newV3    " token"s(newV3).
pot= pot - t - newV3                            /*�*calculate the number of tokens in pot*/
if pot==0  then do;   say pad 'No tokens left.'       /*�*No tokens left in the pot? */
say pad "The computer wins!"    /*�*Display a braggart message.*/
exit                            /*�*exit this computer program.*/
end
end   /*�*forever*/                           /*�*keep looping until there's a winner. */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
isNum: return datatype( arg(1), 'N')             /*�*verify that the arg is a  number.    */
isInt: return datatype( arg(1), 'W')             /*�*   "     "   "   "   " an integer.   */
show:  say;  say pad "Tokens remaining: "  arg(1)' ' pad;  say;  return
s:     if arg(1)==1  then return arg(3);                         return word(arg(2) 's',1)
ser:   if ok  then say pad '***error***' arg(1);       ok= 0;    return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Nim-game\nim-game.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
