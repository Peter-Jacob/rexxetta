/*ͺ*REXX program finds and displays MΓΌnchhausen numbers from one to a specified number (Z)*/
newV2.= 0;         do i=1  for 9;  newV2.i= i**i;  end   /*ͺ*precompute powers for non-zero digits*/
parse arg z .                                    /*ͺ*obtain optional argument from the CL.*/
if z=='' | z==","  then z= 5000                  /*ͺ*Not specified?  Then use the default.*/
newV1='is a MΓΌnchhausen number.';   do j=1  for z  /*ͺ* [β]  traipse through all the numbers*/
if isMunch(j)  then say  right(j, 11)    newV1
end   /*ͺ*j*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isMunch: parse arg x 1 ox;  newV3= 0;   do  until  x==''  |  newV3>ox       /*ͺ*stop if too large.*/
parse var x newV4 +1 x;  newV3= newV3 + newV2.newV4 /*ͺ*add the next power*/
end   /*ͺ*while*/                 /*ͺ* [β]  get a digit.*/
return newV3==ox                                               /*ͺ*it is or it ain't.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Munchausen-numbers\munchausen-numbers-2.rexx was migrated on 23 Mar 2025 at 10:43:21
 * -------------------------------------------------------------------------
*/ 
