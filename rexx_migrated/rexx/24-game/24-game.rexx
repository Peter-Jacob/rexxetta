/*�*REXX program helps the user find solutions to the game of  24.

╔═════════════════════════════════════════════════════════════════════════════╗
║ Argument is either of these forms:     (blank)                              ║⌂
║                                         ssss                                ║⌂
║                                         ssss,total,limit                    ║⌂
║                                         ssss-ffff                           ║⌂
║                                         ssss-ffff,total,limit               ║⌂
║                                        -ssss                                ║⌂
║                                        +ssss                                ║⌂
║                                                                             ║⌂
║ where   SSSS   and/or  FFFF  must be exactly four numerals (decimal digits) ║⌂
║ comprised soley of the numerals (digits)   1 ──► 9     (no zeroes).         ║⌂
║                                                                             ║⌂
║         SSSS   is the start,   and     FFFF    is the  end   (inclusive).   ║⌂
║                                                                             ║⌂
║ If  ssss  has a leading plus (+) sign,  it's used as the digits,  and       ║⌂
║ the user is prompted to enter a solution  (using those decimal digits).     ║⌂
║                                                                             ║⌂
║ If  ssss  has a leading minus (-) sign,  a solution is searched for and     ║⌂
║ the user is told there is a solution (or not),  but no solutions are shown).║⌂
║                                                                             ║⌂
║ If no argument is specified,  this program generates four digits (no zeros) ║⌂
║ which has at least one solution,  and shows the sorted digits to the user,  ║⌂
║ requesting that they enter a solution (the digits used may be in any order).║⌂
║                                                                             ║⌂
║ If   TOTAL   is entered,  it's the desired answer.     The default is  24.  ║⌂
║ If   LIMIT   is entered,  it limits the number of solutions shown.          ║⌂
║                                                                             ║⌂
║ A solution to be entered can be in the form of:                             ║
║                                                                             ║
║    digit1   operator   digit2   operator   digit3   operator  digit4        ║
║                                                                             ║
║ where    DIGITn     is one of the digits shown  (in any order),   and       ║
║          OPERATOR   can be any one of:     +   -   *   /                    ║
║                                                                             ║
║ Parentheses  ()  may be used in the normal manner for grouping,  as well as ║
║ brackets  []  or  braces  {}.       Blanks can be used anywhere.            ║
║                                                                             ║
║ I.E.:  for the digits   3448   the following could be entered:  3*8 + (4-4) ║
╚═════════════════════════════════════════════════════════════════════════════╝         */

numeric digits 30                                /*�*where rational arithmetic is needed. */
parse arg orig;              uargs= orig         /*�*get the  guess  from the command line*/
orig= space(orig, 0)                             /*�*remove all the blanks from  ORIG.    */
negatory=  left(orig, 1)=='-'                    /*�*=1, suppresses showing.              */
pository=  left(orig, 1)=='+'                    /*�*=1, force pgm to use specific number.*/
if pository | negatory  then orig=substr(orig,2) /*�*now, just use the absolute vaue.     */
parse var orig orig  ','   newV6  ","  limit         /*�*get optional total ($)  and/or  limit*/
parse var orig start '-' finish                  /*�*get start and finish  (maybe).       */
opers= '*'  ||  "/+-"                            /*�*arithmetic opers; order is important.*/
ops= length(opers)                               /*�*the number of arithmetic operators.  */
groupsym= space('  ( )   [ ]   { }   « »  ',  0) /*�*the allowable grouping symbols.      */
indent= left('', 30)                             /*�*indents the display of solutions.    */
show= 1                                          /*�*=1,  shows solutions  (a semifore).  */
digs= 123456789                                  /*�*numerals  (digits)  that can be used.*/
if newV6==''      then newV6= 24                         /*�*the name (goal) of the game:  (24)   */
if limit==''  then limit= 1                      /*�*=1,  shows only  one  solution.      */
newV1= copies('─', 8)                               /*�*used for output messages to the user.*/
abuttals = 0                                     /*�*=1,  allows digit abuttal:   12+12   */
do j=1  for ops;  o.j= substr(opers, j, 1) /*�*these are used for fast execution.   */
end  /*�*j*/
if \datatype(limit, 'N')   then do;  call ger  limit  "isn't numeric";   exit 13;    end
limit= limit / 1                                 /*�*normalize the number for limit.      */
if \datatype(newV6, 'N')       then do;  call ger    newV6    "isn't numeric";   exit 13;    end
newV6= newV6 / 1                                         /*�*normalize the number for total.      */
if start\=='' & \pository  then do;  call ranger start,finish;           exit 1;     end
show= 0                                          /*�*stop blabbing solutions in SOLVE.    */
do forever  while  \negatory       /*�*keep truckin' until a solution.      */
x.= 0                              /*�*way to hold unique expressions.      */
rrrr= random(1111, 9999)           /*�*get a random set of digits.          */
if pos(0, rrrr)\==0  then iterate  /*�*but don't the use of zeroes.         */
if solve(rrrr)\==0   then leave    /*�*try to solve for these digits.       */
end   /*�*forever*/
show= 1                                          /*�*enable SOLVE to show solutions.      */
if pository  then rrrr= start                    /*�*use what's specified.                */
rrrr= sortc(rrrr)                                /*�*sort four elements.                  */
rd.= x.
do j=1  for 9;    newV7= substr(rrrr, j, 1);         rd.newV7= #chrs(rrrr, newV7)
end   /*�*j*/                    /*�* [↑]  count for each digit in  RRRR. */
do guesses=1;                 say
say newV1   "Using the numerals (digits) "   rrrr", enter an expression that equals "   newV6
say right('(or  ?  or  Quit):', 79)
pull y;        uargs= y;      y= space(y, 0)   /*�*obtain user's response (expression). */
if abbrev('QUIT', y, 1)  then exit 0           /*�*does the user want to quit this game?*/
if y=='?'  then do j=2  for sourceline()-1;  newV7= sourceline(j)   /*�*get  a line of pgm. */
if right(newV7, 1)=='⌂'  then iterate               /*�*ignore this doc part*/
say '  '  strip( left(newV7, 79), 'T')              /*�*show "   "   " doc. */
if left(newV7, 1)=='╚'  then iterate guesses
end   /*�*j*/                    /*�* [↑]  use an in─line way to show help*/
newV2= verify(y, digs || opers || groupsym)       /*�*any illegal characters?              */
if newV2\==0  then do;   call ger 'invalid character:'  substr(y, newV2, 1);   iterate;    end
if   y=''  then do;   call validate y;   iterate;    end

do j=1  for length(y)-1  while \abuttals     /*�*check for two adjacent decimal digits*/
if datatype( substr(y, j, 1), 'W')   &   datatype( substr(y, j+1, 1), 'W')  then ,
do;  call ger 'invalid use of digit abuttal:'   substr(y, j, 2)
iterate guesses
end
end   /*�*j*/

yy= translate(y, ')))', "]}»")                 /*�*use a simlier form for the expression*/

do j=1  for 9  while \abuttals               /*�*check for a dig following a group sym*/
newV7= pos(')'j, yy)                             /*�*is there a string with:   )DIGIT   ? */
if newV7>0  then do;  call ger 'invalid use of digit abuttal' substr(y, newV7, 2)
iterate guesses
end
end   /*�*j*/

yd= #chrs(y, digs)                             /*�*count of legal digits  123456789     */
if yd<4  then do;  call ger 'not enough numerals were entered.';  iterate guesses;   end
if yd>4  then do;  call ger 'too many numerals were entered.'  ;  iterate guesses;   end

do j=1  for length(groupsym)  by 2
if #chrs(y, substr(groupsym, j  , 1))\==,
#chrs(y, substr(groupsym, j+1, 1))  then do;   call ger 'mismatched' ,
substr(groupsym, j, 2)
iterate guesses
end
end   /*�*j*/

do k=1  for 2                            /*�*check for     **     and     //      */
newV7= copies( substr( opers, k, 1), 2)      /*�*only examine the first two operators.*/
if pos(newV7, y)\==0  then do;  call ger 'illegal operator:' newV7;  iterate guesses;  end
end   /*�*k*/

do j=1  for 9;    if rd.j==0  then iterate;       newV3= #chrs(y, j)
if newV3==rd.j  then iterate
if newV3<rd.j   then call ger  'not enough'   j   "numerals were entered, must be"   rd.j
else call ger  'too many'     j   "numerals were entered, must be"   rd.j
iterate guesses
end   /*�*j*/

y= translate(y, '()()', "[]{}")                /*�*change extended grouping symbols──►()*/
interpret  'ans=('  y   ") / 1"                /*�*evalualte a normalized expression.   */
oldDigs= digits()                              /*�*save current decimal digit setting.  */
numeric digits digits()%2                      /*�*normalize expresssion to less digits.*/
if ans/1=newV6  then leave guesses                 /*�*the expression calculates to  24.    */
say newV1   "incorrect, "   y"="ans               /*�*issue an error message  (incorrect). */
numeric digits oldDigs                         /*�*re─instate the decimal digs precision*/
end   /*�*guesses*/

say;             say center('┌─────────────────────┐', 79)
say center('│                     │', 79)
say center('│  congratulations !  │', 79)
say center('│                     │', 79)
say center('└─────────────────────┘', 79);     say
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
#chrs:procedure; parse arg x,c;  return length(x) - length( space( translate(x, , c), 0) )
div:  procedure; parse arg q; if q=0  then q=1e9; return q  /*�*tests if dividing by zero.*/
ger:  say newV1 '***error*** for argument: '  uargs;   say newV1  arg(1);  errCode= 1;  return 0
s:    if arg(1)==1  then return arg(3);           return word( arg(2) 's', 1)
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
ranger: parse arg ssss,ffff                      /*�*parse args passed to this sub.       */
ffff= word(ffff ssss, 1)                 /*�*create a   FFFF   if necessary.      */
do g=ssss  to ffff                /*�*process possible range of values.    */
if pos(0, g)\==0  then iterate    /*�*ignore any   G   number with zeroes. */
sols= solve(g);  wols= sols
if sols==0  then wols= 'No'       /*�*un─geek number of solutions (if any).*/
if negatory & sols\==0  then wols= 'A'  /*�*found only the first solution? */
if sols==1  & limit==1  then wols= 'A'
say;            say wols   'solution's(sols)    "found for"    g
if newV6\==24  then say  'for answers that equal'    newV6
end   /*�*g*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
solve: parse arg qqqq; finds= 0;  x.=0;  nq.= x. /*�*parse args passed to this function.  */
if \validate(qqqq)  then return -1
parse value '( (( )) )'   with  L LL RR R /*�*assign some static variables (fastly)*/

do jq=1  for 4;  newV7= substr(qqqq,jq,1) /*�*count the   number   of each digit.  */
nq.newV7= nq.newV7 + 1
end   /*�*jq*/

gLO= 1111;  gHI= 9999
if newV6==24  then do;  gLO= 1118;  gHI= 9993;  end  /*�*24:  lowest poss.# that has solutions*/

do gggg=gLO  to gHI;  if pos(0, gggg)\==0  then iterate   /*�*ignore values with zeroes.*/
if verify(gggg, qqqq)\==0  then iterate
if verify(qqqq, gggg)\==0  then iterate
ng.= 0
do jg=1  for 4;  newV7= substr(gggg, jg, 1);       g.jg= newV7;            ng.newV7= ng.newV7 + 1
end   /*�*jg*/                            /*�* [↑]  count the number of each digit.*/
do kg=1  for 9;   if nq.kg\==ng.kg  then iterate gggg
end   /*�*kg*/           /*�* [↑]  verify number has same # digits*/
do       i=1  for ops                        /*�*insert operator after 1st numeral.   */
do     j=1  for ops                        /*�*  "        "      "   2nd    "       */
do   k=1  for ops                        /*�*  "        "      "   3rd    "       */
do m=0  for 10;       newV4.=              /*�*nullify all grouping symbols (parens)*/
select                               /*�*used to generate grouped expressions.*/
when m==1  then do; newV4.1=L;           newV4.3=R;                                end
when m==2  then do; newV4.1=L;                              newV4.5=R;             end
when m==3  then do; newV4.1=L;           newV4.3=R;   newV4.4=L;              newV4.6=R;   end
when m==4  then do;          newV4.2=L;                     newV4.5=R;             end
when m==5  then do;          newV4.2=L;                               newV4.6=R;   end
when m==6  then do; newV4.1=LL;                             newV4.5=R;    newV4.6=R;   end
when m==7  then do;          newV4.2=LL;                    newV4.5=R;    newV4.6=R;   end
when m==8  then do; newV4.1=L;   newV4.2=L;                               newV4.6=RR;  end
when m==9  then do;          newV4.2=L;           newV4.4=L;              newV4.6=RR;  end
otherwise  nop
end   /*�*select*/

e= space(newV4.1 g.1 o.i     newV4.2 g.2 newV4.3 o.j      newV4.4 g.3 newV4.5 o.k      g.4  newV4.6,  0)
if x.e  then iterate                   /*�*was the expression already used?     */
x.e= 1                                 /*�*mark this expression as being used.  */
origE= e                               /*�*keep original version for the display*/
pd= pos('/(', e)                       /*�*find pos of     /(      in  E.       */
if pd\==0  then do                     /*�*Found?  Might have possible ÷ by zero*/
eo= e
lr= lastpos(')', e)    /*�*find the last right parenthesis.     */
lm= pos('-', e, pd+1)  /*�*find a minus sign (-)    after  (    */
if lm>pd & lm<lr  then e= changestr('/(',e,"/div(")   /*�*change*/
if eo\==e then if x.e  then iterate /*�*expression already used?*/
x.e= 1                 /*�*mark this expression as being used.  */
end
interpret 'x=('   e   ") / 1"          /*�*have REXX do the heavy lifting here. */
if x\==newV6  then do                      /*�*Not correct?   Then try again.       */
numeric digits 9;    x= x / 1               /*�*re─do evaluation.*/
numeric digits 12                           /*�*re─instate digits*/
if x\==newV6  then iterate  /*�*Not correct?   Then try again.       */
end
finds= finds + 1                       /*�*bump number of found solutions.      */
if \show | negatory  then return finds
newV7= translate(origE, '][', ")(")                      /*�*display  [],  not  (). */
if show  then say indent   'a solution for'  gggg':'  newV6"="  newV7 /*�*show solution.*/
if limit==1 & finds==limit  then leave gggg                   /*�*leave big loop*/
end     /*�*m*/
end       /*�*k*/
end         /*�*j*/
end           /*�*i*/
end             /*�*gggg*/
return finds
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sortc: procedure;  arg nnnn;           newV5.=        /*�*sorts the digits of   NNNN          */
do i=1  for length(nnnn); newV7= substr(nnnn, i, 1);   newV5.newV7= newV5.newV7||newV7;   end  /*�*i*/
return newV5.0 || newV5.1 || newV5.2 || newV5.3 || newV5.4 || newV5.5 || newV5.6 || newV5.7 || newV5.8 || newV5.9
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
validate: parse arg y;               errCode= 0;                       newV2= verify(y, digs)
select
when y==''         then call ger 'no digits were entered.'
when length(y)<4   then call ger 'not enough digits entered, must be 4'
when length(y)>4   then call ger 'too many digits entered, must be 4'
when pos(0,y)\==0  then call ger "can't use the digit  0 (zero)"
when newV2\==0        then call ger 'illegal character:'  substr(y, newV2, 1)
otherwise          nop
end   /*�*select*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\24-game\24-game.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
