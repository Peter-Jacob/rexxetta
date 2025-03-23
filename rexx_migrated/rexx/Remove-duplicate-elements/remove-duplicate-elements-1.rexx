/*ª*REXX program removes any duplicate elements (items) that are in a list (using a hash).*/
newV2= '2 3 5 7 11 13 17 19 cats 222 -100.2 +11 1.1 +7 7. 7 5 5 3 2 0 4.4 2'    /*ª*item list.*/
say 'original list:'     newV2
say right( words(newV2), 17, 'â”€')    'words in the original list.'
z=;                              newV1.=             /*ª*initialize the NEW list & index list.*/
do j=1  for words(newV2);       y= word(newV2, j)   /*ª*process the words (items) in the list*/
if newV1.y==''  then z= z y;    newV1.y= .          /*ª*Not duplicated? Add to Z list,@ array*/
end   /*ª*j*/
say
say 'modified list:'     space(z)                /*ª*stick a fork in it,  we're all done. */
say right( words(z), 17, 'â”€')    'words in the modified list.'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Remove-duplicate-elements\remove-duplicate-elements-1.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
