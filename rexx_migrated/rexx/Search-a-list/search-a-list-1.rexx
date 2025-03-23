/*ª*REXX program searches a collection of strings   (an array of periodic table elements).*/
hay.=                                            /*ª*initialize the haystack collection.  */
hay.1  = 'sodium'
hay.2  = 'phosphorous'
hay.3  = 'californium'
hay.4  = 'copernicium'
hay.5  = 'gold'
hay.6  = 'thallium'
hay.7  = 'carbon'
hay.8  = 'silver'
hay.9  = 'curium'
hay.10 = 'copper'
hay.11 = 'helium'
hay.12 = 'sulfur'

needle = 'gold'                                  /*ª*we'll be looking for the gold.       */
upper needle                                     /*ª*in case some people capitalize stuff.*/
found=0                                          /*ª*assume the needle isn't found yet.   */

do j=1  while hay.j\==''               /*ª*keep looking in the haystack.        */
newV1=hay.j;     upper newV1                   /*ª*make it uppercase to be safe.        */
if newV1=needle  then do;  found=1         /*ª*we've found the needle in haystack.  */
leave           /*ª*   Â·Â·Â· and stop looking, of course.  */
end
end   /*ª*j*/

if found  then return j                          /*ª*return the haystack  index  number.  */
else say  needle  "wasn't found in the haystack!"
return 0                                         /*ª*indicates the needle  wasn't  found. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Search-a-list\search-a-list-1.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
