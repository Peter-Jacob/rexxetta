/*ช*REXX pgm scores  mastermind  game with a human  or  CBLFs (Carbon Based Life Forms).  */
parse arg let wid mxG oRep seed newV3                /*ช*obtain optional arguments from the CL*/
arg  .   .   .   rep .                     /*ช*get uppercase 4th argument  "   "  " */
if let=='' | let==","  then let= 20              /*ช*Not specified?  Then use the default.*/
if wid=='' | wid==","  then wid=  4              /*ช* "      "         "   "   "     "    */
if mxG=='' | mxG==","  then mxG= 20              /*ช* "      "         "   "   "     "    */
if rep=='' | rep==","  then rep=  0              /*ช* "      "         "   "   "     "    */
if datatype(seed,'W')  then call random ,,seed   /*ช*use a seed for random repeatability. */
if abbrev(  'REPEATSALLOWED',rep,3)  then rep=1  /*ช*allow an abbreviated option for REP. */
if abbrev('NOREPEATSALLOWED',rep,3)  then rep=0  /*ช*  "    "      "         "    "   "   */
call vet   arg(),     'args'                     /*ช*Vet the number of arguments entered. */  /*ช*โโ โ โ โ โ โ  optional vetting.*/
call vet     let,  'letters', 2, 20              /*ช* "   "     "    " letters in the code*/  /*ช*โโ โ โ โ โ โ  optional vetting.*/
call vet     wid,    'width', 4, 10              /*ช* "   "     "    " the width of code. */  /*ช*โโ โ โ โ โ โ  optional vetting.*/
call vet     mxG, 'maxGuess', 7, 20              /*ช* "   "     "    " maximum guesses.   */  /*ช*โโ โ โ โ โ โ  optional vetting.*/
call vet     rep,      'REP', 0, 1e8             /*ช* "   "   value if repeats are allowed*/  /*ช*โโ โ โ โ โ โ  optional vetting.*/
call gen;                                        yourG= 'Your guess must be exactly '
youve= "You've already tried that guess "
do prompt=0  by 0  until xx==wid;   say  /*ช*play until guessed or QUIT is entered*/
say id 'Please enter a guess with '   wid  ' letters                   [or Quit]:'
pull g;   g=space(g,0);  L=length(g);     if abbrev('QUIT',g,1)  then exit 0
if L\==wid  then do;  say id '***error***'  yourG wid  " letters.";  iterate;  end
call dups                                /*ช*look through the history log for dups*/
q=newV4;      XX=0;      OO=0;     try=try+1 /*ช*initialize some REXX vars;  bump TRY.*/

do j=1  for L;  if substr(g,j,1) \== substr(q,j,1)  then iterate    /*ช*hit? */
xx=xx+1;    q=overlay('โ', q, j)    /*ช*bump the  XX  correct   count.       */
end   /*ช*j*/                         /*ช* [โ]  XX  correct count; scrub guess.*/

do k=1  for L;   newV3=substr(g, k, 1)  /*ช*process the count for  "spots".      */
if pos(newV3, q)==0  then iterate       /*ช*is this  (spot)  letter in the code? */
oo=oo+1;       q=translate(q, , newV3)  /*ช*bump the  OO  spot count.            */
end   /*ช*k*/                         /*ช* [โ]  OO  spot count;  & scrub guess.*/
say
newV2.try=id  right('guess'  try, 11)     '  ('mxG       "is the max):"    g   'โโโบ' ,
copies('X', xx)copies("O", oo)copies('-', wid-xx-oo)
call hist
if try==mxG  then do;  say;      say id   "you've used the maximum guesses:"   mxG
say;      say id   "The code was: "   newV4;    say;     exit 1
end
end   /*ช*prompt*/
say;                           say "          โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ"
say "          โ                                         โ"
say "          โ  Congratulations, you've guessed it !!  โ"
say "          โ                                         โ"
say "          โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ"
exit 0                                           /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
dups:    do h=1  for try;  if g\=word(newV2.h, 8)  then iterate   /*ช*any duplicated guesses? */
say;  say id youve  " (guess number" h').'; iterate prompt; end  /*ช*h*/;    return
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
gen:  if rep==0  then reps= 'no'                 /*ช*create a literal for the prompt msg. */
else reps=
newV1= 'QWERTYUIOPASDFGHJKLZXCVBNM'         /*ช*capital letters used for random code.*/
id='โโโโโโโโ';  try=0;  LnewV1=length(newV1) /*ช*identifier in front of msg from here.*/
newV4=
do  until  length(newV4)==wid              /*ช*gen random codes 'til there's enough.*/
r=substr(newV1, random(1, LnewV1), 1)    /*ช*generate a random letter, 1 at a time*/
if \rep & pos(r, newV4)\==0  then iterate  /*ช*maybe  don't  allow a repeated digit.*/
newV4=newV4 || r; if newV4=='QUIT'&let==4  then newV4= /*ช*append random letter; ยทยทยท except this*/
end   /*ช*until*/                        /*ช* [โ]  builds a unique  N-letter code.*/
say
say id 'A random code of '   wid   "letters  (out of a possible "  let  ' letters) '
say id 'has been generated   (with'    reps    "repeats)."
return
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
hist:    do hist=1  for try;  say newV2.hist;  end;   return         /*ช*show "guess" history.*/
s:    if arg(1)==1  then return '';      return "s"              /*ช*a simpler pluraizer. */
ser:  say;  say;    say '***error***'   arg(1);     say;   say;         exit 13
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/  /*ช*โโ โ โ โ โ โ  optional vetting.*/
vet:  parse arg val,newV4,mn,mx                      /*ช*vet (validate) a specified argument. */  /*ช*โโ โ โ โ โ โ  optional vetting.*/
if newV4=="args" & (val>1 | newV3\='')  then call ser "Too many arguments specified. "  newV3     /*ช*โโ โ โ โ โ โ  optional vetting.*/
if newV4=="args"       then return                                                        /*ช*โโ โ โ โ โ โ  optional vetting.*/
if \datatype(val, 'N')          then call ser newV4 "isn't numeric: "               val   /*ช*โโ โ โ โ โ โ  optional vetting.*/
if \datatype(val, 'W')          then call ser newV4 "isn't an integer: "            val   /*ช*โโ โ โ โ โ โ  optional vetting.*/
if val < mn                     then call ser newV4 "has a value less than "        mn    /*ช*โโ โ โ โ โ โ  optional vetting.*/
if val > mx                     then call ser newV4 "has a value greater than "     mx    /*ช*โโ โ โ โ โ โ  optional vetting.*/
if newV4=='REP' & \datatype(val,W)  then call ser "Value for REPEATS isn't valid: " oRep  /*ช*โโ โ โ โ โ โ  optional vetting.*/
return 1
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Mastermind\mastermind.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
