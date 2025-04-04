/*ͺ*REXX program  finds  (and maybe displays)  Smith  (or joke)  numbers up to a given  N.*/
parse arg N .                                    /*ͺ*obtain optional argument from the CL.*/
if N=='' | N==","  then N=10000                  /*ͺ*Not specified?  Then use the default.*/
tell= (N>0);            N=abs(N) - 1             /*ͺ*use the  βNβ  for computing  (below).*/
w=length(N)                                      /*ͺ*W:  used for aligning Smith numbers. */
newV1=0                                              /*ͺ*#:  Smith numbers found  (so far).   */
newV2=;  do j=4  to  N;                              /*ͺ*process almost all numbers up to  N. */
if sumD(j) \== sumfactr(j)  then iterate    /*ͺ*Not a Smith number?   Then ignore it.*/
newV1=newV1+1                                       /*ͺ*bump the Smith number counter.       */
if \tell  then iterate                      /*ͺ*Not showing the numbers? Keep looking*/
newV2=newV2 right(j, w);         if length(newV2)>199  then do;    say substr(newV2, 2);    newV2=;   end
end   /*ͺ*j*/                                 /*ͺ* [β]  if N>0,  then display Smith #s.*/

if newV2\==''  then say substr(newV2, 2)                 /*ͺ*if any residual Smith #s, display 'em*/
say                                              /*ͺ* [β]  display the number of Smith #s.*/
say newV1    ' Smith numbers found  βξεχΦ³ '   N"."       /*ͺ*display number of Smith numbers found*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sumD:     parse arg x 1 s 2;   do d=2  for length(x)-1; s=s+substr(x,d,1); end;   return s
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
sumFactr: procedure;  parse arg z;       newV3=0;    f=0             /*ͺ*obtain the Z number. */
do  while z//2==0;  newV3=newV3+2;  f=f+1;  z=z% 2;  end    /*ͺ*maybe add factor of 2*/
do  while z//3==0;  newV3=newV3+3;  f=f+1;  z=z% 3;  end    /*ͺ*  "    "     "    " 3*/
/*ͺ*                  ___*/
do j=5  by 2  while j<=z  &  j*j<=n                 /*ͺ*minimum of Z or  β N */
if j//3==0  then iterate                            /*ͺ*skip factors that Γ· 3*/
do while z//j==0; f=f+1; newV3=newV3+sumD(j); z=z%j; end /*ͺ*maybe reduce  Z by J */
end   /*ͺ*j*/                                         /*ͺ* [β]  Z:  what's left*/
if z\==1  then do;      f=f+1; newV3=newV3+sumD(z);        end /*ͺ*Residual?  Then add Z*/
if f<2    then return 0                                /*ͺ*Prime?   Not a Smith#*/
return newV3                                /*ͺ*else return sum digs.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Smith-numbers\smith-numbers-1.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
