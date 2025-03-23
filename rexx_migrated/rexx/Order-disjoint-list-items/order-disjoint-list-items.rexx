/*�*REXX program orders a  disjoint list  of   M   items  with a list of   N   items.     */
used = '0'x                                      /*�*indicates that a word has been parsed*/
newV1.   =                                          /*�*placeholder indicates  end─of─array, */
newV1.1  =   " the cat sat on the mat        |      mat cat  "                  /*�*a string.*/
newV1.2  =   " the cat sat on the mat        |      cat mat  "                  /*�*"    "   */
newV1.3  =   " A B C A B C A B C             |      C A C A  "                  /*�*"    "   */
newV1.4  =   " A B C A B D A B E             |      E A D A  "                  /*�*"    "   */
newV1.5  =   " A B                           |      B        "                  /*�*"    "   */
newV1.6  =   " A B                           |      B A      "                  /*�*"    "   */
newV1.7  =   " A B B A                       |      B A      "                  /*�*"    "   */
newV1.8  =   "                               |               "                  /*�*"    "   */
newV1.9  =   " A                             |      A        "                  /*�*"    "   */
newV1.10 =   " A B                           |               "                  /*�*"    "   */
newV1.11 =   " A B B A                       |      A B      "                  /*�*"    "   */
newV1.12 =   " A B A B                       |      A B      "                  /*�*"    "   */
newV1.13 =   " A B A B                       |      B A B A  "                  /*�*"    "   */
newV1.14 =   " A B C C B A                   |      A C A C  "                  /*�*"    "   */
newV1.15 =   " A B C C B A                   |      C A C A  "                  /*�*"    "   */
/*�*  ════════════M═══════════             ════N════        */

do j=1  while  newV1.j\==''                        /*�* [↓]  process each input string (@.).*/
parse var  newV1.j    m   '|'   n                  /*�*parse input string into   M  and  N. */
newV4= words(m)                                    /*�*#:   number of words in the  M  list.*/
do i=newV4  for newV4  by -1              /*�*process list items in reverse order. */
newV5= word(m, i);   newV2.i= newV5;   newV3.newV5= i /*�*construct the   !.   and  $.  arrays.*/
end   /*�*i*/
r.=                                            /*�*nullify the replacement string  [R.] */
do k=1  by 2  for words(n)%2              /*�* [↓]  process the  N  array.         */
newV5= word(n, k);         v= word(n, k+1)    /*�*get an order word and the replacement*/
p1= wordpos(newV5, m);     p2= wordpos(v, m)  /*�*positions of   "   "   "       "     */
if p1==0 | p2==0  then iterate            /*�*if either not found, then skip them. */
if newV3.newV5>>newV3.v  then do;   r.p2= newV2.p1;    r.p1= newV2.p2;    end     /*�*switch the words.*/
else do;   r.p1= newV2.p1;    r.p2= newV2.p2;    end     /*�*don't switch.    */
newV2.p1= used;    newV2.p2= used                                     /*�*mark 'em as used.*/
m=
do i=1  for newV4;   m= m newV2.i;    newV5= word(m, i);    newV2.i= newV5;    newV3.newV5= i
end   /*�*i*/
end   /*�*k*/                               /*�* [↑]  rebuild the  !. and  $. arrays.*/
mp=                                            /*�*the  MP  (aka M')  string  (so far). */
do q=1  for newV4;    if newV2.q==used  then mp= mp  r.q              /*�*use the original.*/
else mp= mp  newV2.q              /*�*use substitute.  */
end   /*�*q*/                               /*�* [↑]  re─build the (output) string.  */

say newV1.j   ' ────► '    space(mp)               /*�*display new re─ordered text ──► term.*/
end        /*�*j*/                               /*�* [↑]  end of processing for  N  words*/
/*�*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Order-disjoint-list-items\order-disjoint-list-items.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
