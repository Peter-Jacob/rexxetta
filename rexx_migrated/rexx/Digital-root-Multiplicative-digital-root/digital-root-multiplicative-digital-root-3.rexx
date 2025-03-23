/*�*REXX pgm finds positive integers when shown in hex that can't be written with dec digs*/
parse arg n cols .                               /*�*obtain optional argument from the CL.*/
if    n=='' |    n==","  then   n = 100          /*�*Not specified?  Then use the default.*/
if cols=='' | cols==","  then cols=  10          /*�* "      "         "   "   "     "    */
w= 10                                            /*�*width of a number in any column.     */
title= ' the product of the decimal digits of  N,  where  N  < '  n
say ' index │'center(title, 1 + cols*(w+1)     ) /*�*display the title for the output.    */
say '───────┼'center(""   , 1 + cols*(w+1), '─') /*�*   "     a   sep   "   "     "       */
newV1=;                                       idx= 1 /*�*list of products (so far); IDX=index.*/
do newV2=1  for n;   L= length(newV2)                /*�*find products of the dec. digs of J. */
p= left(newV2, 1)                                /*�*use first digit as the product so far*/
do j=2  for L-1  until p==0 /*�*add an optimization when product is 0*/
p= p * substr(newV2, j, 1)      /*�*multiply the product by the next dig.*/
end   /*�*j*/
newV1= newV1 right(p, w)                             /*�*add the product  ───►  the  $  list. */
if newV2//cols \== 0  then iterate               /*�*have we populated a line of output?  */
say center(idx, 7)'│'  substr(newV1, 2);    newV1=   /*�*display what we have so far  (cols). */
idx= idx + cols                              /*�*bump the  index  count for the output*/
end   /*�*#*/                                  /*�*stick a fork in it,  we're all done. */

if newV1\==''  then say center(idx, 7)"│"  substr(newV1, 2)  /*�*possible display residual output.*/
say '───────┴'center(""   , 1 + cols*(w+1), '─')     /*�*display the foot sep for output. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Digital-root-Multiplicative-digital-root\digital-root-multiplicative-digital-root-3.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
