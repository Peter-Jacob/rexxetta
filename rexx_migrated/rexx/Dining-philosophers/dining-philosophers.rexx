/*ͺ*REXX program demonstrates a solution in solving the  dining philosophers problem.     */
signal on halt                                   /*ͺ*branches to  HALT:   (on Ctrlβbreak).*/
parse arg seed diners                            /*ͺ*obtain optional arguments from the CL*/
if datatype(seed, 'W')  then call random ,, seed /*ͺ*this allows for random repeatability.*/
if diners= ''           then diners = 'Aristotle, Kant, Spinoza, Marx, Russell'
tell= left(seed, 1) \== '+'                    /*ͺ*Leading + in SEED? Then no statistics*/
diners= space( translate(diners, , ',') )        /*ͺ*change to an uncommatized diners list*/
newV2= words(diners);      newV1.=   0              /*ͺ*#: the number of dining philosophers.*/
eatL= 15;               eatH=  60              /*ͺ*minimum & maximum minutes for eating.*/
thinkL= 30;             thinkH= 180              /*ͺ*   "    "    "       "     " thinking*/
forks.=  1                                       /*ͺ*indicate that all forks are on table.*/
do tic=1         /*ͺ*'til halted.*/    /*ͺ*use  "minutes"  for time advancement.*/
call grabForks                       /*ͺ*determine if anybody can grab 2 forks*/
call passTime                        /*ͺ*handle philosophers eating|thinking. */
end   /*ͺ*tic*/                        /*ͺ*     Β·Β·Β· and time marches on Β·Β·Β·     */
/*ͺ* [β]    this REXX program was halted,*/
halt: say '  Β·Β·Β· REXX program halted!'           /*ͺ*probably by CtrlβBreak or equivalent.*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
fork: parse arg x 1 ox;  x= abs(x) ;  L= x - 1 ;  if L==0  then L= newV2 /*ͺ*use "round Robin"*/
if ox<0  then do;  forks.L= 1;  forks.x=1;  return;  end       /*ͺ*drop the forks.  */
got2= forks.L  &  forks.x                                      /*ͺ*get 2 forks β not*/
if got2  then do;  forks.L= 0;  forks.x=0;           end       /*ͺ*obtained 2 forks */
return got2                                /*ͺ*return with success  Β·Β·Β· or failure. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
grabForks:   do person=1  for  newV2                 /*ͺ*see if any person can grab two forks.*/
if newV1.person.state\==0  then iterate /*ͺ*this diner ain't in a waiting state. */
if \fork(person)       then iterate /*ͺ*  "    "   didn't grab two forks.    */
newV1.person.state= 'eating'            /*ͺ*  "    "   is slurping spaghetti.    */
newV1.person.dur= random(eatL, eatH)    /*ͺ*how long will this diner eat pasta ? */
end   /*ͺ*person*/                    /*ͺ* [β]  process the dining philosophers*/
return                                 /*ͺ*all the diners have been examined.   */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
passTime: if tell  then say                      /*ͺ*display a handy blank line separator.*/
do p=1  for newV2                        /*ͺ*handle each of the diner's activity. */
if tell  then say  right(tic, 9, .)           right( word( diners, p), 20),
right(word(newV1.p.state 'waiting',1+(newV1.p.state==0)),9) right(newV1.p.dur,5)
if newV1.p.dur==0   then iterate         /*ͺ*this diner is waiting for two forks. */
newV1.p.dur= newV1.p.dur - 1                 /*ͺ*indicate single time unit has passed.*/
if newV1.p.dur\==0  then iterate         /*ͺ*Activity done?   No, then keep it up.*/
if newV1.p.state=='eating'  then do                      /*ͺ*now, leave the table.*/
call fork  -p           /*ͺ*drop the darn forks. */
newV1.p.state= 'thinking'                 /*ͺ*status.*/
newV1.p.dur= random(thinkL, thinkH)       /*ͺ*length.*/
end     /*ͺ* [β]  a diner goes   βββΊ  the table. */
else if  newV1.p.state=='thinking'  then newV1.p.state=0
end   /*ͺ*p*/                          /*ͺ*[β]  P (person)β‘ dining philosophers.*/
return                                 /*ͺ*now, have some human beans grab forks*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Dining-philosophers\dining-philosophers.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
