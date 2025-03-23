/*ª*REXX program expands an  ordered list  of  integers  into  an expanded list.          */
old= '-6,-3--1,   3-5,  7-11,       14,15,17-20';       a=translate(old,,',')
new=                                             /*ª*translate [â†‘]  commas (,) â”€â”€â”€â–º blanks*/
do until a=='';   parse var a X a          /*ª*obtain the next integer â”€â”€orâ”€â”€ range.*/
p=pos('-', X, 2)                           /*ª*find the location of a dash (maybe). */
if p==0 then  new=new   X                  /*ª*append integer   X   to the new list.*/
else  do j=left(X,p-1)  to substr(X,p+1);     new=new j
end   /*ª*j*/                  /*ª*append a single [â†‘] integer at a time*/
end                 /*ª*until*/
/*ª*stick a fork in it,  we're all done. */
new=translate( strip(new),  ',',  " ")           /*ª*remove the first blank,  add commas. */
say 'old list: '   old                           /*ª*show the  old list of numbers/ranges.*/
say 'new list: '   new                           /*ª*  "   "   new   "   " numbers.       */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Range-expansion\range-expansion-1.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
