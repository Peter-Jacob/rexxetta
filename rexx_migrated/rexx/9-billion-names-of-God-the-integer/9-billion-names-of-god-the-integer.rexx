/*�*REXX program  generates and displays a  number triangle  for partitions of a number.  */
numeric digits 400                               /*�*be able to handle larger numbers.    */
parse arg N .                                    /*�*obtain optional argument from the CL.*/
if N==''  then N= 25                             /*�*N  specified?  Then use the default. */
newV1.= 0;          newV1.0= 1;       aN= abs(N)         /*�*initialize a partition number; AN abs*/
if N==N+0  then say  '         G('aN"):"   G(N)  /*�*just do this for well formed numbers.*/
say  'partitions('aN"):"   partitions(aN)          /*�*do it the easy way.*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
G: procedure; parse arg nn;  newV2.= 0;    newV2.4.2= 2;     mx= 1;    aN= abs(nn);    build= nn>0
do j=1  for aN%2;      newV2.j.j= 1      /*�*gen shortcuts for unity elements.*/
end   /*�*j*/

do     t=1  for 1+build;        newV3.=1 /*�*generate triangle once or twice. */
do   r=1  for aN;   newV3.2= r % 2     /*�*#.2  is a shortcut calculation.  */
do c=3  to  r-2;  newV3.c= gennewV6(r,c)
end   /*�*c*/
L= length(mx);      p= 0;     newV4=  /*�*__  will be a row of the triangle*/
do cc=1  for r; p= p + newV3.cc    /*�*only sum the last row of numbers.*/
if \build  then iterate        /*�*should we skip building triangle?*/
mx= max(mx, newV3.cc)              /*�*used to build the symmetric #s.  */
newV4= newV4  right(newV3.cc, L)         /*�*construct a row of the triangle. */
end   /*�*cc*/
if t==1  then iterate              /*�*Is this 1st time through? No show*/
say  center( strip(newV4),  2 + (aN-1) * (length(mx) + 1) )
end       /*�*r*/                    /*�* [↑]  center row of the triangle.*/
end         /*�*t*/
return p                               /*�*return with the generated number.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
gennewV6: procedure expose newV2.;   parse arg x,y             /*�*obtain the  X and Y  arguments.*/
if newV2.x.y\==0  then  return newV2.x.y                 /*�*was number generated before ?  */
if y>x%2  then do;  nx= x+1-(y-x%2)*2-(x//2==0)
ny= nx % 2;  newV2.x.y= newV2.nx.ny
return newV2.x.y                 /*�*return the calculated number.  */
end                               /*�* [↑]  right half of triangle.  */
newV5= 1                                             /*�* [↓]   left   "   "     "      */
do q=2  for y-1;   xy= x-y;   if q>xy  then iterate
if q==2  then newV5= newV5  +  xy % 2
else if q==xy-1  then newV5= newV5 + 1
else newV5= newV5 + gennewV6(xy,q)    /*�*recurse.*/
end   /*�*q*/
newV2.x.y=newV5; return newV5                                /*�*use memoization; return with #.*/
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
partitions: procedure expose newV1.; parse arg n;   if newV1.n\==0  then return newV1.n   /*�* ◄─────┐*/
newV5= 0                                         /*�*Already known?  Return ►────┘*/
do k=1  for n                       /*�*process  N  partitions.      */
newV6= n - (k*3-1) * k % 2              /*�*calculate a partition number.*/
if newV6<0  then leave                  /*�*Is it negative?  Then leave. */
if newV1.newV6==0  then x= partitions(newV6)    /*�* [◄] this is a recursive call*/
else x= newV1.newV6              /*�*the value is already known.  */
newV6= newV6 - k
if newV6<0  then  y= 0                  /*�*Is negative?   Then use zero.*/
else  if newV1.newV6==0  then y= partitions(p)    /*�*recursive call.*/
else y= newV1.newV6
if k//2  then newV5= newV5 + x + y          /*�*use this method if K is odd. */
else newV5= newV5 - x - y          /*�* "    "     "    " "  " even.*/
end   /*�*k*/                         /*�* [↑]  Euler's recursive func.*/
newV1.n= newV5;             return newV5                 /*�*use memoization;  return num.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\9-billion-names-of-God-the-integer\9-billion-names-of-god-the-integer.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
