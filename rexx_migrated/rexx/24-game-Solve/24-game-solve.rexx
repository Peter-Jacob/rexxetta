/*ช*REXX program helps the user find solutions to the game of  24.                        */
/*ช*                           start-of-help
โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ
โ Argument is either of three forms:  (blank)                           โ~
โ                                      ssss                             โ~
โ                                      ssss,tot                         โ~
โ                                      ssss-ffff                        โ~
โ                                      ssss-ffff,tot                    โ~
โ                                     -ssss                             โ~
โ                                     +ssss                             โ~
โ                                                                       โ~
โ where SSSS and/or FFFF must be exactly four numerals (digits)         โ~
โ comprised soley of the numerals (digits)  1 โโ> 9   (no zeroes).      โ~
โ                                                                       โ~
โ                                      SSSS  is the start,              โ~
โ                                      FFFF  is the start.              โ~
โ                                                                       โ~
โ                                                                       โ~
โ If  ssss  has a leading plus (+) sign, it is used as the number, and  โ~
โ the user is prompted to find a solution.                              โ~
โ                                                                       โ~
โ If  ssss  has a leading minus (-) sign, a solution is looked for and  โ~
โ the user is told there is a solution (but no solutions are shown).    โ~
โ                                                                       โ~
โ If no argument is specified, this program finds a four digits (no     โ~
โ zeroes)  which has at least one solution, and shows the digits to     โ~
โ the user, requesting that they enter a solution.                      โ~
โ                                                                       โ~
โ If  tot  is entered, it is the desired answer.  The default is  24.   โ~
โ                                                                       โ~
โ A solution to be entered can be in the form of:                       โ
โ                                                                       โ
โ    digit1   operator   digit2   operator   digit3   operator  digit4  โ
โ                                                                       โ
โ where    DIGITn     is one of the digits shown (in any order),  and   โ
โ          OPERATOR   can be any one of:     +    -    *    /           โ
โ                                                                       โ
โ Parentheses  ()  may be used in the normal manner for grouping,  as   โ
โ well as brackets  []  or  braces  {}.   Blanks can be used anywhere.  โ
โ                                                                       โ
โ I.E.:    for the digits    3448     the following could be entered.   โ
โ                                                                       โ
โ                            3*8 + (4-4)                                โ
โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ
end-of-help                                   */
numeric digits 12                                /*ช*where rational arithmetic is needed. */
parse arg orig                                   /*ช*get the  guess  from the command line*/
orig= space(orig, 0)                             /*ช*remove all blanks from  ORIG.        */
negatory= left(orig,1)=='-'                      /*ช*=1, suppresses showing.              */
pository= left(orig,1)=='+'                      /*ช*=1, force $24 to use specific number.*/
if pository | negatory  then orig=substr(orig,2) /*ช*now, just use the absolute vaue.     */
parse var orig orig ',' newV3                       /*ช*get ??  (if specified, def=24).      */
parse var orig start '-' finish                  /*ช*get start and finish  (maybe).       */
opers= '*' || "/+-"                              /*ช*legal arith. opers;order is important*/
ops= length(opers)                               /*ช*the number of arithmetic operators.  */
groupsym= '()[]{}'                               /*ช*allowed grouping symbols.            */
indent= left('', 30)                             /*ช*indents display of solutions.        */
show= 1                                          /*ช*=1, shows solutions (semifore).      */
digs= 123456789                                  /*ช*numerals/digs that can be used.      */
abuttals = 0                                     /*ช*=1, allows digit abutal:  12+12      */
if newV3==''  then newV3= 24                           /*ช*the name of the game.                */
newV3= newV3 / 1                                       /*ช*normalize the answer.                */
newV2= 'abcdefghijklmnopqrstuvwxyz'               /*ช*the Latin alphabet in order.         */
newV1= newV2;  upper newV1                        /*ช*an uppercase version of @abc.        */
x.= 0                                            /*ช*method used to not re-interpret.     */
do j=1  for ops;    o.j=substr(opers, j, 1)
end  /*ช*j*/                                 /*ช*used for fast execution.             */
y= newV3
if \datatype(newV3,'N')       then do; call ger "isn't numeric"; exit 13;  end
if start\=='' & \pository  then do; call ranger start,finish; exit 13;  end
show= 0                                          /*ช*stop SOLVE blabbing solutions.       */
do forever  while  \negatory             /*ช*keep truckin' until a solution.      */
x.= 0                                    /*ช*way to hold unique expressions.      */
rrrr= random(1111, 9999)                 /*ช*get a random set of digits.          */
if pos(0, rrrr)\==0  then iterate        /*ช*but don't the use of zeroes.         */
if solve(rrrr)\==0  then leave           /*ช*try to solve for these digits.       */
end   /*ช*forever*/

if left(orig,1)=='+'  then rrrr=start            /*ช*use what's specified.                */
show= 1                                          /*ช*enable SOLVE to show solutions.      */
rrrr= sortc(rrrr)                                /*ช*sort four elements.                  */
rd.= 0
do j=1  for 9                    /*ช*count for each digit in  RRRR.       */
newV7= substr(rrrr, j, 1);    rd.newV7= countchars(rrrr, newV7)
end
do guesses=1;                 say
say 'Using the digits' rrrr", enter an expression that equals" newV3 '  (? or QUIT):'
pull y;                       y= space(y, 0)
if countchars(y, newV1)>2  then exit           /*ช*the user must be desperate.          */
helpstart= 0
if y=='?'  then do j=1  for sourceline()       /*ช*use a lazy way to show help.         */
newV7= sourceline(j)
if p(newV7)=='start-of-help'  then do;  helpstart=1;  iterate;  end
if p(newV7)=='end-of-help'    then iterate guesses
if \helpstart             then iterate
if right(newV7,1)=='~'        then iterate
say '  ' newV7
end

newV4= verify(y, digs || opers || groupsym)       /*ช*any illegal characters?              */
if newV4\==0  then do;   call ger 'invalid character:'  substr(y, newV4, 1);   iterate;    end
if y=''  then do;     call validate y;   iterate;    end

do j=1  for length(y)-1  while \abuttals     /*ช*check for two digits adjacent.       */
if \datatype(substr(y,j,1),  'W') then iterate
if  datatype(substr(y,j+1,1),'W') then do
call ger 'invalid use of digit abuttal' substr(y,j,2)
iterate guesses
end
end   /*ช*j*/

yd= countchars(y, digs)                        /*ช*count of legal digits  123456789     */
if yd<4  then do;  call ger 'not enough digits entered.'; iterate guesses; end
if yd>4  then do;  call ger 'too many digits entered.'  ; iterate guesses; end

do j=1  for length(groupsym)  by 2
if countchars(y,substr(groupsym,j  ,1))\==,
countchars(y,substr(groupsym,j+1,1))  then do
call ger 'mismatched' substr(groupsym,j,2)
iterate guesses
end
end   /*ช*j*/

do k=1  for 2                            /*ช*check for   **    and    //          */
newV7= copies( substr( opers, k, 1), 2)
if pos(newV7, y)\==0  then do;  call ger 'illegal operator:' newV7;  iterate guesses;  end
end   /*ช*k*/

do j=1  for 9;    if rd.j==0  then iterate;     newV5= countchars(y, j)
if newV5==rd.j  then iterate
if newV5<rd.j   then call ger  'not enough'   j   "digits, must be"   rd.j
else call ger  'too many'     j   "digits, must be"   rd.j
iterate guesses
end   /*ช*j*/

y= translate(y, '()()', "[]{}")
interpret  'ans=('  y   ") / 1"
if ans==newV3  then leave guesses
say right('incorrect, ' y'='ans, 50)
end   /*ช*guesses*/

say;      say center('โโโโโโโโโโโโโโโโโโโโโโโ', 79)
say center('โ                     โ', 79)
say center('โ  congratulations !  โ', 79)
say center('โ                     โ', 79)
say center('โโโโโโโโโโโโโโโโโโโโโโโ', 79)
say
exit                                             /*ช*stick a fork in it,  we're all done. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
countchars: procedure; arg x,c                   /*ช*count of characters in  X.           */
return length(x) - length( space( translate(x, ,c ),  0) )
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
ranger: parse arg ssss,ffff                      /*ช*parse args passed to this sub.       */
ffff= p(ffff ssss)                       /*ช*create a   FFFF   if necessary.      */
do g=ssss  to ffff                 /*ช*process possible range of values.    */
if pos(0, g)\==0  then iterate     /*ช*ignore any   G   with zeroes.        */
sols= solve(g);  wols= sols
if sols==0  then wols= 'No'        /*ช*un-geek number of solutions (if any).*/
if negatory & sols\==0  then wols='A'   /*ช*found only the first solution?  */
say
say wols   'solution's(sols)    "found for"    g
if newV3\==24  then say  'for answers that equal'    newV3
end
return
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
solve: parse arg qqqq;   finds= 0                /*ช*parse args passed to this sub.       */
if \validate(qqqq)  then return -1
parse value '( (( )) )' with L LL RR R           /*ช*assign some static variables.        */
nq.= 0
do jq=1  for 4;  newV7= substr(qqqq,jq,1) /*ช*count the number of each digit.      */
nq.newV7= nq.newV7 + 1
end   /*ช*jq*/

do gggg=1111  to 9999
if pos(0, gggg)\==0        then iterate        /*ช*ignore values with zeroes.           */
if verify(gggg, qqqq)\==0  then iterate
if verify(qqqq, gggg)\==0  then iterate
ng.= 0
do jg=1  for 4;  newV7= substr(gggg, jg, 1) /*ช*count the number of each digit.      */
g.jg= newV7;         ng.newV7= ng.newV7 + 1
end   /*ช*jg*/
do kg=1  for 9         /*ช*verify each number has same # digits.*/
if nq.kg\==ng.kg  then iterate gggg
end   /*ช*kg*/
do i    =1  for ops                          /*ช*insert operator after 1st numeral.   */
do j  =1  for ops                          /*ช*  "        "      "   2nd    "       */
do k=1  for ops                          /*ช*  "        "      "   3rd    "       */
do m=0  for 10;       newV6.=              /*ช*nullify all grouping symbols (parens)*/
select
when m==1  then do; newV6.1=L;           newV6.3=R;                                end
when m==2  then do; newV6.1=L;                              newV6.5=R;             end
when m==3  then do; newV6.1=L;           newV6.3=R;   newV6.4=L;              newV6.6=R;   end
when m==4  then do; newV6.1=L;   newV6.2=L;                               newV6.6=RR;  end
when m==5  then do; newV6.1=LL;                             newV6.5=R;    newV6.6=R;   end
when m==6  then do;          newV6.2=L;                     newV6.5=R;             end
when m==7  then do;          newV6.2=L;                               newV6.6=R;   end
when m==8  then do;          newV6.2=L;           newV6.4=L;              newV6.6=RR;  end
when m==9  then do;          newV6.2=LL;                    newV6.5=R;    newV6.6=R;   end
otherwise  nop
end   /*ช*select*/

e= space(newV6.1 g.1 o.i      newV6.2 g.2 newV6.3 o.j      newV6.4 g.3 newV6.5 o.k       g.4 newV6.6, 0)
if x.e  then iterate                   /*ช*was the expression already used?     */
x.e= 1                                 /*ช*mark this expression as being used.  */
/*ช*(below)  change the expression:   /(yyy)  ===>  /div(yyy)   */
origE= e                               /*ช*keep original version for the display*/
pd= pos('/(', e)                       /*ช*find pos of     /(      in  E.       */
if pd\==0  then do                     /*ช*Found?  Might have possible รท by zero*/
eo= e
lr= lastpos(')', e)    /*ช*find last right )   */
lm= pos('-', e, pd+1)  /*ช*find  -  after  (   */
if lm>pd & lm<lr  then e= changestr('/(',e,"/div(")   /*ช*change*/
if eo\==e then if x.e  then iterate /*ช*expression already used?*/
x.e= 1                 /*ช*mark this expression as being used.  */
end
interpret 'x=('   e   ") / 1"          /*ช*have REXX do the heavy lifting here. */
if x\==newV3  then do                     /*ช*Not correct?   Then try again.       */
numeric digits 9;    x= x / 1              /*ช*re-do evaluation.*/
numeric digits 12                          /*ช*re-instate digits*/
if x\==newV3 then iterate /*ช*Not correct?   Then try again.       */
end
finds= finds + 1                       /*ช*bump number of found solutions.      */
if \show | negatory  then return finds
newV7= translate(origE, '][', ")(")                        /*ช*show  [],  not  ().  */
if show  then say indent   'a solution for'  g':'  newV3"="  newV7   /*ช*show solution.*/
end     /*ช*m*/
end       /*ช*k*/
end         /*ช*j*/
end           /*ช*i*/
end             /*ช*gggg*/
return finds
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
sortc: procedure;  arg nnnn;   L= length(nnnn)    /*ช*sorts the chars NNNN                */
do i=1  for L                       /*ช*build array of digs from  NNNN,     */
a.i= substr(nnnn, i, 1)             /*ช*enabling SORT to sort an array.     */
end   /*ช*i*/

do j=1  for L                       /*ช*very simple sort, it's a small array*/
newV7= a.j
do k=j+1  to L
if a.k<newV7  then  do;   a.j= a.k;     a.k= newV7;     newV7= a.k;    end
end   /*ช*k*/
end   /*ช*j*/
v= a.1
do m=2  to L;  v= v || a.m /*ช*build a string of digs from  A.m    */
end   /*ช*m*/
return v
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
validate: parse arg y;     errCode= 0;       newV4= verify(y, digs)
select
when y==''         then call ger 'no digits entered.'
when length(y)<4   then call ger 'not enough digits entered, must be 4'
when length(y)>4   then call ger 'too many digits entered, must be 4'
when pos(0,y)\==0  then call ger "can't use the digit  0 (zero)"
when newV4\==0        then call ger 'illegal character:' substr(y,newV4,1)
otherwise               nop
end   /*ช*select*/
return \errCode
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
div:  procedure; parse arg q; if q=0  then q=1e9; return q  /*ช*tests if dividing by zero.*/
ger:  say= '***error*** for argument:'  y;      say arg(1);      errCode= 1;      return 0
p:    return word( arg(1), 1)
s:    if arg(1)==1  then return arg(3);           return word( arg(2) 's', 1)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\24-game-Solve\24-game-solve.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
