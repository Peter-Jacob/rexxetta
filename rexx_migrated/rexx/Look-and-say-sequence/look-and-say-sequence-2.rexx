/*�*REXX program displays the sequence (and/or lengths) for the    look and say    series.*/
parse arg N newV1 .                                  /*�*obtain optional arguments from the CL*/
if N=='' | N==","  then N= 20                    /*�*Not specified?  Then use the default.*/
if newV1=='' | newV1==","  then newV1=  1                    /*�* "      "         "   "   "     "    */
/*�* [↑]  !:   starting char for the seq.*/
do j=1  for abs(N)                          /*�*repeat a number of times to show NUMS*/
if j\==1  then newV1= lookNsay(newV1)               /*�*invoke function to calculate next #. */
if N<0    then say 'length['j"]:" length(newV1) /*�*Also,  display the sequence's length.*/
else say '['j"]:"      newV1          /*�*display the number to the terminal.  */
end   /*�*j*/
exit 0                                           /*�*stick a fork in it,  we're all done. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
lookNsay: procedure; parse arg x,,newV2 newV1            /*�*obtain the (passed) argument  {X}.   */
chSize= 1000                           /*�*define a sensible chunk size.        */
fin = '0'x                             /*�*use unique character to end scanning.*/
x= x || fin                            /*�*append the  FIN  character to string.*/
do k=1  by 0                      /*�*now,  process the given sequence.    */
y=  substr(x, k, 1)            /*�*pick off one character to examine.   */
if y==fin  then return newV2          /*�*if we're at the end, then we're done.*/
newV3= verify(x, y, , k)  - k         /*�*see how many characters we have of Y.*/
newV2= newV2  ||  newV3  ||  y                /*�*build the  "look and say"  sequence. */
k= k + newV3                          /*�*now, point to the next character.    */
if length(newV2)<chSize  then iterate /*�*Less than chunkSize?  Then keep going*/
newV1= newV1  ||  newV2                       /*�*append   $   to the  !  string.      */
newV2=                                /*�*now,  start   $   from scratch.      */
chSize= chSize + 100              /*�*bump the  chunkSize (length) counter.*/
end   /*�*k*/
return newV1 || newV2                           /*�*return the ! string plus the $ string*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Look-and-say-sequence\look-and-say-sequence-2.rexx was migrated on 23 Mar 2025 at 10:43:19
 * -------------------------------------------------------------------------
*/ 
