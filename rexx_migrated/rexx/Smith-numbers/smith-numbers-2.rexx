/*ͺ*REXX program  finds  (and maybe displays)  Smith  (or joke)  numbers up to a given  N.*/
parse arg N .                                    /*ͺ*obtain optional argument from the CL.*/
if N=='' | N==","  then N=10000                  /*ͺ*Not specified?  Then use the default.*/
tell= (N>0);            N=abs(N) - 1             /*ͺ*use the  βNβ  for computing  (below).*/
newV1=0                                              /*ͺ*the number of Smith numbers (so far).*/
w=length(N)                                      /*ͺ*W:  used for aligning Smith numbers. */
newV2=;    do j=4  for  max(0, N-3)                  /*ͺ*process almost all numbers up to  N. */
if sumD(j) \== sumFactr(j)  then iterate  /*ͺ*Not a Smith number?   Then ignore it.*/
newV1=newV1+1                                     /*ͺ*bump the Smith number counter.       */
if \tell  then iterate                    /*ͺ*Not showing the numbers? Keep looking*/
newV2=newV2 right(j, w);        if length(newV2)>199 then do;   say substr(newV2, 2);    newV2=;    end
end   /*ͺ*j*/                               /*ͺ* [β]  if N>0,  then display Smith #s.*/

if newV2\==''  then say substr(newV2, 2)                 /*ͺ*if any residual Smith #s, display 'em*/
say                                              /*ͺ* [β]  display the number of Smith #s.*/
say newV1   ' Smith numbers found  βξεχΦ³ '  max(0,N)"."  /*ͺ*display number of Smith numbers found*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sumD:     parse arg x 1 s 2;   do d=2  for length(x)-1; s=s+substr(x,d,1); end;   return s
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sumFactr: procedure;  parse arg z;      newV3=0;   f=0           /*ͺ*obtain  Z  number (arg1).*/
do  while z// 2==0; newV3=newV3+ 2; f=f+1; z=z% 2;  end /*ͺ*maybe add factor of   2. */
do  while z// 3==0; newV3=newV3+ 3; f=f+1; z=z% 3;  end /*ͺ*  "    "     "    "   3. */
do  while z// 5==0; newV3=newV3+ 5; f=f+1; z=z% 5;  end /*ͺ*  "    "     "    "   5. */
do  while z// 7==0; newV3=newV3+ 7; f=f+1; z=z% 7;  end /*ͺ*  "    "     "    "   7. */
t=z;  r=0;  q=1;       do while q<=t; q=q*4;   end /*ͺ*R:  will be the iSqrt(Z).*/
do while q>1;  q=q%4;  newV4=t-r-q;  r=r%2;  if newV4>=0  then do;  t=newV4;  r=r+q;  end
end   /*ͺ*while q>1*/                             /*ͺ* [β] compute int. SQRT(Z)*/

do j=11  by 6  to r  while j<=z                 /*ͺ*skip factors that are Γ· 3*/
parse var  j  ''  -1  newV4;     if newV4\==5 then,     /*ͺ*is last dec. digit Β¬a 5 ?*/
do  while z//j==0; f=f+1; newV3=newV3+sumD(j); z=z%j; end   /*ͺ*maybe reduce Z by J*/
if newV4==3  then iterate;      y=j+2
do  while z//y==0; f=f+1; newV3=newV3+sumD(y); z=z%y; end   /*ͺ*maybe reduce Z by Y*/
end   /*ͺ*j*/                                     /*ͺ* [β]  Z  is what's left. */
if z\==1  then do;      f=f+1; newV3=newV3+sumD(z);  end   /*ͺ*if a residual, then add Z*/
if f<2    then return 0                            /*ͺ*Is prime? It's not Smith#*/
return newV3                            /*ͺ*else, return sum of digs.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Smith-numbers\smith-numbers-2.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
