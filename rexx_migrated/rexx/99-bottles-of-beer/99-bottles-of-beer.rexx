/*�*REXX program displays lyrics to the infamous song   "99 Bottles of Beer on the Wall". */
parse arg N .;     if N=='' | N==","  then N=99  /*�*allow number of bottles be specified.*/
/*�* [↓]  downward count of beer bottles.*/
do newV1=N  by -1  for N                        /*�*start the countdown and singdown.    */
say newV1  'bottle's(newV1)  "of beer on the wall," /*�*sing the number bottles of beer.     */
say newV1  'bottle's(newV1)  "of beer."             /*�*     ··· and also the song's refrain.*/
say 'Take one down, pass it around,'        /*�*take a beer bottle  ─── and share it.*/
m= newV1 - 1                                    /*�*M:  the number of bottles we have now*/
if m==0  then m= 'no'                       /*�*use word  "no"  instead of numeric 0.*/
say m  'bottle's(m)  "of beer on the wall." /*�*sing the beer bottle inventory.      */
say                                         /*�*show a blank line between the verses.*/
end   /*�*#*/                                 /*�*PSA:   Please drink responsibly.     */
/*�*Not quite tanked?   Then sing it.    */
say 'No more bottles of beer on the wall,'       /*�*Finally!            The last verse.  */
say 'no more bottles of beer.'                   /*�*this is sooooooo sad and forlorn ··· */
say 'Go to the store and buy some more,'         /*�*obtain replenishment of the beer.    */
say  N    'bottles of beer on the wall.'         /*�*all is well in the ole town tavern.  */
exit                                             /*�*we're all done,  and also sloshed !. */
/*�*──────────────────────────────────────────────────────────────────────────────────────*/
s:  if arg(1)=1  then return '';    return 's'   /*�*simple pluralizer for gooder English.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\99-bottles-of-beer\99-bottles-of-beer.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
