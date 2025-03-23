/*ª*REXX program generates and displays magic squares (odd N will be a true magic square).*/
parse arg N .                                    /*ª*obtain the optional argument from CL.*/
if N=='' | N==","  then N=5                      /*ª*Not specified?  Then use the default.*/
NN=N*N;    w=length(NN)                          /*ª*W:  width of largest number (output).*/
r=1;       c=(n+1) % 2                           /*ª*define the initial  row  and  column.*/
newV1.=.                                             /*ª*assign a default value for entire  @.*/
do j=1  for NN                               /*ª* [â†“]  filling uses the Siamese method*/
if r<1 & c>N then do; r=r+2;  c=c-1;  end    /*ª*the  row   is under,  column is over.*/
if r<1       then r=N                        /*ª* "    "     "   "     make row=last. */
if r>N       then r=1                        /*ª* "    "     "  over,    "   "  first.*/
if c>N       then c=1                        /*ª* "  column  "  over,    "  col=first.*/
if newV1.r.c\==. then do; r=min(N,r+2);  c=max(1,c-1);  end     /*ª*at the previous cell? */
newV1.r.c=j;              r=r-1;  c=c+1          /*ª*assign # â”€â”€â”€â–º cell; next row & column*/
end   /*ª*j*/
/*ª* [â†“]  display square with aligned #'s*/
do   r=1  for N;  newV2=                   /*ª*display  one matrix row  at a time.  */
do c=1  for N;  newV2=newV2 right(newV1.r.c, w)  /*ª*construct a row of the magic square. */
end   /*ª*c*/
say substr(newV2, 2)                       /*ª*display a row of the magic square.   */
end     /*ª*r*/
say                                              /*ª* [â†“]  If an odd square, show magic #.*/
if N//2  then say  'The magic number  (or magic constant is): '         N * (NN+1) % 2
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Magic-squares-of-odd-order\magic-squares-of-odd-order.rexx was migrated on 23 Mar 2025 at 10:43:20
 * -------------------------------------------------------------------------
*/ 
