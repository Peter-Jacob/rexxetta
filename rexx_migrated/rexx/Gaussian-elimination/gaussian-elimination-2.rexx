/*ͺ*REXX program solves   Ax=b   with Gaussian elimination  and  backwards  substitution. */
numeric digits 1000                              /*ͺ*heavyβduty decimal digits precision. */
parse arg iFID .                                 /*ͺ*obtain optional argument from the CL.*/
if iFID=='' | iFID=="," then iFID= 'GAUSS_E.DAT' /*ͺ*Not specified?  Then use the default.*/
do rec=1    while lines(iFID) \== 0         /*ͺ*read the equation sets.              */
newV1= 0                                        /*ͺ*the number of equations  (so far).   */
do newV2=1  while lines(iFID) \== 0         /*ͺ*process the equation.                */
z= linein(iFID);   if z=''  then leave  /*ͺ*Is this a blank line?    endβofβdata.*/
if newV2==1  then do;  say;     say center(' equations ', 75, "β");        say
end                       /*ͺ* [β]  if 1st equation, then show hdr.*/
say z                                   /*ͺ*display an equation to the terminal. */
if left(space(z), 1)=='*'  then iterate /*ͺ*Is this a comment?    Then ignore it.*/
newV1= newV1 + 1;     n= words(z) - 1           /*ͺ*assign equation #; calculate # items.*/
do e=1  for n;     a.newV1.e= word(z, e)
end   /*ͺ*e*/                           /*ͺ* [β]  process  A  numbers.           */
b.newV1= word(z, n + 1)                     /*ͺ* ββββ    "     B     "               */
end     /*ͺ*$*/
if newV1\==0  then call GaussnewV3elim              /*ͺ*Not zero?  Then display the results. */
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
 * REXX C:\Users\PeterJ\rexxetta\rexx\Gaussian-elimination\gaussian-elimination-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
