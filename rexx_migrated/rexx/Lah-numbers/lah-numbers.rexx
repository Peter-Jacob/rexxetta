/*�*REXX pgm computes & display (unsigned) Stirling numbers of the 3rd kind (Lah numbers).*/
parse arg lim .                                  /*�*obtain optional argument from the CL.*/
if lim=='' | lim==","  then lim= 12              /*�*Not specified?  Then use the default.*/
olim= lim                                        /*�*save     the original value of  LIM. */
lim= abs(lim)                                    /*�*only use the absolute value of  LIM. */
numeric digits max(9, 4*lim)                     /*�*(over) specify maximum number in grid*/
max#.= 0
newV1.=.
newV2.=                                              /*�* [↓]  calculate values for the grid. */
do   n=0  to  lim;   nm= n - 1
do k=0  to  lim;   km= k - 1
if k==1               then do;  newV2.n.k= newV4(n); call maxer; iterate;  end
if k==n               then do;  newV2.n.k= 1   ;             iterate;  end
if k>n | k==0 | n==0  then do;  newV2.n.k= 0   ;             iterate;  end
newV2.n.k = (newV4(n) * newV4(nm)) % (newV4(k) * newV4(km)) % newV4(n-k)  /*�*calculate a # in the grid.*/
call maxer                                        /*�*find    max #  "  "    "  */
end   /*�*k*/
end     /*�*n*/

do k=0  for lim+1                        /*�*find max column width for each column*/
max#.a= max#.a + length(max#.k)
end   /*�*k*/
/*�* [↓]  only show the maximum value ?  */
w= length(max#.b)                                /*�*calculate max width of all numbers.  */
if olim<0  then do;  say 'The maximum value  (which has '      w      " decimal digits):"
say max#.b                  /*�*display maximum number in the grid.  */
exit                        /*�*stick a fork in it,  we're all done. */
end                              /*�* [↑]  the 100th row is when LIM is 99*/
wi= max(3, length(lim+1) )                       /*�*the maximum width of the grid's index*/
say 'row'  center('columns', max(9, max#.a + lim), '═')    /*�*display header of the grid.*/

do r=0  for lim+1;   newV3=                  /*�* [↓]  display the grid to the term.  */
do c=0  for lim+1  until c>=r          /*�*build a row of grid, 1 col at a time.*/
newV3= newV3  right(newV2.r.c, length(max#.c) )    /*�*append a column to a row of the grid.*/
end   /*�*c*/
say right(r,wi)  strip(substr(newV3,2), 'T') /*�*display a single row of the grid.    */
end     /*�*r*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
newV4: parse arg z; if newV1.z\==. then return newV1.z; newV4=1; do f=2  to z; newV4=newV4*f; end; newV1.z=newV4; return newV4
maxer:   max#.k= max(max#.k, newV2.n.k);        max#.b= max(max#.b, newV2.n.k);           return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Lah-numbers\lah-numbers.rexx was migrated on 23 Mar 2025 at 10:43:18
 * -------------------------------------------------------------------------
*/ 
