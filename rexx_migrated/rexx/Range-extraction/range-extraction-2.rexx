/*ª*REXX program creates a  range extraction  from a  list of numbers  (can be negative.) */
old=0 1 2 4 6 7 8 11 12 14 15 16 17 18 19 20 21 22 23 24 25 27 28 29 30 31 32 33 35 36 37 38 39
newV1= words(old);        j= 0                       /*ª*number of integers in the number list*/
new=                                             /*ª*the new list, possibly with ranges.  */
do  while j<newV1;   j= j + 1;  z= word(old, j) /*ª*get the Jth number in the number list*/
inc= 1;                   new= new','z      /*ª*append   "    "    to  "   new     " */
do k=j+1  to newV1;    y= word(old, k) /*ª*get the Kth number in the number list*/
if y\==z+inc  then leave           /*ª*is this number not > previous by inc?*/
inc= inc + 1;      g= y            /*ª*increase the range, assign  G (good).*/
end   /*ª*k*/
if k-1=j   |   g=z+1   then iterate         /*ª*Is the range=0â”‚1?  Then keep truckin'*/
new= new'-'g;               j= k - 1        /*ª*indicate a range of numbers; change J*/
end            /*ª*while*/
/*ª*stick a fork in it,  we're all done. */
new= substr(new, 2)                              /*ª*elide the leading comma in the list. */
say 'old:'   old;           say 'new:'  new      /*ª*show the old and new range of numbers*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Range-extraction\range-extraction-2.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
