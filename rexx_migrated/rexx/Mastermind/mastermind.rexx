/*�*REXX pgm scores  mastermind  game with a human  or  CBLFs (Carbon Based Life Forms).  */
parse arg let wid mxG oRep seed newV3                /*�*obtain optional arguments from the CL*/
arg  .   .   .   rep .                     /*�*get uppercase 4th argument  "   "  " */
if let=='' | let==","  then let= 20              /*�*Not specified?  Then use the default.*/
if wid=='' | wid==","  then wid=  4              /*�* "      "         "   "   "     "    */
if mxG=='' | mxG==","  then mxG= 20              /*�* "      "         "   "   "     "    */
if rep=='' | rep==","  then rep=  0              /*�* "      "         "   "   "     "    */
if datatype(seed,'W')  then call random ,,seed   /*�*use a seed for random repeatability. */
if abbrev(  'REPEATSALLOWED',rep,3)  then rep=1  /*�*allow an abbreviated option for REP. */
if abbrev('NOREPEATSALLOWED',rep,3)  then rep=0  /*�*  "    "      "         "    "   "   */
call vet   arg(),     'args'                     /*�*Vet the number of arguments entered. */  /*�*◄■■■■■■ optional vetting.*/
call vet     let,  'letters', 2, 20              /*�* "   "     "    " letters in the code*/  /*�*◄■■■■■■ optional vetting.*/
call vet     wid,    'width', 4, 10              /*�* "   "     "    " the width of code. */  /*�*◄■■■■■■ optional vetting.*/
call vet     mxG, 'maxGuess', 7, 20              /*�* "   "     "    " maximum guesses.   */  /*�*◄■■■■■■ optional vetting.*/
call vet     rep,      'REP', 0, 1e8             /*�* "   "   value if repeats are allowed*/  /*�*◄■■■■■■ optional vetting.*/
call gen;                                        yourG= 'Your guess must be exactly '
youve= "You've already tried that guess "
do prompt=0  by 0  until xx==wid;   say  /*�*play until guessed or QUIT is entered*/
say id 'Please enter a guess with '   wid  ' letters                   [or Quit]:'
pull g;   g=space(g,0);  L=length(g);     if abbrev('QUIT',g,1)  then exit 0
if L\==wid  then do;  say id '***error***'  yourG wid  " letters.";  iterate;  end
call dups                                /*�*look through the history log for dups*/
q=newV4;      XX=0;      OO=0;     try=try+1 /*�*initialize some REXX vars;  bump TRY.*/

do j=1  for L;  if substr(g,j,1) \== substr(q,j,1)  then iterate    /*�*hit? */
xx=xx+1;    q=overlay('▒', q, j)    /*�*bump the  XX  correct   count.       */
end   /*�*j*/                         /*�* [↑]  XX  correct count; scrub guess.*/

do k=1  for L;   newV3=substr(g, k, 1)  /*�*process the count for  "spots".      */
if pos(newV3, q)==0  then iterate       /*�*is this  (spot)  letter in the code? */
oo=oo+1;       q=translate(q, , newV3)  /*�*bump the  OO  spot count.            */
end   /*�*k*/                         /*�* [↑]  OO  spot count;  & scrub guess.*/
say
newV2.try=id  right('guess'  try, 11)     '  ('mxG       "is the max):"    g   '──►' ,
copies('X', xx)copies("O", oo)copies('-', wid-xx-oo)
call hist
if try==mxG  then do;  say;      say id   "you've used the maximum guesses:"   mxG
say;      say id   "The code was: "   newV4;    say;     exit 1
end
end   /*�*prompt*/
say;                           say "          ┌─────────────────────────────────────────┐"
say "          │                                         │"
say "          │  Congratulations, you've guessed it !!  │"
say "          │                                         │"
say "          └─────────────────────────────────────────┘"
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
dups:    do h=1  for try;  if g\=word(newV2.h, 8)  then iterate   /*�*any duplicated guesses? */
say;  say id youve  " (guess number" h').'; iterate prompt; end  /*�*h*/;    return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gen:  if rep==0  then reps= 'no'                 /*�*create a literal for the prompt msg. */
else reps=
newV1= 'QWERTYUIOPASDFGHJKLZXCVBNM'         /*�*capital letters used for random code.*/
id='────────';  try=0;  LnewV1=length(newV1) /*�*identifier in front of msg from here.*/
newV4=
do  until  length(newV4)==wid              /*�*gen random codes 'til there's enough.*/
r=substr(newV1, random(1, LnewV1), 1)    /*�*generate a random letter, 1 at a time*/
if \rep & pos(r, newV4)\==0  then iterate  /*�*maybe  don't  allow a repeated digit.*/
newV4=newV4 || r; if newV4=='QUIT'&let==4  then newV4= /*�*append random letter; ··· except this*/
end   /*�*until*/                        /*�* [↑]  builds a unique  N-letter code.*/
say
say id 'A random code of '   wid   "letters  (out of a possible "  let  ' letters) '
say id 'has been generated   (with'    reps    "repeats)."
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hist:    do hist=1  for try;  say newV2.hist;  end;   return         /*�*show "guess" history.*/
s:    if arg(1)==1  then return '';      return "s"              /*�*a simpler pluraizer. */
ser:  say;  say;    say '***error***'   arg(1);     say;   say;         exit 13
/*�*──────────────────────────────────────────────────────────────────────────────────────*/  /*�*◄■■■■■■ optional vetting.*/
vet:  parse arg val,newV4,mn,mx                      /*�*vet (validate) a specified argument. */  /*�*◄■■■■■■ optional vetting.*/
if newV4=="args" & (val>1 | newV3\='')  then call ser "Too many arguments specified. "  newV3     /*�*◄■■■■■■ optional vetting.*/
if newV4=="args"       then return                                                        /*�*◄■■■■■■ optional vetting.*/
if \datatype(val, 'N')          then call ser newV4 "isn't numeric: "               val   /*�*◄■■■■■■ optional vetting.*/
if \datatype(val, 'W')          then call ser newV4 "isn't an integer: "            val   /*�*◄■■■■■■ optional vetting.*/
if val < mn                     then call ser newV4 "has a value less than "        mn    /*�*◄■■■■■■ optional vetting.*/
if val > mx                     then call ser newV4 "has a value greater than "     mx    /*�*◄■■■■■■ optional vetting.*/
if newV4=='REP' & \datatype(val,W)  then call ser "Value for REPEATS isn't valid: " oRep  /*�*◄■■■■■■ optional vetting.*/
return 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Mastermind\mastermind.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
