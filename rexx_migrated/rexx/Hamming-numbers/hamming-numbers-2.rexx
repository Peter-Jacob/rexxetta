/*�*REXX program computes  Hamming numbers:  1 ──► 20,   # 1691,   and  the one millionth.*/
call hamming       1, 20                         /*�*show the 1st ──► twentieth Hamming #s*/
call hamming    1691                             /*�*show the 1,691st Hamming number.     */
call hamming 1000000                             /*�*show the  1 millionth Hamming number.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hamming: procedure; arg x,y;  if y==''  then y= x;  w= length(y);  L= length(y-1); p= 2**L
numeric digits max(9, p + p%4 + p%16)   /*�*ensure enough decimal digits.        */
newV1= 1;    newV2= 1;     newV3= 1;     newV4.= 0;       newV4.1= 1
do n=2  for y-1
newV5= newV4.newV1 + newV4.newV1                      /*�*this is faster than:      @.#2 * 2   */
newV6= newV4.newV2 + newV4.newV2 + newV4.newV2               /*�*  "   "    "     "        @,#3 * 3   */
newV7= newV4.newV3 * 5
m= newV5              /*�*assume a minimum (of the 3 Hammings).*/
if newV6  < m   then m= newV6              /*�*is this number less than the minimum?*/
if newV7  < m   then m= newV7              /*�* "   "     "     "    "   "     "    */
newV4.n= m                           /*�*now,  assign the next Hamming number.*/
if newV5 == m   then newV1= newV1 + 1         /*�*number already defined?   Use next #.*/
if newV6 == m   then newV2= newV2 + 1         /*�*   "      "       "        "    "  " */
if newV7 == m   then newV3= newV3 + 1         /*�*   "      "       "        "    "  " */
end   /*�*n*/                          /*�* [↑]  maybe assign next Hamming #'s. */
do j=x  to y;      say 'Hamming('right(j, w)") ="     newV4.j
end   /*�*j*/

say right( 'length of last Hamming number ='     length(newV4.y), 70);        say
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hamming-numbers\hamming-numbers-2.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
