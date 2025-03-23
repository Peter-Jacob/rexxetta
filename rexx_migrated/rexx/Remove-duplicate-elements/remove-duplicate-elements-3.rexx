/*ª*REXX program removes any duplicate elements (items) that are in a list (using 2 lists)*/
old = '2 3 5 7 11 13 17 19 cats 222 -100.2 +11 1.1 +7 7. 7 5 5 3 2 0 4.4 2'
say 'original list:'   old
say right( words(old), 17, 'â”€')    'words in the original list.'
new=                                             /*ª*start with a clean  (list)  slate.   */
do j=1  for words(old);     newV1= word(old, j) /*ª*process the words in the  OLD  list. */
if wordpos(newV1, new)==0  then new= new newV1      /*ª*Doesn't exist?  Then add word to NEW.*/
end   /*ª*j*/
say
say 'modified list:'     space(new)              /*ª*stick a fork in it,  we're all done. */
say right( words(new), 17, 'â”€')    'words in the modified list.'
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Remove-duplicate-elements\remove-duplicate-elements-3.rexx was migrated on 23 Mar 2025 at 10:43:26
 * -------------------------------------------------------------------------
*/ 
