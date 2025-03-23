/*�*REXX program computes  Hamming numbers:  1 ──► 20,  # 1691,  and  the  one millionth. */
numeric digits 100                               /*�*ensure enough decimal digits.        */
call hamming       1, 20                         /*�*show the 1st ──► twentieth Hamming #s*/
call hamming    1691                             /*�*show the 1,691st Hamming number.     */
call hamming 1000000                             /*�*show the  1 millionth Hamming number.*/
exit                                             /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
hamming: procedure; parse arg x,y;         if y==''  then y= x;       w= length(y)
newV1= 1;     newV2= 1;      newV3= 1;      newV4.= 0;        newV4.1= 1
do n=2  for y-1
newV4.n= min(2*newV4.newV1,  3*newV4.newV2,  5*newV4.newV3)   /*�*pick the minimum of 3 Hamming numbers*/
if 2*newV4.newV1 == newV4.n   then newV1= newV1 + 1   /*�*number already defined?  Use next #. */
if 3*newV4.newV2 == newV4.n   then newV2= newV2 + 1   /*�*   "      "       "       "    "  "  */
if 5*newV4.newV3 == newV4.n   then newV3= newV3 + 1   /*�*   "      "       "       "    "  "  */
end   /*�*n*/                          /*�* [↑]  maybe assign next 3 Hamming#s. */
do j=x  to y;     say  'Hamming('right(j, w)") ="    newV4.j
end   /*�*j*/

say right( 'length of last Hamming number ='     length(newV4.y), 70);        say
return
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Hamming-numbers\hamming-numbers-1.rexx was migrated on 23 Mar 2025 at 10:43:15
 * -------------------------------------------------------------------------
*/ 
