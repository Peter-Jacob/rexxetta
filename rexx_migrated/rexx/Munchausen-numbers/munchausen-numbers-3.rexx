/*ͺ*REXX program finds and displays MΓΌnchhausen numbers from one to a specified number (Z)*/
newV2.= 0;         do i=1  for 9;  newV2.i= i**i;  end   /*ͺ*precompute powers for non-zero digits*/
parse arg z .                                    /*ͺ*obtain optional argument from the CL.*/
if z=='' | z==","  then z= 5000                  /*ͺ*Not specified?  Then use the default.*/
newV1='is a MΓΌnchhausen number.';   do j=1  for z  /*ͺ* [β]  traipse through all the numbers*/
if isMunch(j)  then say  right(j, 11)    newV1
end   /*ͺ*j*/
exit                                             /*ͺ*stick a fork in it,  we're all done. */
/*ͺ*ββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββββ*/
isMunch: parse arg a 2 b 3 c 4 d 5 e 6 x 1 ox; newV3=newV2.a+newV2.b+newV2.c+newV2.d+newV2.e /*ͺ*sum 1st 5 digits.*/
if newV3>ox  then return 0                                      /*ͺ*is sum too large?*/
do  while  x\==''  &  newV3<=ox        /*ͺ*any more digits ?*/
parse var x newV4 +1 x;   newV3= newV3 + newV2.newV4   /*ͺ*sum 6th & up digs*/
end   /*ͺ*while*/
return newV3==ox                                                /*ͺ*it is or it ain't*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Munchausen-numbers\munchausen-numbers-3.rexx was migrated on 23 Mar 2025 at 10:43:22
 * -------------------------------------------------------------------------
*/ 
