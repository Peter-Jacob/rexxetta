/*ͺ*REXX program helps the user find solutions to the game of  24.

βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ
β Argument is either of these forms:     (blank)                              ββ
β                                         ssss                                ββ
β                                         ssss,total,limit                    ββ
β                                         ssss-ffff                           ββ
β                                         ssss-ffff,total,limit               ββ
β                                        -ssss                                ββ
β                                        +ssss                                ββ
β                                                                             ββ
β where   SSSS   and/or  FFFF  must be exactly four numerals (decimal digits) ββ
β comprised soley of the numerals (digits)   1 βββΊ 9     (no zeroes).         ββ
β                                                                             ββ
β         SSSS   is the start,   and     FFFF    is the  end   (inclusive).   ββ
β                                                                             ββ
β If  ssss  has a leading plus (+) sign,  it's used as the digits,  and       ββ
β the user is prompted to enter a solution  (using those decimal digits).     ββ
β                                                                             ββ
β If  ssss  has a leading minus (-) sign,  a solution is searched for and     ββ
β the user is told there is a solution (or not),  but no solutions are shown).ββ
β                                                                             ββ
β If no argument is specified,  this program generates four digits (no zeros) ββ
β which has at least one solution,  and shows the sorted digits to the user,  ββ
β requesting that they enter a solution (the digits used may be in any order).ββ
β                                                                             ββ
β If   TOTAL   is entered,  it's the desired answer.     The default is  24.  ββ
β If   LIMIT   is entered,  it limits the number of solutions shown.          ββ
β                                                                             ββ
β A solution to be entered can be in the form of:                             β
β                                                                             β
β    digit1   operator   digit2   operator   digit3   operator  digit4        β
β                                                                             β
β where    DIGITn     is one of the digits shown  (in any order),   and       β
β          OPERATOR   can be any one of:     +   -   *   /                    β
β                                                                             β
β Parentheses  ()  may be used in the normal manner for grouping,  as well as β
β brackets  []  or  braces  {}.       Blanks can be used anywhere.            β
β                                                                             β
β I.E.:  for the digits   3448   the following could be entered:  3*8 + (4-4) β
βββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ         */

numeric digits 30                                /*ͺ*where rational arithmetic is needed. */
parse arg orig;              uargs= orig         /*ͺ*get the  guess  from the command line*/
orig= space(orig, 0)                             /*ͺ*remove all the blanks from  ORIG.    */
negatory=  left(orig, 1)=='-'                    /*ͺ*=1, suppresses showing.              */
pository=  left(orig, 1)=='+'                    /*ͺ*=1, force pgm to use specific number.*/
if pository | negatory  then orig=substr(orig,2) /*ͺ*now, just use the absolute vaue.     */
parse var orig orig  ','   newV6  ","  limit         /*ͺ*get optional total ($)  and/or  limit*/
parse var orig start '-' finish                  /*ͺ*get start and finish  (maybe).       */
opers= '*'  ||  "/+-"                            /*ͺ*arithmetic opers; order is important.*/
ops= length(opers)                               /*ͺ*the number of arithmetic operators.  */
groupsym= space('  ( )   [ ]   { }   Β« Β»  ',  0) /*ͺ*the allowable grouping symbols.      */
indent= left('', 30)                             /*ͺ*indents the display of solutions.    */
show= 1                                          /*ͺ*=1,  shows solutions  (a semifore).  */
digs= 123456789                                  /*ͺ*numerals  (digits)  that can be used.*/
if newV6==''      then newV6= 24                         /*ͺ*the name (goal) of the game:  (24)   */
if limit==''  then limit= 1                      /*ͺ*=1,  shows only  one  solution.      */
newV1= copies('β', 8)                               /*ͺ*used for output messages to the user.*/
abuttals = 0                                     /*ͺ*=1,  allows digit abuttal:   12+12   */
do j=1  for ops;  o.j= substr(opers, j, 1) /*ͺ*these are used for fast execution.   */
end  /*ͺ*j*/
if \datatype(limit, 'N')   then do;  call ger  limit  "isn't numeric";   exit 13;    end
limit= limit / 1                                 /*ͺ*normalize the number for limit.      */
if \datatype(newV6, 'N')       then do;  call ger    newV6    "isn't numeric";   exit 13;    end
newV6= newV6 / 1                                         /*ͺ*normalize the number for total.      */
if start\=='' & \pository  then do;  call ranger start,finish;           exit 1;     end
show= 0                                          /*ͺ*stop blabbing solutions in SOLVE.    */
do forever  while  \negatory       /*ͺ*keep truckin' until a solution.      */
x.= 0                              /*ͺ*way to hold unique expressions.      */
rrrr= random(1111, 9999)           /*ͺ*get a random set of digits.          */
if pos(0, rrrr)\==0  then iterate  /*ͺ*but don't the use of zeroes.         */
if solve(rrrr)\==0   then leave    /*ͺ*try to solve for these digits.       */
end   /*ͺ*forever*/
show= 1                                          /*ͺ*enable SOLVE to show solutions.      */
if pository  then rrrr= start                    /*ͺ*use what's specified.                */
rrrr= sortc(rrrr)                                /*ͺ*sort four elements.                  */
rd.= x.
do j=1  for 9;    newV7= substr(rrrr, j, 1);         rd.newV7= #chrs(rrrr, newV7)
end   /*ͺ*j*/                    /*ͺ* [β]  count for each digit in  RRRR. */
do guesses=1;                 say
say newV1   "Using the numerals (digits) "   rrrr", enter an expression that equals "   newV6
say right('(or  ?  or  Quit):', 79)
pull y;        uargs= y;      y= space(y, 0)   /*ͺ*obtain user's response (expression). */
if abbrev('QUIT', y, 1)  then exit 0           /*ͺ*does the user want to quit this game?*/
if y=='?'  then do j=2  for sourceline()-1;  newV7= sourceline(j)   /*ͺ*get  a line of pgm. */
if right(newV7, 1)=='β'  then iterate               /*ͺ*ignore this doc part*/
say '  '  strip( left(newV7, 79), 'T')              /*ͺ*show "   "   " doc. */
if left(newV7, 1)=='β'  then iterate guesses
end   /*ͺ*j*/                    /*ͺ* [β]  use an inβline way to show help*/
newV2= verify(y, digs || opers || groupsym)       /*ͺ*any illegal characters?              */
if newV2\==0  then do;   call ger 'invalid character:'  substr(y, newV2, 1);   iterate;    end
if   y=''  then do;   call validate y;   iterate;    end

do j=1  for length(y)-1  while \abuttals     /*ͺ*check for two adjacent decimal digits*/
if datatype( substr(y, j, 1), 'W')   &   datatype( substr(y, j+1, 1), 'W')  then ,
do;  call ger 'invalid use of digit abuttal:'   substr(y, j, 2)
iterate guesses
end
end   /*ͺ*j*/

yy= translate(y, ')))', "]}Β»")                 /*ͺ*use a simlier form for the expression*/

do j=1  for 9  while \abuttals               /*ͺ*check for a dig following a group sym*/
newV7= pos(')'j, yy)                             /*ͺ*is there a string with:   )DIGIT   ? */
if newV7>0  then do;  call ger 'invalid use of digit abuttal' substr(y, newV7, 2)
iterate guesses
end
end   /*ͺ*j*/

yd= #chrs(y, digs)                             /*ͺ*count of legal digits  123456789     */
if yd<4  then do;  call ger 'not enough numerals were entered.';  iterate guesses;   end
if yd>4  then do;  call ger 'too many numerals were entered.'  ;  iterate guesses;   end

do j=1  for length(groupsym)  by 2
if #chrs(y, substr(groupsym, j  , 1))\==,
#chrs(y, substr(groupsym, j+1, 1))  then do;   call ger 'mismatched' ,
substr(groupsym, j, 2)
iterate guesses
end
end   /*ͺ*j*/

do k=1  for 2                            /*ͺ*check for     **     and     //      */
newV7= copies( substr( opers, k, 1), 2)      /*ͺ*only examine the first two operators.*/
if pos(newV7, y)\==0  then do;  call ger 'illegal operator:' newV7;  iterate guesses;  end
end   /*ͺ*k*/

do j=1  for 9;    if rd.j==0  then iterate;       newV3= #chrs(y, j)
if newV3==rd.j  then iterate
if newV3<rd.j   then call ger  'not enough'   j   "numerals were entered, must be"   rd.j
else call ger  'too many'     j   "numerals were entered, must be"   rd.j
iterate guesses
end   /*ͺ*j*/

y= translate(y, '()()', "[]{}")                /*ͺ*change extended grouping symbolsβββΊ()*/
interpret  'ans=('  y   ") / 1"                /*ͺ*evalualte a normalized expression.   */
oldDigs= digits()                              /*ͺ*save current decimal digit setting.  */
numeric digits digits()%2                      /*ͺ*normalize expresssion to less digits.*/
if ans/1=newV6  then leave guesses                 /*ͺ*the expression calculates to  24.    */
say newV1   "incorrect, "   y"="ans               /*ͺ*issue an error message  (incorrect). */
numeric digits oldDigs                         /*ͺ*reβinstate the decimal digs precision*/
end   /*ͺ*guesses*/

say;             say center('βββββββββββββββββββββββ', 79)
say center('β                     β', 79)
say center('β  congratulations !  β', 79)
say center('β                     β', 79)
say center('βββββββββββββββββββββββ', 79);     say
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
#chrs:procedure; parse arg x,c;  return length(x) - length( space( translate(x, , c), 0) )
div:  procedure; parse arg q; if q=0  then q=1e9; return q  /*ͺ*tests if dividing by zero.*/
ger:  say newV1 '***error*** for argument: '  uargs;   say newV1  arg(1);  errCode= 1;  return 0
s:    if arg(1)==1  then return arg(3);           return word( arg(2) 's', 1)
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
ranger: parse arg ssss,ffff                      /*ͺ*parse args passed to this sub.       */
ffff= word(ffff ssss, 1)                 /*ͺ*create a   FFFF   if necessary.      */
do g=ssss  to ffff                /*ͺ*process possible range of values.    */
if pos(0, g)\==0  then iterate    /*ͺ*ignore any   G   number with zeroes. */
sols= solve(g);  wols= sols
if sols==0  then wols= 'No'       /*ͺ*unβgeek number of solutions (if any).*/
if negatory & sols\==0  then wols= 'A'  /*ͺ*found only the first solution? */
if sols==1  & limit==1  then wols= 'A'
say;            say wols   'solution's(sols)    "found for"    g
if newV6\==24  then say  'for answers that equal'    newV6
end   /*ͺ*g*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
solve: parse arg qqqq; finds= 0;  x.=0;  nq.= x. /*ͺ*parse args passed to this function.  */
if \validate(qqqq)  then return -1
parse value '( (( )) )'   with  L LL RR R /*ͺ*assign some static variables (fastly)*/

do jq=1  for 4;  newV7= substr(qqqq,jq,1) /*ͺ*count the   number   of each digit.  */
nq.newV7= nq.newV7 + 1
end   /*ͺ*jq*/

gLO= 1111;  gHI= 9999
if newV6==24  then do;  gLO= 1118;  gHI= 9993;  end  /*ͺ*24:  lowest poss.# that has solutions*/

do gggg=gLO  to gHI;  if pos(0, gggg)\==0  then iterate   /*ͺ*ignore values with zeroes.*/
if verify(gggg, qqqq)\==0  then iterate
if verify(qqqq, gggg)\==0  then iterate
ng.= 0
do jg=1  for 4;  newV7= substr(gggg, jg, 1);       g.jg= newV7;            ng.newV7= ng.newV7 + 1
end   /*ͺ*jg*/                            /*ͺ* [β]  count the number of each digit.*/
do kg=1  for 9;   if nq.kg\==ng.kg  then iterate gggg
end   /*ͺ*kg*/           /*ͺ* [β]  verify number has same # digits*/
do       i=1  for ops                        /*ͺ*insert operator after 1st numeral.   */
do     j=1  for ops                        /*ͺ*  "        "      "   2nd    "       */
do   k=1  for ops                        /*ͺ*  "        "      "   3rd    "       */
do m=0  for 10;       newV4.=              /*ͺ*nullify all grouping symbols (parens)*/
select                               /*ͺ*used to generate grouped expressions.*/
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
end   /*ͺ*select*/

e= space(newV4.1 g.1 o.i     newV4.2 g.2 newV4.3 o.j      newV4.4 g.3 newV4.5 o.k      g.4  newV4.6,  0)
if x.e  then iterate                   /*ͺ*was the expression already used?     */
x.e= 1                                 /*ͺ*mark this expression as being used.  */
origE= e                               /*ͺ*keep original version for the display*/
pd= pos('/(', e)                       /*ͺ*find pos of     /(      in  E.       */
if pd\==0  then do                     /*ͺ*Found?  Might have possible Γ· by zero*/
eo= e
lr= lastpos(')', e)    /*ͺ*find the last right parenthesis.     */
lm= pos('-', e, pd+1)  /*ͺ*find a minus sign (-)    after  (    */
if lm>pd & lm<lr  then e= changestr('/(',e,"/div(")   /*ͺ*change*/
if eo\==e then if x.e  then iterate /*ͺ*expression already used?*/
x.e= 1                 /*ͺ*mark this expression as being used.  */
end
interpret 'x=('   e   ") / 1"          /*ͺ*have REXX do the heavy lifting here. */
if x\==newV6  then do                      /*ͺ*Not correct?   Then try again.       */
numeric digits 9;    x= x / 1               /*ͺ*reβdo evaluation.*/
numeric digits 12                           /*ͺ*reβinstate digits*/
if x\==newV6  then iterate  /*ͺ*Not correct?   Then try again.       */
end
finds= finds + 1                       /*ͺ*bump number of found solutions.      */
if \show | negatory  then return finds
newV7= translate(origE, '][', ")(")                      /*ͺ*display  [],  not  (). */
if show  then say indent   'a solution for'  gggg':'  newV6"="  newV7 /*ͺ*show solution.*/
if limit==1 & finds==limit  then leave gggg                   /*ͺ*leave big loop*/
end     /*ͺ*m*/
end       /*ͺ*k*/
end         /*ͺ*j*/
end           /*ͺ*i*/
end             /*ͺ*gggg*/
return finds
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sortc: procedure;  arg nnnn;           newV5.=        /*ͺ*sorts the digits of   NNNN          */
do i=1  for length(nnnn); newV7= substr(nnnn, i, 1);   newV5.newV7= newV5.newV7||newV7;   end  /*ͺ*i*/
return newV5.0 || newV5.1 || newV5.2 || newV5.3 || newV5.4 || newV5.5 || newV5.6 || newV5.7 || newV5.8 || newV5.9
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
validate: parse arg y;               errCode= 0;                       newV2= verify(y, digs)
select
when y==''         then call ger 'no digits were entered.'
when length(y)<4   then call ger 'not enough digits entered, must be 4'
when length(y)>4   then call ger 'too many digits entered, must be 4'
when pos(0,y)\==0  then call ger "can't use the digit  0 (zero)"
when newV2\==0        then call ger 'illegal character:'  substr(y, newV2, 1)
otherwise          nop
end   /*ͺ*select*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\24-game\24-game.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
