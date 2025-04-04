/*ͺ*REXX program determines if a number (in base 10)  is a  selfβdescribing,              */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββ  selfβdescriptive,             */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββ  autobiographical,   or a      */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββ  curious  number.              */
parse arg x y .                                  /*ͺ*obtain optional arguments from the CL*/
if x=='' | x==","  then exit                     /*ͺ*Not specified?  Then get out of Dodge*/
if y=='' | y==","  then y=x                      /*ͺ* "      "       Then use the X value.*/
w=length(y)                                      /*ͺ*use  Y's  width for aligned output.  */
numeric digits max(9, w)                         /*ͺ*ensure we can handle larger numbers. */
if x==y  then do                                 /*ͺ*handle the case of a single number.  */
noYes=test_SDN(y)                  /*ͺ*is it  or  ain't it?                 */
say y  word("is isn't", noYes+1)  'a self-describing number.'
exit
end

do n=x  to  y
if test_SDN(n)  then iterate            /*ͺ*if not selfβdescribing,  try again.  */
say  right(n,w)  'is a self-describing number.'                       /*ͺ*is it? */
end   /*ͺ*n*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
test_SDN: procedure; parse arg newV1;    L=length(newV1) /*ͺ*obtain the argument  and  its length.*/
do j=L  to 1  by -1          /*ͺ*parsing backwards is slightly faster.*/
if substr(newV1,j,1)\==L-length(space(translate(newV1,,j-1),0))  then return 1
end   /*ͺ*j*/
return 0                               /*ͺ*faster if used inverted truth table. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Self-describing-numbers\self-describing-numbers-1.rexx was migrated on 23 Mar 2025 at 10:43:28
 * -------------------------------------------------------------------------
*/ 
