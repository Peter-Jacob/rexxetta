/*ͺ*REXX program enumerates all possible configurations (or an error) for nonogram puzzles*/
newV1.=;    newV1.1=  5   2 1
newV1.2=  5
newV1.3= 10   8
newV1.4= 15   2 3 2 3
newV1.5=  5   2 3
do  i=1  while newV1.i\==''
parse var  newV1.i   N  blocks                 /*ͺ*obtain  N  and  blocks   from array. */
N= strip(N);     blocks= space(blocks)     /*ͺ*assign stripped   N   and   blocks.  */
call nono                                  /*ͺ*incoke NONO subroutine for heavy work*/
end   /*ͺ*i*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
nono: say copies('=', 70)                                 /*ͺ*display seperator for title.*/
say 'For '   N   " cells  and blocks of: "   blocks /*ͺ*display the title for output*/
z=                                                  /*ͺ*assign starter value for Z. */
do w=1  for words(blocks)                       /*ͺ*process each of the blocks. */
z= z copies('#', word(blocks,w) )               /*ͺ*build a string for 1st value*/
end   /*ͺ*w*/                                     /*ͺ*Z  now has a leading blank. */
newV4= 1                                                /*ͺ*number of positions (so far)*/
z= translate( strip(z), ., ' ');   L= length(z)     /*ͺ*change blanks to periods.   */
if L>N  then do;   say '***error***  invalid blocks for number of cells.';   return
end
newV2.0=;           newV2.1= z;         newV3.=0       /*ͺ*assign default and the first position*/
z= pad(z)                                  /*ͺ*fillβout (pad) the value with periods*/

do prepend=1  while words(blocks)\==0   /*ͺ*process all the positions (leading .)*/
new= . || newV2.prepend                     /*ͺ*create positions with leading dots.  */
if length(new)>N  then leave            /*ͺ*Length is too long?  Then stop adding*/
call add                                /*ͺ*add position that has a leading dot. */
end   /*ͺ*prepend*/                       /*ͺ* [β]  prepend positions with dots.   */

do   k=1  for N                         /*ͺ*process each of the positions so far.*/
do c=1  for N                         /*ͺ*   "      "   "  "  position blocks. */
if newV2.c==''  then iterate              /*ͺ*if string is null,  skip the string. */
p= loc(newV2.c, k)                        /*ͺ*find location of block in position.  */
if p==0 | p>=N  then iterate          /*ͺ*Location zero or outβofβrange?  Skip.*/
new= strip( insert(., newV2.c, p),'T',.)  /*ͺ*insert a dot and strip trailing dots.*/
if strip(new,'T',.)=newV2.c  then iterate /*ͺ*Is it the same value?  Then skip it. */
if length(new)<=N  then call add      /*ͺ*Is length OK?   Then add position.   */
end   /*ͺ*k*/
end     /*ͺ*c*/
say
say 'βpositionβ'  center("value", max(7, length(z) ), 'β')  /*ͺ*show hdr for output.*/

do m=1  for newV4
say center(m, 10)   pad(newV2.m)      /*ͺ*display the index count and position.*/
end   /*ͺ*m*/
return
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
loc:  newV5=0; do arg(2); newV5=pos('#.',pad(arg(1)),newV5+1); if newV5==0  then return 0; end; return newV5+1
add:  if newV3.new==1  then return;  newV4= newV4 + 1;     newV2.newV4= new;    newV3.new=1;    return
pad:  return  left( arg(1), N, .)
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Nonoblock\nonoblock.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
