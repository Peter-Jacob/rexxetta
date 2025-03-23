/*�*REXX program enumerates all possible configurations (or an error) for nonogram puzzles*/
newV1.=;    newV1.1=  5   2 1
newV1.2=  5
newV1.3= 10   8
newV1.4= 15   2 3 2 3
newV1.5=  5   2 3
do  i=1  while newV1.i\==''
parse var  newV1.i   N  blocks                 /*�*obtain  N  and  blocks   from array. */
N= strip(N);     blocks= space(blocks)     /*�*assign stripped   N   and   blocks.  */
call nono                                  /*�*incoke NONO subroutine for heavy work*/
end   /*�*i*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
nono: say copies('=', 70)                                 /*�*display seperator for title.*/
say 'For '   N   " cells  and blocks of: "   blocks /*�*display the title for output*/
z=                                                  /*�*assign starter value for Z. */
do w=1  for words(blocks)                       /*�*process each of the blocks. */
z= z copies('#', word(blocks,w) )               /*�*build a string for 1st value*/
end   /*�*w*/                                     /*�*Z  now has a leading blank. */
newV4= 1                                                /*�*number of positions (so far)*/
z= translate( strip(z), ., ' ');   L= length(z)     /*�*change blanks to periods.   */
if L>N  then do;   say '***error***  invalid blocks for number of cells.';   return
end
newV2.0=;           newV2.1= z;         newV3.=0       /*�*assign default and the first position*/
z= pad(z)                                  /*�*fill─out (pad) the value with periods*/

do prepend=1  while words(blocks)\==0   /*�*process all the positions (leading .)*/
new= . || newV2.prepend                     /*�*create positions with leading dots.  */
if length(new)>N  then leave            /*�*Length is too long?  Then stop adding*/
call add                                /*�*add position that has a leading dot. */
end   /*�*prepend*/                       /*�* [↑]  prepend positions with dots.   */

do   k=1  for N                         /*�*process each of the positions so far.*/
do c=1  for N                         /*�*   "      "   "  "  position blocks. */
if newV2.c==''  then iterate              /*�*if string is null,  skip the string. */
p= loc(newV2.c, k)                        /*�*find location of block in position.  */
if p==0 | p>=N  then iterate          /*�*Location zero or out─of─range?  Skip.*/
new= strip( insert(., newV2.c, p),'T',.)  /*�*insert a dot and strip trailing dots.*/
if strip(new,'T',.)=newV2.c  then iterate /*�*Is it the same value?  Then skip it. */
if length(new)<=N  then call add      /*�*Is length OK?   Then add position.   */
end   /*�*k*/
end     /*�*c*/
say
say '─position─'  center("value", max(7, length(z) ), '─')  /*�*show hdr for output.*/

do m=1  for newV4
say center(m, 10)   pad(newV2.m)      /*�*display the index count and position.*/
end   /*�*m*/
return
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
loc:  newV5=0; do arg(2); newV5=pos('#.',pad(arg(1)),newV5+1); if newV5==0  then return 0; end; return newV5+1
add:  if newV3.new==1  then return;  newV4= newV4 + 1;     newV2.newV4= new;    newV3.new=1;    return
pad:  return  left( arg(1), N, .)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Nonoblock\nonoblock.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
