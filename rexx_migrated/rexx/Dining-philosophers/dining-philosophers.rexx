/*�*REXX program demonstrates a solution in solving the  dining philosophers problem.     */
signal on halt                                   /*�*branches to  HALT:   (on Ctrl─break).*/
parse arg seed diners                            /*�*obtain optional arguments from the CL*/
if datatype(seed, 'W')  then call random ,, seed /*�*this allows for random repeatability.*/
if diners= ''           then diners = 'Aristotle, Kant, Spinoza, Marx, Russell'
tell= left(seed, 1) \== '+'                    /*�*Leading + in SEED? Then no statistics*/
diners= space( translate(diners, , ',') )        /*�*change to an uncommatized diners list*/
newV2= words(diners);      newV1.=   0              /*�*#: the number of dining philosophers.*/
eatL= 15;               eatH=  60              /*�*minimum & maximum minutes for eating.*/
thinkL= 30;             thinkH= 180              /*�*   "    "    "       "     " thinking*/
forks.=  1                                       /*�*indicate that all forks are on table.*/
do tic=1         /*�*'til halted.*/    /*�*use  "minutes"  for time advancement.*/
call grabForks                       /*�*determine if anybody can grab 2 forks*/
call passTime                        /*�*handle philosophers eating|thinking. */
end   /*�*tic*/                        /*�*     ··· and time marches on ···     */
/*�* [↓]    this REXX program was halted,*/
halt: say '  ··· REXX program halted!'           /*�*probably by Ctrl─Break or equivalent.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
fork: parse arg x 1 ox;  x= abs(x) ;  L= x - 1 ;  if L==0  then L= newV2 /*�*use "round Robin"*/
if ox<0  then do;  forks.L= 1;  forks.x=1;  return;  end       /*�*drop the forks.  */
got2= forks.L  &  forks.x                                      /*�*get 2 forks │ not*/
if got2  then do;  forks.L= 0;  forks.x=0;           end       /*�*obtained 2 forks */
return got2                                /*�*return with success  ··· or failure. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
grabForks:   do person=1  for  newV2                 /*�*see if any person can grab two forks.*/
if newV1.person.state\==0  then iterate /*�*this diner ain't in a waiting state. */
if \fork(person)       then iterate /*�*  "    "   didn't grab two forks.    */
newV1.person.state= 'eating'            /*�*  "    "   is slurping spaghetti.    */
newV1.person.dur= random(eatL, eatH)    /*�*how long will this diner eat pasta ? */
end   /*�*person*/                    /*�* [↑]  process the dining philosophers*/
return                                 /*�*all the diners have been examined.   */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
passTime: if tell  then say                      /*�*display a handy blank line separator.*/
do p=1  for newV2                        /*�*handle each of the diner's activity. */
if tell  then say  right(tic, 9, .)           right( word( diners, p), 20),
right(word(newV1.p.state 'waiting',1+(newV1.p.state==0)),9) right(newV1.p.dur,5)
if newV1.p.dur==0   then iterate         /*�*this diner is waiting for two forks. */
newV1.p.dur= newV1.p.dur - 1                 /*�*indicate single time unit has passed.*/
if newV1.p.dur\==0  then iterate         /*�*Activity done?   No, then keep it up.*/
if newV1.p.state=='eating'  then do                      /*�*now, leave the table.*/
call fork  -p           /*�*drop the darn forks. */
newV1.p.state= 'thinking'                 /*�*status.*/
newV1.p.dur= random(thinkL, thinkH)       /*�*length.*/
end     /*�* [↓]  a diner goes   ──►  the table. */
else if  newV1.p.state=='thinking'  then newV1.p.state=0
end   /*�*p*/                          /*�*[↑]  P (person)≡ dining philosophers.*/
return                                 /*�*now, have some human beans grab forks*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Dining-philosophers\dining-philosophers.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
