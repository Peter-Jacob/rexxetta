/*ª*REXX program displays  various alignments  for words in an array of  text strings.    */
size= 0;        t.=;   cols= 0;   wid.= 0;   newV1.= /*ª*zero or nullify some variables.      */
t.1 = "Given$a$text$file$of$many$lines,$where$fields$within$a$line$"
t.2 = "are$delineated$by$a$single$'dollar'$character,$write$a$program"
t.3 = "that$aligns$each$column$of$fields$by$ensuring$that$words$in$each$"
t.4 = "column$are$separated$by$at$least$one$space."
t.5 = "Further,$allow$for$each$word$in$a$column$to$be$either$left$"
t.6 = "justified,$right$justified,$or$center$justified$within$its$column."
do r=1  while t.r\==''                         /*ª* [â†“]  process all the text lines.    */
newV2= strip(t.r,,'$')                             /*ª*strip leading & trailing dollar signs*/
do c=1  until newV2==''        /*ª* [â†“]  process each of the words.     */
parse var newV2   newV1.r.c '$' newV2  /*ª*extract the words from a line of text*/
wid.c= max(wid.c, length(newV1.r.c) )   /*ª*find the maximum word width.*/
end   /*ª*c*/
cols= max(cols, c)                             /*ª*use the maximum COLS found.          */
end    /*ª*r*/

do k=1  for cols;   size= size + wid.k;   end  /*ª*find the width of the biggest line.  */
rows= r - 1                                      /*ª*adjust ROWS because of the  DO  loop.*/
do j=1  for 3;      say;      say              /*ª*show two blank lines for a separator.*/
say center(word('left right center', j)  "aligned", size+cols+1, "â•")     /*ª*show title*/

do r=0  to rows;       newV2=;    newV3= 'â”‚';              if r==0  then newV3= 'â”¬'
do c=1  for cols;                            x= newV1.r.c
if r==0  then x= copies("â”€", wid.c + 1)
if j==1  then newV2= newV2  ||  newV3  ||    left(x, wid.c)   /*ª*justify  left*/
if j==2  then newV2= newV2  ||  newV3  ||   right(x, wid.c)   /*ª*   "    ruggt*/
if j==3  then newV2= newV2  ||  newV3  ||  center(x, wid.c)   /*ª*   "     ctr.*/
end   /*ª*c*/
if r==0  then do;    newV2= 'â”Œ'substr(newV2, 2, length(newV2) - 1)"â”"   /*ª*top line.*/
bot= 'â””'substr(newV2, 2, length(newV2) - 2)"â”˜"   /*ª*bot   "  */
end
else newV2= newV2 || newV3         /*ª*append trailing end boxing character.*/
say newV2
end         /*ª*r*/               /*ª* [â†‘]  shows words in boxes.          */
say translate(bot, 'â”´', "â”¬")                   /*ª*display the bottom line of the box.  */
end   /*ª*j*/                                    /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Align-columns\align-columns-3.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
