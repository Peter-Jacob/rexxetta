/*�*REXX program  finds  (and maybe displays)  Smith  (or joke)  numbers up to a given  N.*/
parse arg N .                                    /*�*obtain optional argument from the CL.*/
if N=='' | N==","  then N=10000                  /*�*Not specified?  Then use the default.*/
tell= (N>0);            N=abs(N) - 1             /*�*use the  │N│  for computing  (below).*/
w=length(N)                                      /*�*W:  used for aligning Smith numbers. */
newV1=0                                              /*�*#:  Smith numbers found  (so far).   */
newV2=;  do j=4  to  N;                              /*�*process almost all numbers up to  N. */
if sumD(j) \== sumfactr(j)  then iterate    /*�*Not a Smith number?   Then ignore it.*/
newV1=newV1+1                                       /*�*bump the Smith number counter.       */
if \tell  then iterate                      /*�*Not showing the numbers? Keep looking*/
newV2=newV2 right(j, w);         if length(newV2)>199  then do;    say substr(newV2, 2);    newV2=;   end
end   /*�*j*/                                 /*�* [↑]  if N>0,  then display Smith #s.*/

if newV2\==''  then say substr(newV2, 2)                 /*�*if any residual Smith #s, display 'em*/
say                                              /*�* [↓]  display the number of Smith #s.*/
say newV1    ' Smith numbers found  ����ֳ '   N"."       /*�*display number of Smith numbers found*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sumD:     parse arg x 1 s 2;   do d=2  for length(x)-1; s=s+substr(x,d,1); end;   return s
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
sumFactr: procedure;  parse arg z;       newV3=0;    f=0             /*�*obtain the Z number. */
do  while z//2==0;  newV3=newV3+2;  f=f+1;  z=z% 2;  end    /*�*maybe add factor of 2*/
do  while z//3==0;  newV3=newV3+3;  f=f+1;  z=z% 3;  end    /*�*  "    "     "    " 3*/
/*�*                  ___*/
do j=5  by 2  while j<=z  &  j*j<=n                 /*�*minimum of Z or  √ N */
if j//3==0  then iterate                            /*�*skip factors that ÷ 3*/
do while z//j==0; f=f+1; newV3=newV3+sumD(j); z=z%j; end /*�*maybe reduce  Z by J */
end   /*�*j*/                                         /*�* [↓]  Z:  what's left*/
if z\==1  then do;      f=f+1; newV3=newV3+sumD(z);        end /*�*Residual?  Then add Z*/
if f<2    then return 0                                /*�*Prime?   Not a Smith#*/
return newV3                                /*�*else return sum digs.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Smith-numbers\smith-numbers-1.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
