/*ͺ*REXX program calculates and displays the equilibrium index for a numeric array (list).*/
parse arg x                                      /*ͺ*obtain the optional arguments from CL*/
if x=''  then x= copies(" 7 -7", 50)   7         /*ͺ*Not specified?  Then use the default.*/
say '         array list: '     space(x)         /*ͺ*echo the array list to the terminal. */
newV2= words(x)                                      /*ͺ*the number of elements in the X list.*/
do j=0  for newV2;   newV1.j= word(x, j+1) /*ͺ*zeroβstart is for zeroβbased array.  */
end   /*ͺ*j*/                        /*ͺ* [β]  assign   @.0   @.1   @.3  Β·Β·Β·  */
say                                              /*ͺ*  Β·Β·Β· and also display a blank line. */
answer= equilibriumIDX();       w= words(answer) /*ͺ*calculate the  equilibrium index.    */
say 'equilibrium'  word("(none) index: indices:",   1 + (w>0) + (w>1))        answer
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
equilibriumIDX: newV3=;     do i=0  for newV2;           sum= 0
do k=0  for newV2;   sum= sum  +  newV1.k * sign(k-i);   end /*ͺ*k*/
if sum==0  then newV3= newV3 i
end   /*ͺ*i*/              /*ͺ* [β] Zero? Found an equilibrium index*/
return newV3                         /*ͺ*return equilibrium list (may be null)*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Equilibrium-index\equilibrium-index-1.rexx was migrated on 23 Mar 2025 at 10:43:12
 * -------------------------------------------------------------------------
*/ 
