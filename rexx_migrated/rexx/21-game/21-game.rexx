/*ͺ*REXX program plays the  21  game with a human,  each player chooses 1, 2, or 3  which */
/*ͺ*ββββββββββββ is added to the current sum, the first player to reach  21  exactly wins.*/
sep= copies('β', 8);  sep2= " "copies('β', 8)" " /*ͺ*construct an eyeβcatching msg fences.*/
say sep  'Playing the  21  game.'                /*ͺ*tell what's happening here at the zoo*/
newV1=0;                       goal= 21              /*ͺ*the sum [or running total]  (so far).*/
do j=1  while newV1<goal;  call g                /*ͺ*obtain the user's number via a prompt*/
if x\==0    then call tot x, 1               /*ͺ*Not 0?   The user wants to go first. */
if newV1==goal  then leave                       /*ͺ*the user won the game with the last #*/
call ?;     if y==.  then y= random(1, 3)    /*ͺ*get computer's choice  or  a random #*/
say sep 'The computer chooses '     y     " as its choice."         /*ͺ*inform player.*/
call tot y, 0                                /*ͺ*call subroutine to show the total.   */
end   /*ͺ*j*/
say
if who  then say sep  'Congratulations!   You have won the  21  game.'
else say sep  'The computer has won the  21  game.'
exit 0                                           /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
?:   y=.;   do c=1  for 3  until y\==.;  if (c+newV1) // 4 == 1  then y= c;    end;     return
ser: if bad  then return;  bad=1;  say;  say;  say sep '***error***' arg(1);  say;  return
tot: arg q,who; newV1=newV1+q; say sep 'The game total is now' sep2 newV1 sep2; /*ͺ*add; show $*/ return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
g: low = (j \== 1)                               /*ͺ*allow user to have computer go first.*/
do until \bad;   bad= 0;     say            /*ͺ*prompt 'til user gives a good number.*/
say sep  'Please enter a number from ' low " ββββΊ 3               (or Quit):"
if j=1  then say sep '[A value of 0 (zero) means you want the computer to go first.]'
parse pull x newV2 . 1 ox;   upper x            /*ͺ*obtain user's lowercase response(s). */
if   x=''             then call ser "Nothing entered."
if newV2\==''             then call ser "Too many arguments entered: "       ox
if abbrev('QUIT', x, 1)  then do;   say;      say sep  "quitting.";      exit 1;  end
if \datatype(x, 'N')  then call ser "Argument isn't numeric: "           ox
if \datatype(x, 'W')  then call ser "Number isn't an integer: "          ox
if x<0                then call ser "Number can't be negative: "          x
if x=0  &  j>1        then call ser "Number can't be zero: "              x
if x>3                then call ser "Number is too large  (>3): "         x
if bad                then iterate          /*ͺ*Had an error? Then get another number*/
x= x/1; if newV1+x>goal   then call ser "Number will cause the sum to exceed " goal': ' x
end   /*ͺ*until*/;           return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\21-game\21-game.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
