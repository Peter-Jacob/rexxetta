/*�*REXX program  calculates  the   Cartesian product   of two  arbitrary-sized  lists.   */
newV1.=                                              /*�*assign the default value to  @. array*/
parse arg newV1.1                                    /*�*obtain the optional value of  @.1    */
if newV1.1=''  then do;  newV1.1= "{1,2} {3,4}"          /*�*Not specified?  Then use the defaults*/
newV1.2= "{3,4} {1,2}"          /*�* "      "         "   "   "      "   */
newV1.3= "{1,2} {}"             /*�* "      "         "   "   "      "   */
newV1.4= "{}    {3,4}"          /*�* "      "         "   "   "      "   */
newV1.5= "{1,2} {3,4,5}"        /*�* "      "         "   "   "      "   */
end
/*�* [↓]  process each of the  @.n values*/
do n=1  while newV1.n \= ''                        /*�*keep processing while there's a value*/
z= translate( space( newV1.n, 0),  ,  ',')         /*�*translate the  commas  to blanks.    */
do newV2=1  until z==''                         /*�*process each elements in first list. */
parse var  z   '{'  x.newV2  '}'   z            /*�*parse the list  (contains elements). */
end   /*�*#*/
newV3=
do       i=1   for newV2-1                      /*�*process the subsequent lists.        */
do     a=1   for words(x.i)               /*�*obtain the elements of the first list*/
do   j=i+1 for newV2-1                      /*�*   "    "  subsequent lists.         */
do b=1   for words(x.j)               /*�*   "    " elements of subsequent list*/
newV3=newV3',('word(x.i, a)","word(x.j, b)')' /*�*append partial Cartesian product ──►$*/
end   /*�*b*/
end     /*�*j*/
end       /*�*a*/
end         /*�*i*/
say 'Cartesian product of '       space(newV1.n)       " is ───► {"substr(newV3, 2)'}'
end            /*�*n*/                           /*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Cartesian-product-of-two-or-more-lists\cartesian-product-of-two-or-more-lists-1.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
