/*�*REXX program grows and displays a forest (with growth  and fires caused by lightning).*/
parse value scrSize()  with  sd sw .             /*�*the size of the terminal display.    */
parse arg generations birth lightning rSeed .    /*�*obtain the optional arguments from CL*/
if datatype(rSeed,'W')  then call random ,,rSeed /*�*do we want  RANDOM BIF repeatability?*/
generations = p(generations  100)                /*�*maybe use  one hundred  generations. */
birth = p(strip(birth    , ,'%') 50 ) *100 /*�*calculate the percentage for births. */
lightning = p(strip(lightning, ,'%') 1/8) *100 /*�*    "      "       "      " lightning*/
bare! = ' '                                /*�*the glyph used to show a bare place. */
fire! = '▒'                                /*�*glyph is close to a conflagration.   */
tree! = '↑'                                /*�*this is an up─arrow [↑] glyph (tree).*/
rows = max(12, sd-2)                      /*�*shrink the usable screen rows by two.*/
cols = max(79, sw-1)                      /*�*   "    "     "      "   cols  " one.*/
every = 999999999                          /*�*shows a snapshot every Nth generation*/
field = min(100000, rows*cols)             /*�*the size of the forest area (field). */
newV1.=bare!                                         /*�*forest:  it is now a treeless field. */
newV2.=newV1.                                            /*�*ditto,   for the  "shadow"   forest. */
gens=abs(generations)                            /*�*use this for convenience.            */
signal on halt                                   /*�*handle any forest life interruptus.  */
/*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒observe the forest grow and/or burn. */
do  life=1  for gens                           /*�*simulate a forest's life cycle.      */
do   r=1  for rows;     rank=bare!           /*�*start a forest rank as being bare.   */
do c=2  for cols;     newV4=substr(newV1.r, c, 1);              newV3=newV4
select                                   /*�*select the most likeliest choice 1st.*/
when newV4==tree!  then  if ignitenewV4()                then newV3=fire!     /*�*on fire ?  */
when newV4==bare!  then  if random(1, field)<=birth  then newV3=tree!     /*�*new growth.*/
otherwise                                             newV3=bare!     /*�*it's barren*/
end   /*�*select*/                         /*�* [↑]  when (↑)  if  ≡  short circuit.*/
rank=rank || newV3                            /*�*build rank:  1 forest "row" at a time*/
end     /*�*c*/                              /*�*ignore column one, start with col two*/
newV2.r=rank                                     /*�*and assign rank to alternate forest. */
end       /*�*r*/                              /*�* [↓]  ··· and, later, yet back again.*/

do r=1  for rows;   newV1.r=newV2.r;   end  /*�*r*/  /*�*assign alternate cells ──► real cells*/
if \(life//every==0 | generations>0 | life==gens)   then iterate
'CLS'                                          /*�* ◄─── change this command for your OS*/
do r=rows  by -1  for rows;   say strip(substr(newV1.r, 2), 'T')    /*�*a row of trees*/
end   /*�*r*/                              /*�* [↑]  display forest to the terminal.*/
say right(copies('▒', cols)life, cols)         /*�*show and tell for a stand of trees.  */
end         /*�*life*/
/*�*▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒stop observing the forest evolve.    */
halt: if life-1\==gens  then say 'Forest simulation interrupted.' /*�*was this pgm HALTed?*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
ignitenewV4:           if substr(newV1.r, c+1, 1) == fire!  then return 1   /*�*is  east on fire? */
cm=c-1;   if substr(newV1.r, cm , 1) == fire!  then return 1   /*�* "  west  "   "   */
rm=r-1;            rp=r+1           /*�*test north & south*/
if pos(fire!, substr(newV1.rm, cm, 3)substr(newV1.rp, cm, 3)) \== 0   then return 1
return  random(1, field) <= lightning                      /*�*lightning ignition*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
p:       return word(arg(1), 1)                  /*�*pick─a─word:  first  or  second word.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Forest-fire\forest-fire.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
