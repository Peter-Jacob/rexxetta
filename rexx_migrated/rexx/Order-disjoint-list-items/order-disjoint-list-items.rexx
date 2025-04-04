/*ͺ*REXX program orders a  disjoint list  of   M   items  with a list of   N   items.     */
used = '0'x                                      /*ͺ*indicates that a word has been parsed*/
newV1.   =                                          /*ͺ*placeholder indicates  endβofβarray, */
newV1.1  =   " the cat sat on the mat        |      mat cat  "                  /*ͺ*a string.*/
newV1.2  =   " the cat sat on the mat        |      cat mat  "                  /*ͺ*"    "   */
newV1.3  =   " A B C A B C A B C             |      C A C A  "                  /*ͺ*"    "   */
newV1.4  =   " A B C A B D A B E             |      E A D A  "                  /*ͺ*"    "   */
newV1.5  =   " A B                           |      B        "                  /*ͺ*"    "   */
newV1.6  =   " A B                           |      B A      "                  /*ͺ*"    "   */
newV1.7  =   " A B B A                       |      B A      "                  /*ͺ*"    "   */
newV1.8  =   "                               |               "                  /*ͺ*"    "   */
newV1.9  =   " A                             |      A        "                  /*ͺ*"    "   */
newV1.10 =   " A B                           |               "                  /*ͺ*"    "   */
newV1.11 =   " A B B A                       |      A B      "                  /*ͺ*"    "   */
newV1.12 =   " A B A B                       |      A B      "                  /*ͺ*"    "   */
newV1.13 =   " A B A B                       |      B A B A  "                  /*ͺ*"    "   */
newV1.14 =   " A B C C B A                   |      A C A C  "                  /*ͺ*"    "   */
newV1.15 =   " A B C C B A                   |      C A C A  "                  /*ͺ*"    "   */
/*ͺ*  ββββββββββββMβββββββββββ             ββββNββββ        */

do j=1  while  newV1.j\==''                        /*ͺ* [β]  process each input string (@.).*/
parse var  newV1.j    m   '|'   n                  /*ͺ*parse input string into   M  and  N. */
newV4= words(m)                                    /*ͺ*#:   number of words in the  M  list.*/
do i=newV4  for newV4  by -1              /*ͺ*process list items in reverse order. */
newV5= word(m, i);   newV2.i= newV5;   newV3.newV5= i /*ͺ*construct the   !.   and  $.  arrays.*/
end   /*ͺ*i*/
r.=                                            /*ͺ*nullify the replacement string  [R.] */
do k=1  by 2  for words(n)%2              /*ͺ* [β]  process the  N  array.         */
newV5= word(n, k);         v= word(n, k+1)    /*ͺ*get an order word and the replacement*/
p1= wordpos(newV5, m);     p2= wordpos(v, m)  /*ͺ*positions of   "   "   "       "     */
if p1==0 | p2==0  then iterate            /*ͺ*if either not found, then skip them. */
if newV3.newV5>>newV3.v  then do;   r.p2= newV2.p1;    r.p1= newV2.p2;    end     /*ͺ*switch the words.*/
else do;   r.p1= newV2.p1;    r.p2= newV2.p2;    end     /*ͺ*don't switch.    */
newV2.p1= used;    newV2.p2= used                                     /*ͺ*mark 'em as used.*/
m=
do i=1  for newV4;   m= m newV2.i;    newV5= word(m, i);    newV2.i= newV5;    newV3.newV5= i
end   /*ͺ*i*/
end   /*ͺ*k*/                               /*ͺ* [β]  rebuild the  !. and  $. arrays.*/
mp=                                            /*ͺ*the  MP  (aka M')  string  (so far). */
do q=1  for newV4;    if newV2.q==used  then mp= mp  r.q              /*ͺ*use the original.*/
else mp= mp  newV2.q              /*ͺ*use substitute.  */
end   /*ͺ*q*/                               /*ͺ* [β]  reβbuild the (output) string.  */

say newV1.j   ' βββββΊ '    space(mp)               /*ͺ*display new reβordered text βββΊ term.*/
end        /*ͺ*j*/                               /*ͺ* [β]  end of processing for  N  words*/
/*ͺ*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Order-disjoint-list-items\order-disjoint-list-items.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
