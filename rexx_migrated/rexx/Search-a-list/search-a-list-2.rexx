/*ª*REXX program searches a collection of strings   (an array of periodic table elements).*/
hay.0   =      1000                              /*ª*safely indicate highest item number. */
hay.200 = 'Binilnilium'
hay.98  = 'californium'
hay.6   = 'carbon'
hay.112 = 'copernicium'
hay.29  = 'copper'
hay.114 = 'flerovium'
hay.79  = 'gold'
hay.2   = 'helium'
hay.1   = 'hydrogen'
hay.82  = 'lead'
hay.116 = 'livermorium'
hay.15  = 'phosphorous'
hay.47  = 'silver'
hay.11  = 'sodium'
hay.16  = 'sulfur'
hay.81  = 'thallium'
hay.92  = 'uranium'
/*ª* [â†‘]  sorted by the element name.    */
needle  = 'gold'                                 /*ª*we'll be looking for the gold.       */
upper needle                                     /*ª*in case some people capitalize.      */
found=0                                          /*ª*assume the needle isn't found  (yet).*/

do j=1  for hay.0                      /*ª*start looking in haystack,  item 1.  */
newV1=hay.j;     upper newV1                   /*ª*make it uppercase just to be safe.   */
if newV1=needle  then do;  found=1         /*ª*we've found the needle in haystack.  */
leave           /*ª*  Â·Â·Â· and stop looking, of course.   */
end
end   /*ª*j*/

if found  then return j                          /*ª*return the haystack  index  number.  */
else say  needle  "wasn't found in the haystack!"
return 0                                         /*ª*indicates the needle  wasn't  found. */
/* -------------------------------------------------------------------------
 * REXX C:\Users\PeterJ\rexxetta\rexx\Search-a-list\search-a-list-2.rexx was migrated on 23 Mar 2025 at 10:43:27
 * -------------------------------------------------------------------------
*/ 
