/*ช*REXX program displays lyrics to the infamous song   "99 Bottles of Beer on the Wall". */
parse arg N .;     if N=='' | N==","  then N=99  /*ช*allow number of bottles be specified.*/
/*ช* [โ]  downward count of beer bottles.*/
do newV1=N  by -1  for N                        /*ช*start the countdown and singdown.    */
say newV1  'bottle's(newV1)  "of beer on the wall," /*ช*sing the number bottles of beer.     */
say newV1  'bottle's(newV1)  "of beer."             /*ช*     ยทยทยท and also the song's refrain.*/
say 'Take one down, pass it around,'        /*ช*take a beer bottle  โโโ and share it.*/
m= newV1 - 1                                    /*ช*M:  the number of bottles we have now*/
if m==0  then m= 'no'                       /*ช*use word  "no"  instead of numeric 0.*/
say m  'bottle's(m)  "of beer on the wall." /*ช*sing the beer bottle inventory.      */
say                                         /*ช*show a blank line between the verses.*/
end   /*ช*#*/                                 /*ช*PSA:   Please drink responsibly.     */
/*ช*Not quite tanked?   Then sing it.    */
say 'No more bottles of beer on the wall,'       /*ช*Finally!            The last verse.  */
say 'no more bottles of beer.'                   /*ช*this is sooooooo sad and forlorn ยทยทยท */
say 'Go to the store and buy some more,'         /*ช*obtain replenishment of the beer.    */
say  N    'bottles of beer on the wall.'         /*ช*all is well in the ole town tavern.  */
exit                                             /*ช*we're all done,  and also sloshed !. */
/*ช*โโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโโ*/
s:  if arg(1)=1  then return '';    return 's'   /*ช*simple pluralizer for gooder English.*/
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\99-bottles-of-beer\99-bottles-of-beer.rexx was migrated on 23 Mar 2025 at 10:43:04
 * -------------------------------------------------------------------------
*/ 
