/*ª*REXX pgm finds positive integers when shown in hex that can't be written with dec digs*/
parse arg n cols .                               /*ª*obtain optional argument from the CL.*/
if    n=='' |    n==","  then   n = 100          /*ª*Not specified?  Then use the default.*/
if cols=='' | cols==","  then cols=  10          /*ª* "      "         "   "   "     "    */
w= 10                                            /*ª*width of a number in any column.     */
title= ' the product of the decimal digits of  N,  where  N  < '  n
say ' index â”‚'center(title, 1 + cols*(w+1)     ) /*ª*display the title for the output.    */
say 'â”€â”€â”€â”€â”€â”€â”€â”¼'center(""   , 1 + cols*(w+1), 'â”€') /*ª*   "     a   sep   "   "     "       */
newV1=;                                       idx= 1 /*ª*list of products (so far); IDX=index.*/
do newV2=1  for n;   L= length(newV2)                /*ª*find products of the dec. digs of J. */
p= left(newV2, 1)                                /*ª*use first digit as the product so far*/
do j=2  for L-1  until p==0 /*ª*add an optimization when product is 0*/
p= p * substr(newV2, j, 1)      /*ª*multiply the product by the next dig.*/
end   /*ª*j*/
newV1= newV1 right(p, w)                             /*ª*add the product  â”€â”€â”€â–º  the  $  list. */
if newV2//cols \== 0  then iterate               /*ª*have we populated a line of output?  */
say center(idx, 7)'â”‚'  substr(newV1, 2);    newV1=   /*ª*display what we have so far  (cols). */
idx= idx + cols                              /*ª*bump the  index  count for the output*/
end   /*ª*#*/                                  /*ª*stick a fork in it,  we're all done. */

if newV1\==''  then say center(idx, 7)"â”‚"  substr(newV1, 2)  /*ª*possible display residual output.*/
say 'â”€â”€â”€â”€â”€â”€â”€â”´'center(""   , 1 + cols*(w+1), 'â”€')     /*ª*display the foot sep for output. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Digital-root-Multiplicative-digital-root\digital-root-multiplicative-digital-root-3.rexx was migrated on 23 Mar 2025 at 10:43:11
 * -------------------------------------------------------------------------
*/ 
