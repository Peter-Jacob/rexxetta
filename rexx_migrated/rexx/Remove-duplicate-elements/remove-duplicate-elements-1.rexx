/*�*REXX program removes any duplicate elements (items) that are in a list (using a hash).*/
newV2= '2 3 5 7 11 13 17 19 cats 222 -100.2 +11 1.1 +7 7. 7 5 5 3 2 0 4.4 2'    /*�*item list.*/
say 'original list:'     newV2
say right( words(newV2), 17, '─')    'words in the original list.'
z=;                              newV1.=             /*�*initialize the NEW list & index list.*/
do j=1  for words(newV2);       y= word(newV2, j)   /*�*process the words (items) in the list*/
if newV1.y==''  then z= z y;    newV1.y= .          /*�*Not duplicated? Add to Z list,@ array*/
end   /*�*j*/
say
say 'modified list:'     space(z)                /*�*stick a fork in it,  we're all done. */
say right( words(z), 17, '─')    'words in the modified list.'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Remove-duplicate-elements\remove-duplicate-elements-1.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
