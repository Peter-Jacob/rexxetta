/*ª*REXX program to compute and display  (unsigned)  Stirling numbers   of the first kind.*/
parse arg lim .                                  /*ª*obtain optional argument from the CL.*/
if lim=='' | lim==","  then lim= 12              /*ª*Not specified?  Then use the default.*/
olim= lim                                        /*ª*save     the original value of  LIM. */
lim= abs(lim)                                    /*ª*only use the absolute value of  LIM. */
numeric digits max(9, 2*lim)                     /*ª*(over) specify maximum number in grid*/
newV1.=;                                 newV1.0.0= 1    /*ª*define the   (0, 0)th  value  in grid*/
do n=0  for lim+1                        /*ª* [â†“]  initialize some  values  "   " */
if n>0  then newV1.n.0 = 0                   /*ª*assign value if  N > zero.           */
do k=n+1  to lim
newV1.n.k = 0                              /*ª*zero some values in grid  if  K > N. */
end   /*ª*k*/
end     /*ª*n*/
max#.= 0                                         /*ª* [â†“]  calculate values for the grid. */
do   n=1  for lim;           nm= n - 1
do k=1  for lim;           km= k - 1
newV1.n.k = newV1.nm.km  +  nm * newV1.nm.k        /*ª*calculate an unsigned number in grid.*/
max#.k= max(max#.k, newV1.n.k)             /*ª*find the      maximum value   "   "  */
max#.b= max(max#.b, newV1.n.k)             /*ª*find the maximum value for all rows. */
end   /*ª*k*/
end     /*ª*n*/

do k=1  for lim                          /*ª*find max column width for each column*/
max#.a= max#.a + length(max#.k)
end   /*ª*k*/
/*ª* [â†“]  only show the maximum value ?  */
w= length(max#.b)                                /*ª*calculate max width of all numbers.  */
if olim<0  then do;  say 'The maximum value  (which has '      w      " decimal digits):"
say max#.b                  /*ª*display maximum number in the grid.  */
exit                        /*ª*stick a fork in it,  we're all done. */
end
wi= max(3, length(lim+1) )                       /*ª*the maximum width of the grid's index*/
say 'row'  center('columns', max(9, max#.a + lim), 'â•')    /*ª*display header of the grid.*/

do r=0  for lim+1;   newV2=                  /*ª* [â†“]  display the grid to the term.  */
do c=0  for lim+1  until c>=r          /*ª*build a row of grid, 1 col at a time.*/
newV2= newV2  right(newV1.r.c, length(max#.c) )    /*ª*append a column to a row of the grid.*/
end   /*ª*c*/
say right(r,wi)  strip(substr(newV2,2), 'T') /*ª*display a single row of the grid.    */
end     /*ª*r*/                            /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Stirling-numbers-of-the-first-kind\stirling-numbers-of-the-first-kind.rexx was migrated on 23 Mar 2025 at 10:43:31
 * -------------------------------------------------------------------------
*/ 
