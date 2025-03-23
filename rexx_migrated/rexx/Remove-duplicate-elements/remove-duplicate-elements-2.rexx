/*ª*REXX program removes any duplicate elements (items) that are in a list (using a list).*/
newV1= '2 3 5 7 11 13 17 19 cats 222 -100.2 +11 1.1 +7 7. 7 5 5 3 2 0 4.4 2'    /*ª*item list.*/
say 'original list:'     newV1
say right( words(newV1), 17, 'â”€')    'words in the original list.'
newV2= words(newV1)                                      /*ª*process all the words in the list.   */
do j=newV2  by -1  for newV2;     y= word(newV1, j)                       /*ª*get right-to-Left. */
newV3= wordpos(y, newV1, j + 1);  if newV3\==0  then newV1= delword(newV1, newV3, 1)  /*ª*Dup? Then delete it*/
end   /*ª*j*/
say
say 'modified list:'     space(newV1)                /*ª*stick a fork in it,  we're all done. */
say right( words(z), 17, 'â”€')    'words in the modified list.'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Remove-duplicate-elements\remove-duplicate-elements-2.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
