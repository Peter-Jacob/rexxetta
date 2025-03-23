/*�*REXX pgm illustrates  N  1st─class environments  (using numbers from a hailstone seq).*/
parse arg n .                                    /*�*obtain optional argument from the CL.*/
if n=='' | n==","  then n= 12                    /*�*Was N defined?  No, then use default.*/
newV1.=                                              /*�*initialize the array   @.  to  nulls.*/
do i=1  for n;    newV1.i= i      /*�*    "      environments to an index. */
end   /*�*i*/
w= length(n)                                     /*�*width  (so far)  for columnar output.*/

do forever  until newV1.0;  newV1.0= 1          /*�* ◄─── process all the environments.  */
do k=1  for n;       x= hailstone(k) /*�*obtain next hailstone number in seq. */
w= max(w, length(x))                 /*�*determine the maximum width needed.  */
newV1.k= newV1.k  x                          /*�* ◄─── where the rubber meets the road*/
end   /*�*k*/
end      /*�*forever*/
newV2= 0                                             /*�* [↓]   display the tabular results.  */
do lines=-1  until newV3='';     newV3=            /*�*process a line for each environment. */
do j=1  for n                          /*�*process each of the environments.    */
select                             /*�*determine how to process the line.   */
when newV2== 1      then newV3= newV3 right(words(newV1.j) - 1, w)    /*�*environment count.*/
when lines==-1  then newV3= newV3 right(j,  w)                /*�*the title (header)*/
when lines== 0  then newV3= newV3 right('', w, "─")           /*�*the separator line*/
otherwise            newV3= newV3 right(word(newV1.j, lines), w)
end   /*�*select*/
end       /*�*j*/

if newV2==1   then newV2= 2                                           /*�*separator line?   */
if newV3=''   then newV2= newV2 + 1                                       /*�*Null?  Bump the #.*/
if newV2==1   then newV3= copies(" "left('', w, "═"), N)              /*�*the foot separator*/
if newV3\=''  then say strip( substr(newV3, 2), "T")                  /*�*display the counts*/
end   /*�*lines*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hailstone: procedure expose newV1.; parse arg y;       newV3= word(newV1.y, words(newV1.y) )
if newV3==1  then return '';   newV1.0= 0;   if newV3//2  then return newV3*3 + 1;   return newV3%2
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\First-class-environments\first-class-environments.rexx was migrated on 23 Mar 2025 at 10:43:13
 * -------------------------------------------------------------------------
*/ 
