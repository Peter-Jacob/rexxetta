/*ͺ*REXX pgm illustrates  N  1stβclass environments  (using numbers from a hailstone seq).*/
parse arg n .                                    /*ͺ*obtain optional argument from the CL.*/
if n=='' | n==","  then n= 12                    /*ͺ*Was N defined?  No, then use default.*/
newV1.=                                              /*ͺ*initialize the array   @.  to  nulls.*/
do i=1  for n;    newV1.i= i      /*ͺ*    "      environments to an index. */
end   /*ͺ*i*/
w= length(n)                                     /*ͺ*width  (so far)  for columnar output.*/

do forever  until newV1.0;  newV1.0= 1          /*ͺ* ββββ process all the environments.  */
do k=1  for n;       x= hailstone(k) /*ͺ*obtain next hailstone number in seq. */
w= max(w, length(x))                 /*ͺ*determine the maximum width needed.  */
newV1.k= newV1.k  x                          /*ͺ* ββββ where the rubber meets the road*/
end   /*ͺ*k*/
end      /*ͺ*forever*/
newV2= 0                                             /*ͺ* [β]   display the tabular results.  */
do lines=-1  until newV3='';     newV3=            /*ͺ*process a line for each environment. */
do j=1  for n                          /*ͺ*process each of the environments.    */
select                             /*ͺ*determine how to process the line.   */
when newV2== 1      then newV3= newV3 right(words(newV1.j) - 1, w)    /*ͺ*environment count.*/
when lines==-1  then newV3= newV3 right(j,  w)                /*ͺ*the title (header)*/
when lines== 0  then newV3= newV3 right('', w, "β")           /*ͺ*the separator line*/
otherwise            newV3= newV3 right(word(newV1.j, lines), w)
end   /*ͺ*select*/
end       /*ͺ*j*/

if newV2==1   then newV2= 2                                           /*ͺ*separator line?   */
if newV3=''   then newV2= newV2 + 1                                       /*ͺ*Null?  Bump the #.*/
if newV2==1   then newV3= copies(" "left('', w, "β"), N)              /*ͺ*the foot separator*/
if newV3\=''  then say strip( substr(newV3, 2), "T")                  /*ͺ*display the counts*/
end   /*ͺ*lines*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
hailstone: procedure expose newV1.; parse arg y;       newV3= word(newV1.y, words(newV1.y) )
if newV3==1  then return '';   newV1.0= 0;   if newV3//2  then return newV3*3 + 1;   return newV3%2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\First-class-environments\first-class-environments.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
