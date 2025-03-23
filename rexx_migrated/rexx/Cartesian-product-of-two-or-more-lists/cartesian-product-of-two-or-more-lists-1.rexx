/*ª*REXX program  calculates  the   Cartesian product   of two  arbitrary-sized  lists.   */
newV1.=                                              /*ª*assign the default value to  @. array*/
parse arg newV1.1                                    /*ª*obtain the optional value of  @.1    */
if newV1.1=''  then do;  newV1.1= "{1,2} {3,4}"          /*ª*Not specified?  Then use the defaults*/
newV1.2= "{3,4} {1,2}"          /*ª* "      "         "   "   "      "   */
newV1.3= "{1,2} {}"             /*ª* "      "         "   "   "      "   */
newV1.4= "{}    {3,4}"          /*ª* "      "         "   "   "      "   */
newV1.5= "{1,2} {3,4,5}"        /*ª* "      "         "   "   "      "   */
end
/*ª* [â†“]  process each of the  @.n values*/
do n=1  while newV1.n \= ''                        /*ª*keep processing while there's a value*/
z= translate( space( newV1.n, 0),  ,  ',')         /*ª*translate the  commas  to blanks.    */
do newV2=1  until z==''                         /*ª*process each elements in first list. */
parse var  z   '{'  x.newV2  '}'   z            /*ª*parse the list  (contains elements). */
end   /*ª*#*/
newV3=
do       i=1   for newV2-1                      /*ª*process the subsequent lists.        */
do     a=1   for words(x.i)               /*ª*obtain the elements of the first list*/
do   j=i+1 for newV2-1                      /*ª*   "    "  subsequent lists.         */
do b=1   for words(x.j)               /*ª*   "    " elements of subsequent list*/
newV3=newV3',('word(x.i, a)","word(x.j, b)')' /*ª*append partial Cartesian product â”€â”€â–º$*/
end   /*ª*b*/
end     /*ª*j*/
end       /*ª*a*/
end         /*ª*i*/
say 'Cartesian product of '       space(newV1.n)       " is â”€â”€â”€â–º {"substr(newV3, 2)'}'
end            /*ª*n*/                           /*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Cartesian-product-of-two-or-more-lists\cartesian-product-of-two-or-more-lists-1.rexx was migrated on 23 Mar 2025 at 10:43:07
 * -------------------------------------------------------------------------
*/ 
