/*ͺ*REXX program expands an  ordered list  of  integers  into  an expanded list.          */
old= '-6,-3--1,   3-5,  7-11,       14,15,17-20';       a=translate(old,,',')
new=                                             /*ͺ*translate [β]  commas (,) ββββΊ blanks*/
do until a=='';   parse var a X a          /*ͺ*obtain the next integer ββorββ range.*/
p=pos('-', X, 2)                           /*ͺ*find the location of a dash (maybe). */
if p==0 then  new=new   X                  /*ͺ*append integer   X   to the new list.*/
else  do j=left(X,p-1)  to substr(X,p+1);     new=new j
end   /*ͺ*j*/                  /*ͺ*append a single [β] integer at a time*/
end                 /*ͺ*until*/
/*ͺ*stick a fork in it,  we're all done. */
new=translate( strip(new),  ',',  " ")           /*ͺ*remove the first blank,  add commas. */
say 'old list: '   old                           /*ͺ*show the  old list of numbers/ranges.*/
say 'new list: '   new                           /*ͺ*  "   "   new   "   " numbers.       */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Range-expansion\range-expansion-1.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
