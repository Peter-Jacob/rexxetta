/*�*REXX program solves   Ax=b   with Gaussian elimination  and  backwards  substitution. */
numeric digits 1000                              /*�*heavy─duty decimal digits precision. */
parse arg iFID .                                 /*�*obtain optional argument from the CL.*/
if iFID=='' | iFID=="," then iFID= 'GAUSS_E.DAT' /*�*Not specified?  Then use the default.*/
pad= left('', 23)                                /*�*used for indenting residual numbers. */
do rec=1    while lines(iFID) \== 0         /*�*read the equation sets.              */
newV1=0                                         /*�*the number of equations  (so far).   */
do newV2=1  while lines(iFID) \== 0         /*�*process the equation.                */
z= linein(iFID);   if z=''  then leave  /*�*Is this a blank line?    end─of─data.*/
if newV2==1  then do;  say;     say center(' equations ', 75, "▓");        say
end                       /*�* [↑]  if 1st equation, then show hdr.*/
say z                                   /*�*display an equation to the terminal. */
if left(space(z), 1)=='*'  then iterate /*�*Is this a comment?    Then ignore it.*/
newV1= newV1 + 1;     n= words(z) - 1           /*�*assign equation #; calculate # items.*/
do e=1  for n;     a.newV1.e= word(z, e);     oa.newV1.e= a.newV1.e
end   /*�*e*/                           /*�* [↑]  process  A  numbers; save orig.*/
b.newV1= word(z, n+1);   ob.newV1=b.newV1           /*�* ◄───    "     B     "       "    "  */
end     /*�*$*/
if newV1\==0  then call GaussnewV3elim              /*�*Not zero?  Then display the results. */
say
do   i=1  for n;  r=0                   /*�*display the residuals to the terminal*/
do j=1  for n;  r=r  +  oa.i.j * x.j  /*�* ┌───◄  don't display a fraction  if */
end   /*�*j*/                           /*�* ↓      res ����ֲ 5% of significant digs.*/
r= format(r-ob.i, , digits() - digits() * 0.05 % 1 ,  0) / 1   /*�*should be tiny*/
say pad 'residual['right(i, length(n) )"] = " left('', r>=0) r /*�*right justify.*/
end     /*�*i*/
end         /*�*rec*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
GaussnewV3elim: say;              do     j=1  for n;   jp= j + 1
do   i=jp  to n;   newV3= a.j.j / a.i.j
do k=jp  to n;   a.i.k= a.j.k   -   newV3 * a.i.k
end   /*�*k*/
b.i= b.j   -   newV3 * b.i
end     /*�*i*/
end       /*�*j*/
x.n= b.n / a.n.n
do   j=n-1  to 1  by -1;   newV3= 0
do i=j+1  to n;          newV3= newV3   +   a.j.i * x.i
end     /*�*i*/
x.j= (b.j - newV3) / a.j.j
end       /*�*j*/    /*�* [↑]  uses backwards substitution.   */
numeric digits                       /*�*for the display,  only use 8 digits. */
say center('solution', 75, "═"); say /*�*a title line for articulated output. */
do o=1  for n;   say right('x['o"] = ", 38)   left('', x.o>=0)    x.o/1
end   /*�*o*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Gaussian-elimination\gaussian-elimination-3.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
