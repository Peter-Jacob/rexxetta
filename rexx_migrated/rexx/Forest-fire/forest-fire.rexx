/*ͺ*REXX program grows and displays a forest (with growth  and fires caused by lightning).*/
parse value scrSize()  with  sd sw .             /*ͺ*the size of the terminal display.    */
parse arg generations birth lightning rSeed .    /*ͺ*obtain the optional arguments from CL*/
if datatype(rSeed,'W')  then call random ,,rSeed /*ͺ*do we want  RANDOM BIF repeatability?*/
generations = p(generations  100)                /*ͺ*maybe use  one hundred  generations. */
birth = p(strip(birth    , ,'%') 50 ) *100 /*ͺ*calculate the percentage for births. */
lightning = p(strip(lightning, ,'%') 1/8) *100 /*ͺ*    "      "       "      " lightning*/
bare! = ' '                                /*ͺ*the glyph used to show a bare place. */
fire! = 'β'                                /*ͺ*glyph is close to a conflagration.   */
tree! = 'β'                                /*ͺ*this is an upβarrow [β] glyph (tree).*/
rows = max(12, sd-2)                      /*ͺ*shrink the usable screen rows by two.*/
cols = max(79, sw-1)                      /*ͺ*   "    "     "      "   cols  " one.*/
every = 999999999                          /*ͺ*shows a snapshot every Nth generation*/
field = min(100000, rows*cols)             /*ͺ*the size of the forest area (field). */
newV1.=bare!                                         /*ͺ*forest:  it is now a treeless field. */
newV2.=newV1.                                            /*ͺ*ditto,   for the  "shadow"   forest. */
gens=abs(generations)                            /*ͺ*use this for convenience.            */
signal on halt                                   /*ͺ*handle any forest life interruptus.  */
/*ͺ*βββββββββββββββββββββββββββββββββββobserve the forest grow and/or burn. */
do  life=1  for gens                           /*ͺ*simulate a forest's life cycle.      */
do   r=1  for rows;     rank=bare!           /*ͺ*start a forest rank as being bare.   */
do c=2  for cols;     newV4=substr(newV1.r, c, 1);              newV3=newV4
select                                   /*ͺ*select the most likeliest choice 1st.*/
when newV4==tree!  then  if ignitenewV4()                then newV3=fire!     /*ͺ*on fire ?  */
when newV4==bare!  then  if random(1, field)<=birth  then newV3=tree!     /*ͺ*new growth.*/
otherwise                                             newV3=bare!     /*ͺ*it's barren*/
end   /*ͺ*select*/                         /*ͺ* [β]  when (β)  if  β‘  short circuit.*/
rank=rank || newV3                            /*ͺ*build rank:  1 forest "row" at a time*/
end     /*ͺ*c*/                              /*ͺ*ignore column one, start with col two*/
newV2.r=rank                                     /*ͺ*and assign rank to alternate forest. */
end       /*ͺ*r*/                              /*ͺ* [β]  Β·Β·Β· and, later, yet back again.*/

do r=1  for rows;   newV1.r=newV2.r;   end  /*ͺ*r*/  /*ͺ*assign alternate cells βββΊ real cells*/
if \(life//every==0 | generations>0 | life==gens)   then iterate
'CLS'                                          /*ͺ* ββββ change this command for your OS*/
do r=rows  by -1  for rows;   say strip(substr(newV1.r, 2), 'T')    /*ͺ*a row of trees*/
end   /*ͺ*r*/                              /*ͺ* [β]  display forest to the terminal.*/
say right(copies('β', cols)life, cols)         /*ͺ*show and tell for a stand of trees.  */
end         /*ͺ*life*/
/*ͺ*βββββββββββββββββββββββββββββββββββstop observing the forest evolve.    */
halt: if life-1\==gens  then say 'Forest simulation interrupted.' /*ͺ*was this pgm HALTed?*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
ignitenewV4:           if substr(newV1.r, c+1, 1) == fire!  then return 1   /*ͺ*is  east on fire? */
cm=c-1;   if substr(newV1.r, cm , 1) == fire!  then return 1   /*ͺ* "  west  "   "   */
rm=r-1;            rp=r+1           /*ͺ*test north & south*/
if pos(fire!, substr(newV1.rm, cm, 3)substr(newV1.rp, cm, 3)) \== 0   then return 1
return  random(1, field) <= lightning                      /*ͺ*lightning ignition*/
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
p:       return word(arg(1), 1)                  /*ͺ*pickβaβword:  first  or  second word.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Forest-fire\forest-fire.rexx was migrated on 23 Mar 2025 at 10:43:14
 * -------------------------------------------------------------------------
*/ 
