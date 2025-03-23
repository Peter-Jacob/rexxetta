/*�*REXX program plays/simulates  Penney's Game,  a  two─player  coin toss sequence game. */
newV3= copies('─', 9)                               /*�*literal for eye─catching fence.      */
signal on halt                                   /*�*a clean way out if  CLBF  quits.     */
parse arg newV5 seed .                               /*�*obtain optional arguments from the CL*/
if newV5==''  | newV5==","     then newV5= 3                 /*�*Not specified?  Then use the default.*/
if datatype(seed,'W')  then call random ,,seed   /*�*use seed for RANDOM #s repeatability.*/
wins=0;    do games=1                            /*�*simulate a number of Penney's games. */
call game                             /*�*simulate a single inning of a game.  */
end   /*�*games*/                       /*�*keep at it until  QUIT  or  halt.    */
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
halt:  say;   say newV3  "Penney's Game was halted.";   say;   exit 13
r:     arg ,newV6;       do  arg(1);    newV6=newV6 || random(100, 9991) // 2;   end;         return newV6
s:     if arg(1)==1  then return arg(3);   return word(arg(2) 's',1)       /*�*pluralizer.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
game:  newV4.=;  tosses=newV4.                                 /*�*the coin toss sequence so far. */
toss1= r(1)                                     /*�*result:   0=computer,   1=CBLF.*/
if \toss1  then call randComp                   /*�*maybe let the computer go first*/
if  toss1  then say newV3 "You win the first toss, so you pick your sequence first."
else say newV3 "The computer won first toss, the pick was: "    newV4.comp
call prompter                   /*�*get the human's guess from C.L.*/
call randComp                   /*�*get computer's guess if needed.*/
/*�*CBLF:  carbon-based life form. */
say newV3  "      your pick:"  newV4.CBLF              /*�*echo human's pick to terminal. */
say newV3  "computer's pick:"  newV4.comp              /*�*  "  comp.'s   "   "     "     */
say                                             /*�* [↓]  flip the coin 'til a win.*/
do  flips=1  until pos(newV4.CBLF, tosses)\==0   |   pos(newV4.comp, tosses)\==0
tosses= tosses || translate( r(1), 'HT', 10)
end   /*�*flips*/                           /*�* [↑]   this is a flipping coin,*/
/*�* [↓] series of tosses*/
say newV3 "The tossed coin series was: "   tosses
say
newV2="won this toss with "   flips   ' coin tosses.'
if pos(newV4.CBLF,tosses)\==0  then do;  say newV3  "You"  newV2;  wins=wins+1;  end
else      say newV3  "The computer"  newV2
newV7=wins;  if newV7==0  then newV7='no'
say newV3 "You've won"  newV7  "game"s(wins)  'out of ' games"."
say;  say copies('╩╦', 79 % 2)'╩';   say
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
prompter: oops= newV3 'Oops!  ';            a=            /*�*define some handy REXX literals*/
newV1= 'ABCDEFG-IJKLMNOPQRS+UVWXYZ'           /*�*the extraneous alphabetic chars*/
p=newV3 'Pick a sequence of'  newV5  "coin tosses of  H or T (Heads or Tails) or Quit:"
do  until  ok;   say;  say p;  pull a     /*�*uppercase the answer.          */
if abbrev('QUIT', a, 1)  then exit 1      /*�*the human wants to  quit.      */
a= space( translate(a,,newV1',./\;:_'), 0) /*�*elide extraneous characters.   */
b= translate(a, 10, 'HT');   L= length(a) /*�*translate ───► bin; get length.*/
ok= 0                                     /*�*the response is  OK  (so far). */
select                                /*�*verify the user response.      */
when \datatype(b, 'B')  then say oops "Illegal response."
when \datatype(a, 'M')  then say oops "Illegal characters in response."
when L==0               then say oops "No choice was given."
when L<newV5                then say oops "Not enough coin choices."
when L>newV5                then say oops "Too many coin choices."
when a==newV4.comp          then say oops "You can't choose the computer's" ,
"choice: "    newV4.comp
otherwise          ok= 1
end   /*�*select*/
end       /*�*until ok*/
newV4.CBLF= a;           newV4.CBLF!= b              /*�*we have the human's guess now. */
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
randComp: if newV4.comp\==''  then return                  /*�*the computer already has a pick*/
newV7= newV4.CBLF!                                   /*�* [↓] use best-choice algorithm.*/
if newV7\==''  then g= left((\substr(newV7, min(2, newV5), 1))left(newV7, 1)substr(newV7, 3), newV5)
do  until g\==newV4.CBLF!;   g= r(newV5);   end    /*�*otherwise, generate a choice.  */
newV4.comp= translate(g, 'HT', 10)
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Penneys-game\penneys-game.rexx was migrated on 23 Mar 2025 at 10:43:24
 * -------------------------------------------------------------------------
*/ 
