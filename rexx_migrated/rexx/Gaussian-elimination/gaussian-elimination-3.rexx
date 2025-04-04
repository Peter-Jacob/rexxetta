/*ͺ*REXX program solves   Ax=b   with Gaussian elimination  and  backwards  substitution. */
numeric digits 1000                              /*ͺ*heavyβduty decimal digits precision. */
parse arg iFID .                                 /*ͺ*obtain optional argument from the CL.*/
if iFID=='' | iFID=="," then iFID= 'GAUSS_E.DAT' /*ͺ*Not specified?  Then use the default.*/
pad= left('', 23)                                /*ͺ*used for indenting residual numbers. */
do rec=1    while lines(iFID) \== 0         /*ͺ*read the equation sets.              */
newV1=0                                         /*ͺ*the number of equations  (so far).   */
do newV2=1  while lines(iFID) \== 0         /*ͺ*process the equation.                */
z= linein(iFID);   if z=''  then leave  /*ͺ*Is this a blank line?    endβofβdata.*/
if newV2==1  then do;  say;     say center(' equations ', 75, "β");        say
end                       /*ͺ* [β]  if 1st equation, then show hdr.*/
say z                                   /*ͺ*display an equation to the terminal. */
if left(space(z), 1)=='*'  then iterate /*ͺ*Is this a comment?    Then ignore it.*/
newV1= newV1 + 1;     n= words(z) - 1           /*ͺ*assign equation #; calculate # items.*/
do e=1  for n;     a.newV1.e= word(z, e);     oa.newV1.e= a.newV1.e
end   /*ͺ*e*/                           /*ͺ* [β]  process  A  numbers; save orig.*/
b.newV1= word(z, n+1);   ob.newV1=b.newV1           /*ͺ* ββββ    "     B     "       "    "  */
end     /*ͺ*$*/
if newV1\==0  then call GaussnewV3elim              /*ͺ*Not zero?  Then display the results. */
say
do   i=1  for n;  r=0                   /*ͺ*display the residuals to the terminal*/
do j=1  for n;  r=r  +  oa.i.j * x.j  /*ͺ* βββββ  don't display a fraction  if */
end   /*ͺ*j*/                           /*ͺ* β      res βξεχΦ² 5% of significant digs.*/
r= format(r-ob.i, , digits() - digits() * 0.05 % 1 ,  0) / 1   /*ͺ*should be tiny*/
say pad 'residual['right(i, length(n) )"] = " left('', r>=0) r /*ͺ*right justify.*/
end     /*ͺ*i*/
end         /*ͺ*rec*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
GaussnewV3elim: say;              do     j=1  for n;   jp= j + 1
do   i=jp  to n;   newV3= a.j.j / a.i.j
do k=jp  to n;   a.i.k= a.j.k   -   newV3 * a.i.k
end   /*ͺ*k*/
b.i= b.j   -   newV3 * b.i
end     /*ͺ*i*/
end       /*ͺ*j*/
x.n= b.n / a.n.n
do   j=n-1  to 1  by -1;   newV3= 0
do i=j+1  to n;          newV3= newV3   +   a.j.i * x.i
end     /*ͺ*i*/
x.j= (b.j - newV3) / a.j.j
end       /*ͺ*j*/    /*ͺ* [β]  uses backwards substitution.   */
numeric digits                       /*ͺ*for the display,  only use 8 digits. */
say center('solution', 75, "β"); say /*ͺ*a title line for articulated output. */
do o=1  for n;   say right('x['o"] = ", 38)   left('', x.o>=0)    x.o/1
end   /*ͺ*o*/
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Gaussian-elimination\gaussian-elimination-3.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
