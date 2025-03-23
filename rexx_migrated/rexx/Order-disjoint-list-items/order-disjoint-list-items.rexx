/*ª*REXX program orders a  disjoint list  of   M   items  with a list of   N   items.     */
used = '0'x                                      /*ª*indicates that a word has been parsed*/
newV1.   =                                          /*ª*placeholder indicates  endâ”€ofâ”€array, */
newV1.1  =   " the cat sat on the mat        |      mat cat  "                  /*ª*a string.*/
newV1.2  =   " the cat sat on the mat        |      cat mat  "                  /*ª*"    "   */
newV1.3  =   " A B C A B C A B C             |      C A C A  "                  /*ª*"    "   */
newV1.4  =   " A B C A B D A B E             |      E A D A  "                  /*ª*"    "   */
newV1.5  =   " A B                           |      B        "                  /*ª*"    "   */
newV1.6  =   " A B                           |      B A      "                  /*ª*"    "   */
newV1.7  =   " A B B A                       |      B A      "                  /*ª*"    "   */
newV1.8  =   "                               |               "                  /*ª*"    "   */
newV1.9  =   " A                             |      A        "                  /*ª*"    "   */
newV1.10 =   " A B                           |               "                  /*ª*"    "   */
newV1.11 =   " A B B A                       |      A B      "                  /*ª*"    "   */
newV1.12 =   " A B A B                       |      A B      "                  /*ª*"    "   */
newV1.13 =   " A B A B                       |      B A B A  "                  /*ª*"    "   */
newV1.14 =   " A B C C B A                   |      A C A C  "                  /*ª*"    "   */
newV1.15 =   " A B C C B A                   |      C A C A  "                  /*ª*"    "   */
/*ª*  â•â•â•â•â•â•â•â•â•â•â•â•Mâ•â•â•â•â•â•â•â•â•â•â•             â•â•â•â•Nâ•â•â•â•        */

do j=1  while  newV1.j\==''                        /*ª* [â†“]  process each input string (@.).*/
parse var  newV1.j    m   '|'   n                  /*ª*parse input string into   M  and  N. */
newV4= words(m)                                    /*ª*#:   number of words in the  M  list.*/
do i=newV4  for newV4  by -1              /*ª*process list items in reverse order. */
newV5= word(m, i);   newV2.i= newV5;   newV3.newV5= i /*ª*construct the   !.   and  $.  arrays.*/
end   /*ª*i*/
r.=                                            /*ª*nullify the replacement string  [R.] */
do k=1  by 2  for words(n)%2              /*ª* [â†“]  process the  N  array.         */
newV5= word(n, k);         v= word(n, k+1)    /*ª*get an order word and the replacement*/
p1= wordpos(newV5, m);     p2= wordpos(v, m)  /*ª*positions of   "   "   "       "     */
if p1==0 | p2==0  then iterate            /*ª*if either not found, then skip them. */
if newV3.newV5>>newV3.v  then do;   r.p2= newV2.p1;    r.p1= newV2.p2;    end     /*ª*switch the words.*/
else do;   r.p1= newV2.p1;    r.p2= newV2.p2;    end     /*ª*don't switch.    */
newV2.p1= used;    newV2.p2= used                                     /*ª*mark 'em as used.*/
m=
do i=1  for newV4;   m= m newV2.i;    newV5= word(m, i);    newV2.i= newV5;    newV3.newV5= i
end   /*ª*i*/
end   /*ª*k*/                               /*ª* [â†‘]  rebuild the  !. and  $. arrays.*/
mp=                                            /*ª*the  MP  (aka M')  string  (so far). */
do q=1  for newV4;    if newV2.q==used  then mp= mp  r.q              /*ª*use the original.*/
else mp= mp  newV2.q              /*ª*use substitute.  */
end   /*ª*q*/                               /*ª* [â†‘]  reâ”€build the (output) string.  */

say newV1.j   ' â”€â”€â”€â”€â–º '    space(mp)               /*ª*display new reâ”€ordered text â”€â”€â–º term.*/
end        /*ª*j*/                               /*ª* [â†‘]  end of processing for  N  words*/
/*ª*stick a fork in it,  we're all done. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Order-disjoint-list-items\order-disjoint-list-items.rexx was migrated on 23 Mar 2025 at 10:43:23
 * -------------------------------------------------------------------------
*/ 
