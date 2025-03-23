/*�*REXX program sorts three (any value)  variables  (X, Y, and  Z)  into ascending order.*/
parse arg x y z .                                /*�*obtain the three variables from C.L. */
if x=='' | x==","  then x= 'lions, tigers, and'        /*�*Not specified?  Use the default*/
if y=='' | y==","  then y= 'bears,  oh my!'            /*�* "      "        "   "     "   */
if z=='' | z==","  then z= '(from "The Wizard of Oz")' /*�* "      "        "   "     "   */
say '───── original value of X: '   x
say '───── original value of Y: '   y
say '───── original value of Z: '   z
if x>y  then do;   newV1= x;   x= y;   y= newV1;   end   /*�*swap the values of   X   and   Y.    */      /*�* ◄─── sorting.*/
if y>z  then do;   newV1= y;   y= z;   z= newV1;   end   /*�*  "   "     "    "   Y    "    Z.    */      /*�* ◄─── sorting.*/
if x>y  then do;   newV1= x;   x= y;   y= newV1;   end   /*�*  "   "     "    "   X    "    Y.    */      /*�* ◄─── sorting */
say                                              /*�*stick a fork in it,  we're all done. */
say '═════  sorted  value of X: '   x
say '═════  sorted  value of Y: '   y
say '═════  sorted  value of Z: '   z
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Sort-three-variables\sort-three-variables-1.rexx was migrated on 23 Mar 2025 at 10:43:29
 * -------------------------------------------------------------------------
*/ 
