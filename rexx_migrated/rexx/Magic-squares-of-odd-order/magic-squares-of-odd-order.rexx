/*�*REXX program generates and displays magic squares (odd N will be a true magic square).*/
parse arg N .                                    /*�*obtain the optional argument from CL.*/
if N=='' | N==","  then N=5                      /*�*Not specified?  Then use the default.*/
NN=N*N;    w=length(NN)                          /*�*W:  width of largest number (output).*/
r=1;       c=(n+1) % 2                           /*�*define the initial  row  and  column.*/
newV1.=.                                             /*�*assign a default value for entire  @.*/
do j=1  for NN                               /*�* [↓]  filling uses the Siamese method*/
if r<1 & c>N then do; r=r+2;  c=c-1;  end    /*�*the  row   is under,  column is over.*/
if r<1       then r=N                        /*�* "    "     "   "     make row=last. */
if r>N       then r=1                        /*�* "    "     "  over,    "   "  first.*/
if c>N       then c=1                        /*�* "  column  "  over,    "  col=first.*/
if newV1.r.c\==. then do; r=min(N,r+2);  c=max(1,c-1);  end     /*�*at the previous cell? */
newV1.r.c=j;              r=r-1;  c=c+1          /*�*assign # ───► cell; next row & column*/
end   /*�*j*/
/*�* [↓]  display square with aligned #'s*/
do   r=1  for N;  newV2=                   /*�*display  one matrix row  at a time.  */
do c=1  for N;  newV2=newV2 right(newV1.r.c, w)  /*�*construct a row of the magic square. */
end   /*�*c*/
say substr(newV2, 2)                       /*�*display a row of the magic square.   */
end     /*�*r*/
say                                              /*�* [↓]  If an odd square, show magic #.*/
if N//2  then say  'The magic number  (or magic constant is): '         N * (NN+1) % 2
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Magic-squares-of-odd-order\magic-squares-of-odd-order.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
